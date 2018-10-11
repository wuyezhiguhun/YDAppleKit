//
//  YDSQLiteDB.swift
//  YDKit
//
//  Created by 王允顶 on 2018/8/19.
//  Copyright © 2018年 王允顶. All rights reserved.
//

//import Foundation
//#if os(iOS)
//import UIKit
//#else
//import AppKit
//#endif

import UIKit

let SQLITE_DATE = SQLITE_NULL + 1

private let SQLITE_STATIC = unsafeBitCast(0, to: sqlite3_destructor_type.self)
private let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self)

@objc(YDSQLiteDB)
class YDSQLiteDB: NSObject {

    var dbName: String = "YDOrmDB.db"
    let QUEUE_LABEL = "YDSQLiteBD"
    private var db: OpaquePointer? = nil
    private var queue: DispatchQueue!
    private let fmt = DateFormatter()
    private var path: String!
    
    //MARK: ---: 构造方法 :---
    init(dbName: String) {
        super.init()
        self.dbName = dbName
        //文件管理
        let fm = FileManager.default
        //DB文件目录路径
        var docDir = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0]
        
        #if os(OSX)
        let info = Bundle.main.infoDictionary!
        let appName: String = info["CFBundleName"] as! String
        docDir = (docDir as NSString).appendingPathComponent(appName)
        if !fm.fileExists(atPath: docDir) {
            do {
                
            } catch {
                print("创建DB目录错误： \(docDir) on macOS")
            }
        }
        #endif
        let path = (docDir as NSString).appendingPathComponent(self.dbName)
        if !(fm.fileExists(atPath: path)) {
            guard let rp = Bundle.main.resourcePath else { return }
            let from = (rp as NSString).appendingPathComponent(self.dbName)
            do {
                try fm.copyItem(atPath: from, toPath: path)
            } catch let error as NSError {
                print("DM_SQLiteDB - failed to copy writable version of DB!")
                print("Error - \(error.localizedDescription)")
                fm.createFile(atPath: path, contents: nil, attributes: nil)
            }
        }
        openDB(path: path)
    }
    
    private init(path: String) {
        super.init()
        openDB(path: path)
    }
    // MARK: ---: 析构函数 :---
    deinit {
        closeDB()
    }
    
    override var description: String {
        return "YDSQLiteDB: \(path)"
    }
    
    // MARK: ---: 类方法 :---
    class func openRO(path: String) -> YDSQLiteDB {
        let db = YDSQLiteDB(path: path)
        return db
    }
    
    // MARK: ---: 公共方法 :---
    func dbDate(dt: Date) -> String {
        return fmt.string(from:dt)
    }
    
    func dbDateFromString(str: String, format: String = "") -> Date? {
        let dtFormat = fmt.dateFormat
        if !format.isEmpty {
            fmt.dateFormat = format
        }
        let dt = fmt.date(from: str)
        if !format.isEmpty {
            fmt.dateFormat = dtFormat
        }
        return dt
    }
    
    func execute(sql: String, parameters: [Any]? = nil) -> CInt {
        var result: CInt = 0
        queue.sync {
            if let stmt = self.prepare(sql: sql, params: parameters) {
                result = self.execute(stmt: stmt, sql: sql)
            }
        }
        return result
    }
    
    //运行SQL查询参数
    func query(sql: String, parameters: [Any]? = nil) -> [[String: Any]] {
        var rows = [[String: Any]]()
        queue.sync {
            if let stmt = self.prepare(sql: sql, params: parameters) {
                rows = self.query(stmt: stmt, sql: sql)
            }
        }
        return rows
    }
    
    // 显示警告信息提供或最后一个错误
    func alert(msg: String) {
        DispatchQueue.main.async {
        #if os(iOS)
            let alertView = UIAlertView(title: "YDSQLiteDB", message: msg, delegate: nil, cancelButtonTitle: "OK")
            alertView.show()
            
        #else
            let alert = NSAlert()
            alert.addButton(withTitle:"OK")
            alert.messageText = "DM_SQLiteDB"
            alert.informativeText = msg
            alert.alertStyle = NSAlertStyle.warning
            alert.runModal()
            
        #endif
            
        }
    }
    
    // 获取版本号
    func getDBVersion() -> Int {
        var version = 0
        let arr = query(sql: "PRAGMA user_version")
        if arr.count == 1 {
            version = arr[0]["user_version"] as! Int
        }
        return version
    }
    
    // 设置版本号
    func setDBVersion(version: Int) {
        _ = execute(sql: "PRAGMA user_version=\(version)")
    }
    
    private func openDB(path: String) {
        queue = DispatchQueue(label: QUEUE_LABEL, attributes: [])
        fmt.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
        fmt.timeZone = NSTimeZone(forSecondsFromGMT: 0) as TimeZone
        fmt.dateFormat = "yyyy-MM-dd HH:mm:ss"
        // 打开数据库
        let cpath = path.cString(using: String.Encoding.utf8)
        let error = sqlite3_open(cpath, &db)
        if error != SQLITE_OK {
            print("YDSQLiteDB - 打开失败")
            sqlite3_close(db)
            return
        }
        print("YDSQLiteDB 成功打开")
    }
    private func closeDB() {
        if db != nil {
            let ud = UserDefaults.standard
            var launchCount = ud.integer(forKey: "LaunchCount")
            launchCount -= -1
            print("YDSQLiteDB - Launch count \(launchCount)")
            var clean = false
            if launchCount < 0 {
                clean = true
                launchCount = 500
            }
            ud.set(launchCount, forKey: "LaunchCount")
            ud.synchronize()
            if !clean {
                sqlite3_close(db)
                return
            }
            print("YDSQLiteDB - Optimize DB")
            let sql = "VACUUM; ANALYZE"
            if execute(sql: sql) != SQLITE_OK {
                print("YDSQLiteDB - Error cleaning DB")
            }
            sqlite3_close(db)
            
        }
    }
    
    //MARK: ---: 私有方法 :---
    private func prepare(sql: String, params: [Any]?) -> OpaquePointer? {
        var stmt: OpaquePointer? = nil
        let cSql = sql.cString(using: String.Encoding.utf8)
        let result = sqlite3_prepare_v2(self.db, cSql, -1, &stmt, nil)
        if result != SQLITE_OK {
            sqlite3_finalize(stmt)
            if let error = String(validatingUTF8: sqlite3_errmsg(self.db)) {
                let msg = "YDSQLiteDB - failed to prepare SQL: \(sql), Error:\(error)"
                print(msg)
            }
            return nil
        }
        if params != nil {
            let cntParams = sqlite3_bind_parameter_count(stmt)
            let cnt = CInt(params!.count)
            if cntParams != cnt {
                let msg = "SQLiteDB - failed to bind parameters, counts did not match. SQL: \(sql)"
                print(msg)
                return nil
            }
            var flag: CInt = 0
            for ndx in 1...cnt {
                if let txt = params![Int(ndx) - 1] as? String {
                    flag = sqlite3_bind_text(stmt, CInt(ndx), txt, -1, SQLITE_TRANSIENT)
                } else if let data = params![Int(ndx) - 1] as? NSData {
                    flag = sqlite3_bind_blob(stmt, CInt(ndx), data.bytes, CInt(data.length), SQLITE_TRANSIENT)
                } else if let date = params![Int(ndx) - 1] as? NSDate {
                    let txt = fmt.string(from: date as Date)
                    flag = sqlite3_bind_text(stmt, CInt(ndx), txt, -1, SQLITE_TRANSIENT)
                } else if let val = params![Int(ndx) - 1] as? Double {
                    flag = sqlite3_bind_double(stmt, CInt(ndx), CDouble(val))
                } else if let val = params![Int(ndx) - 1] as? Int {
                    flag = sqlite3_bind_int(stmt, CInt(ndx), CInt(val))
                } else {
                    flag = sqlite3_bind_null(stmt, CInt(ndx))
                }
                if flag != SQLITE_OK {
                    sqlite3_finalize(stmt)
                    if let error = String(validatingUTF8: sqlite3_errmsg(self.db)) {
                        let msg = "SQLiteDB - failed to bind for SQL: \(sql), Index: \(ndx) Error: \(error)"
                        print(msg)
                    }
                    return nil
                }
            }
            
        }
        
        
        return stmt
    }
    // 私有方法处理实际执行的SQL语句
    private func execute(stmt: OpaquePointer, sql: String) -> CInt {
        var result = sqlite3_step(stmt)
        
        return result
    }
    
    // 私有方法处理的实际执行一个SQL查询
    private func query(stmt: OpaquePointer, sql: String) -> [[String: Any]] {
        var rows = [[String: Any]]()
        
        
        
        return rows
    }
    
    
}



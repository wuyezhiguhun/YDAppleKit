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
    
    private func openDB(path: String) {
        
    }
    private func closeDB() {
        
    }
    
    //MARK: ---: 私有方法 :---
    private func prepare(sql: String, params: [Any]?) -> OpaquePointer? {
        var stmt: OpaquePointer 
        
        return stmt
    }
    // 私有方法处理实际执行的SQL语句
    private func execute(stmt: OpaquePointer, sql: String) -> CInt {
        var result = sqlite3_step(stmt)
        
        return result
    }
    
    
}



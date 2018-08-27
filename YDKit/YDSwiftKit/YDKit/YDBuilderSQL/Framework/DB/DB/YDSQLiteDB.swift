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
        
        
    }
    
    
    
}

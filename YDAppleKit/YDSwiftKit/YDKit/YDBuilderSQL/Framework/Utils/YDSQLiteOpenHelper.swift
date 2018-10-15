//
//  YDSQLiteOpenHelper.swift
//  YDKit
//
//  Created by 王允顶 on 2018/8/19.
//  Copyright © 2018年 王允顶. All rights reserved.
//

import UIKit

class YDSQLiteOpenHelper: NSObject {

    //默认数据库表名
    private var dbName: String = "YDOrmSQLite.db"
    //数据库版本号
    private var dbVersion: String = "1"
    
    private var db: YDOrmSQLiteDB?
    
    init(dbName: String, dbVersion: String) {
        super.init()
        self.dbName = dbName
        self.dbVersion = dbVersion

    }
 
    func getDb() -> YDOrmSQLiteDB {
        return self.db!
    }
}

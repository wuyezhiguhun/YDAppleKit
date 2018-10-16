//
//  YDOrmSQLiteDB.swift
//  YDKit
//
//  Created by 王允顶 on 2018/8/19.
//  Copyright © 2018年 王允顶. All rights reserved.
//

import UIKit

class YDOrmSQLiteDB: YDSQLiteDB {

    let createBuilder = YDOrmSQLCreateTableBuilder()
    
    //创建表（根据类+Orm创建对应的变）
    func createTable(cls: Swift.AnyClass) -> Int {
        let sql = createBuilder.createTable(orm: getOrm(cls)).build()
        return Int(execute(sql: sql))
    }
    
    //添加表字段
    //传递cls:目的技术为了找到对应的ORM映射配置
    func alterTableAddColmun(cls: Swift.AnyClass) -> Int {
        let orm = getOrm(cls)
        //1.定义构建查询表字段的SQL语句
        let builder = YDSQLSelectBuilder()
        
        
    }
    
    func getOrm(_ cls: Swift.AnyClass) -> YDOrm {
        let className = NSStringFromClass(cls)
        return YDTableTemplateConfig.sharedInstace.ormDic[className]!
    }
}

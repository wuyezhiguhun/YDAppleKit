//
//  YDOrmSQLInsertBuilder.swift
//  YDKit
//
//  Created by 王允顶 on 2018/8/16.
//  Copyright © 2018年 王允顶. All rights reserved.
//

//import UIKit
import Foundation

class YDOrmSQLInsertBuilder<T: NSObject>: YDSQLInsertBuilder {

    func insertIntoTableOrm(orm: YDOrm, obj: T) -> YDSQLInsertBuilder {
        var columns = Array<String>()
        var values = Array<Any>()
        columns.append((orm.key?.column)!)
        
        //采用KVC获取属性的值
        let key = orm.key?.property
        
        let table = YDTableInfo()
        table.tableId = 11
        table.tableAge = 54
        table.tableName = "41525"
        
        
        
//        let tableInfoName = YDTableInfo.value(forKey: "tableName")
        
        
        
//        let tableName = table.value(forKey: "tableName")
//
//
//        
//
//        let tableValue = table.value(forKey: "tableId")
//
//
//        let objValue = obj.value(forKey: "tableId")
        
        let property: String = orm.key?.property as! String
        
        let value = obj.value(forKey: property)
        
        
        values.append(value)
        
        //普通字段没有拼接
        for item in orm.items {
            columns.append(item.column)
            values.append(obj.value(forKey: item.property)!)
        }
        
        return self.insert().into().table(orm.tableName).colums(columns).values(values)
    }
    
    func insertTableOrm(orm: YDOrm, table: YDTableInfo) -> YDSQLInsertBuilder {
        var columns = Array<String>()
        var values = Array<Any>()
        columns.append((orm.key?.column)!)
        values.append(table.value(forKey: (orm.key?.property)!)!)
        for item in orm.items {
            columns.append(item.column)
            values.append(table.value(forKey: item.property)!)
        }
        return self.insert().into().table(orm.tableName).colums(columns).values(values)
    }
    
}


























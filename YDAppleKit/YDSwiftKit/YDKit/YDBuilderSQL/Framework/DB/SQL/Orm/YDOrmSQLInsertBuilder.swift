//
//  YDOrmSQLInsertBuilder.swift
//  YDKit
//
//  Created by 王允顶 on 2018/8/16.
//  Copyright © 2018年 王允顶. All rights reserved.
//

import UIKit

class YDOrmSQLInsertBuilder: YDSQLInsertBuilder {

    func insertTableOrm(orm: YDOrm, table: YDTableInfo) -> YDSQLInsertBuilder {
        var columns = Array<String>()
        var values = Array<Any>()
        columns.append((orm.key?.column)!)
        values.append(table.value(forKey: (orm.key?.property)!))
        for item in orm.items! {
            columns.append(item.column)
            values.append(table.value(forKey: item.property))
        }
        return self.insert().into().table(orm.tableName).colums(columns).values(values)
    }
    
}


























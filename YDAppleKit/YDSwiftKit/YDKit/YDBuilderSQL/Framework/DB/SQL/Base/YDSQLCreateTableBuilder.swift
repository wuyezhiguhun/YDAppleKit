//
//  YDSQLCreateTableBuilder.swift
//  YDAppleKit
//
//  Created by rowena on 2018/10/15.
//  Copyright © 2018年 wuyezhiguhun. All rights reserved.
//

import UIKit

class YDSQLCreateTableBuilder: YDSQLBuilder {

    func create() -> YDSQLCreateTableBuilder {
        self.sql.append("create ")
        return self
    }
    
    override func table(_ table: String) -> YDSQLCreateTableBuilder {
        self.sql.append("table IF NOT EXISTS ")
        return super.table(table) as! YDSQLCreateTableBuilder
    }
    
    func columnInt(_ column: String) -> YDSQLCreateTableBuilder {
        return self.column(column, type: "integer")
    }
    
    func column(_ column: String, type: String) -> YDSQLCreateTableBuilder {
        self.sql.append(column)
        self.sql.append(" \(type) ")
        return self
    }
}

//
//  YDBaseDao.swift
//  YDAppleKit
//
//  Created by rowena on 2018/10/12.
//  Copyright © 2018年 wuyezhiguhun. All rights reserved.
//

import UIKit

class YDBaseDao<T: NSObject>: NSObject {

    private var helper: YDOrmSQLiteOpenHelper?
    private let insertBuilder = YDOrmSQLInsertBuilder<T>()
    private let deleteBuilder = YDOrmSQLDeleteBuilder<T>()
    private let selectBuilder = YDOrmSQLSelectBuilder<T>()
    private let updateBuilder = YDOrmSQLUpdateBuilder<T>()
    
    init(helper: YDOrmSQLiteOpenHelper) {
        super.init()
        self.helper = helper
    }
    
    //插入数据
    func insert(obj: T) -> Int {
        let orm = getOrm(cls: T.classForCoder())
//        let sql = insertBuilder.insertTableOrm(orm: orm, table: <#T##YDTableInfo#>)
        
        
    }
    
    /**
     * 根据对象名获取类名
     *
     * @return 返回结构：项目名称.类名
     */
    func getOrm(cls: Swift.AnyClass) -> YDOrm {
        //返回结构：项目名称.k类名
        let className = NSStringFromClass(cls)
        let orm = YDTableTemplateConfig.sharedInstace.ormDic[className]
        return orm!
    }
}

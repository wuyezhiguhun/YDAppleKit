//
//  YDSwiftModuleRouterUrl.swift
//  YDKit
//
//  Created by rowena on 2018/8/1.
//  Copyright © 2018年 王允顶. All rights reserved.
//

import UIKit

/** Swift 单例模式 */
let YDModuleRouterSwiftSingletonUrl: String = "weixin.wuyezhiguhun/module.router/swift/singleton"
/** Swift 构建者模式SQL */
let YDModuleRouterSwiftBuilderSQLUrl: String = "weixin.wuyezhiguhun/module.router/swift/builder.sql"

class YDSwiftModuleRouterUrl: NSObject {
    
    class func loadModuleRouter() {
        YDRouter.shared().map(YDModuleRouterSwiftSingletonUrl, toControllerClass: YDSwiftSingletonController.classForCoder())
        YDRouter.shared().map(YDModuleRouterSwiftBuilderSQLUrl, toControllerClass: YDBuilderSQLController.classForCoder())
    }
//    func loadModuleRouter() {
//        YDRouter.shared().map(YDModuleRouterSwiftSingletonUrl, toControllerClass: YDSwiftSingletonController.classForCoder())
//        YDRouter.shared().map(YDModuleRouterSwiftBuilderSQLUrl, toControllerClass: YDBuilderSQLController.classForCoder())
//    }
}

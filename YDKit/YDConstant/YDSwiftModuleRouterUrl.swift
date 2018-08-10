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


class YDSwiftModuleRouterUrl: NSObject {

    class func loadModuleRouter() {
        YDRouter.shared().map(YDModuleRouterSwiftSingletonUrl, toControllerClass: YDSwiftSingletonController.classForCoder())
    }
    
}

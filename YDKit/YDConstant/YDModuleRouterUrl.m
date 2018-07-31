//
//  YDModuleRouterUrl.m
//  YDKit
//
//  Created by rowena on 2018/6/28.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import "YDModuleRouterUrl.h"
#import "YDNetworkingController.h"
#import "YDFactoryController.h"
#import "YDFactoryMapController.h"
#import "YDSingletonController.h"

/** 网络请求模块 */
NSString * const YDModuleRouterNetworkingUrl         = @"weixin.wuyezhiguhun/module.router/networking";
/** 工厂模式模块 */
NSString * const YDModuleRouterFactoryUrl            = @"weixin.wuyezhiguhun/module.router/factory";
/** 工厂模式应用之地图 */
NSString * const YDModuleRouterFactoryMapUrl         = @"weixin.wuyezhiguhun/module.router/factorymap";
/** 单例模式 */
NSString * const YDModuleRouterSingletonUrl          = @"weixin.wuyezhiguhun/module.router/singleton";

@implementation YDModuleRouterUrl

+ (void)load {
    [[YDRouter shared] map:YDModuleRouterNetworkingUrl toControllerClass:[YDNetworkingController class]];
    [[YDRouter shared] map:YDModuleRouterFactoryUrl toControllerClass:[YDFactoryController class]];
    [[YDRouter shared] map:YDModuleRouterFactoryMapUrl toControllerClass:[YDFactoryMapController class]];
    [[YDRouter shared] map:YDModuleRouterSingletonUrl toControllerClass:[YDSingletonController class]];
}

@end
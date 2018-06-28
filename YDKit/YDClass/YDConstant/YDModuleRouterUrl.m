//
//  YDModuleRouterUrl.m
//  YDKit
//
//  Created by rowena on 2018/6/28.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import "YDModuleRouterUrl.h"
#import "YDNetworkingController.h"

/** 网络请求模块 */
NSString * const YDModuleRouterNetworkingUrl         = @"com.wuyezhiguhun/module.router/networking";

@implementation YDModuleRouterUrl

+ (void)load {
    [[YDRouter shared] map:YDModuleRouterNetworkingUrl toControllerClass:[YDNetworkingController class]];
}

@end

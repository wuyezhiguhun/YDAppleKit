//
//  YDConstant.m
//  YDKit
//
//  Created by rowena on 2018/6/26.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import "YDConstant.h"
#import "YDNetworkingController.h"

@implementation YDConstant

+ (void)load {
    [[YDRouter shared] map:@"wuyezhiguhun/networking" toControllerClass:[YDNetworkingController class]];
}

@end

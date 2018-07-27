//
//  YDSingletonPattern.m
//  YDKit
//
//  Created by rowena on 2018/7/27.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import "YDSingletonPattern.h"

@implementation YDSingletonPattern

static YDSingletonPattern *instance = nil;

/**
 * 创建单例
 */
+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[YDSingletonPattern alloc] init];
    });
    return instance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    if (instance == nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            instance = [super allocWithZone:zone];
        });
    }
    return instance;
}

@end

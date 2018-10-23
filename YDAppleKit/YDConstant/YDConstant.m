//
//  YDConstant.m
//  YDKit
//
//  Created by rowena on 2018/6/26.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import "YDConstant.h"

@interface YDConstant()

/** 记录当前APP是哪个 */
@property (nonatomic, assign) YDAppType appType;

@end

@implementation YDConstant

static YDConstant *constant = nil;
/** 创建单例 */
+ (instancetype)shareConstant {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        constant = [[YDConstant alloc] init];
    });
    return constant;
}
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    if (constant == nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            constant = [super allocWithZone:zone];
        });
    }
    return constant;
}
- (instancetype)init {
    self = [super init];
    if (self) {
        self.appType = YDAppTypeObjectC;
        NSString *bundleId = [[NSBundle mainBundle] bundleIdentifier];
        if ([bundleId isEqualToString:@"com.wuyezhiguhun.YDKit"]) {
            self.appType = YDAppTypeObjectC;
        } else if ([bundleId isEqualToString:@"com.wuyezhiguhun.YDSwiftKit"]) {
            self.appType = YDAppTypeSwift;
        }
    }
    return self;
}
/**
 * 获取当前APP是哪个
 * @return 返回APP类型
 */
+ (YDAppType)appType {
    YDAppType type = YDAppTypeObjectC;
    NSString *bundleId = [[NSBundle mainBundle] bundleIdentifier];
    if ([bundleId isEqualToString:@"com.wuyezhiguhun.YDKit"]) {
        type = YDAppTypeObjectC;
    } else if ([bundleId isEqualToString:@"com.wuyezhiguhun.YDSwiftKit"]) {
        type = YDAppTypeSwift;
    }
    
    return type;
}
- (NSString *)appDelegateName {
    if (self.appType == YDAppTypeObjectC) {
        return @"YDObjectiveCAppDelegate";
    } else if (self.appType == YDAppTypeSwift) {
        return @"YDSwiftAppDelegate";
    }
    return @"YDObjectiveCAppDelegate";
}

/** 百度AI AppID */
- (NSString *)baiduAiAppID {
    if (self.appType == YDAppTypeObjectC) {
        return @"14521919";
    }
    return @"14521919";
}
/** 百度AI API key */
- (NSString *)baiduAiApiKey {
    if (self.appType == YDAppTypeObjectC) {
        return @"8TRBSX66tMdGfYGQUg5HjvBC";
    }
    return @"8TRBSX66tMdGfYGQUg5HjvBC";
}
/** 百度AI Secret Key */
- (NSString *)baiduAiSecretKey {
    if (self.appType == YDAppTypeObjectC) {
        return @"a8zwtdCGcFG4fGGqO7WDgLpoTgozsqSX";
    }
    return @"a8zwtdCGcFG4fGGqO7WDgLpoTgozsqSX";
}

@end

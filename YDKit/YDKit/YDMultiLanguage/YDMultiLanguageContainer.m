//
//  YDMultiLanguageContainer.m
//  YDKit
//
//  Created by rowena on 2018/6/28.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import "YDMultiLanguageContainer.h"

@interface YDMultiLanguageContainer ()
@property (nonatomic, strong) NSMutableArray *controllerList;
@end

@implementation YDMultiLanguageContainer

/**
 * 创建单例
 */
+ (instancetype)shared {
    static YDMultiLanguageContainer *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[YDMultiLanguageContainer alloc] init];
    });
    return sharedInstance;
}

/**
 * 添加一个控制器
 * @pram controller 待添加的控制器
 */
- (void)addLanguageChangeController:(NSObject<YDMultiLanguageChange> *)controller {
    [self.controllerList addObject:controller];
}
/**
 * 删除一个控制器
 * @pram controller 待删除的控制器
 */
- (void)removeLanguageChangeController:(NSObject<YDMultiLanguageChange> *)controller {
    [self.controllerList removeObject:controller];
}
/**
 * 删除所有的添加到多语言中的控制器
 */
- (void)removeLanguageChangeAllControllers {
    [self.controllerList removeAllObjects];
}
/**
 * 更新控制器中的多语言
 */
- (void)reloadAllControllerMultiLanguage {
    for (NSObject<YDMultiLanguageChange> *object in self.controllerList) {
        if ([object conformsToProtocol:@protocol(YDMultiLanguageChange)]) {
            [object reloadUIWhenLanguageChange];
        }
    }
}


#pragma mark -- get 函数
- (NSMutableArray *)controllerList {
    if (!_controllerList) {
        CFArrayCallBacks callBacks = {0,NULL,NULL,CFCopyDescription,CFEqual};
        _controllerList = (__bridge_transfer NSMutableArray *)(CFArrayCreateMutable(0, 0, &callBacks));
    }
    return _controllerList;
}

@end

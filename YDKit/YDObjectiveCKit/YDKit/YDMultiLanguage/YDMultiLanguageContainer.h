//
//  YDMultiLanguageContainer.h
//  YDKit
//
//  Created by rowena on 2018/6/28.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol YDMultiLanguageChange <NSObject>

@optional
- (void)reloadUIWhenLanguageChange;

@end

@interface YDMultiLanguageContainer : NSObject

/**
 * 创建单例
 */
+ (instancetype)shared;

/**
 * 添加一个控制器
 * @pram controller 待添加的控制器
 */
- (void)addLanguageChangeController:(NSObject<YDMultiLanguageChange> *)controller;
/**
 * 删除一个控制器
 * @pram controller 待删除的控制器
 */
- (void)removeLanguageChangeController:(NSObject<YDMultiLanguageChange> *)controller;
/**
 * 删除所有的添加到多语言中的控制器
 */
- (void)removeLanguageChangeAllControllers;
/**
 * 更新控制器中的多语言
 */
- (void)reloadAllControllerMultiLanguage;


@end




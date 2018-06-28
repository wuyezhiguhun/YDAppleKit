//
//  YDMultiLanguage.h
//  YDKit
//
//  Created by rowena on 2018/6/28.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import <Foundation/Foundation.h>

#define YDLanguage(key) [YDMultiLanguage get:key alter:nil]

/** 当前语言加载类型 */
typedef NS_ENUM(NSInteger, YDMultiLanguageType) {
    /** 汉语 */
    YDMultiLanguageTypeChinese     = 1,
    /** 英语 */
    YDMultiLanguageTypeEnglish     = 2,
    /** 法语 */
    YDMultiLanguageTypeFrench      = 3
};

@interface YDMultiLanguage : NSObject

/**
 * 读取当前设置的语言,默认设置汉语
 */
+ (YDMultiLanguageType)multiLanguageType;
/**
 * 设置多语言类型
 * @pram type 多语言类型
 */
+ (void)setMultiLanguageType:(YDMultiLanguageType)type;
/**
 * 读取当前的多语言
 */
+ (NSString *)get:(NSString *)key alter:(NSString *)alternate;

@end

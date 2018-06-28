//
//  YDMultiLanguage.m
//  YDKit
//
//  Created by rowena on 2018/6/28.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import "YDMultiLanguage.h"
#import "YDMultiLanguageContainer.h"

static NSBundle *bundle = nil;
/** UserDefaults 保存多语言的Key */
NSString * const YDLanguageCodeIdIndentifier = @"YDMultiLanguageCodeIdIndentifier";
/** 汉语 */
NSString * const YDLanguageChinese           = @"zh-Hans";
/** 英语 */
NSString * const YDLanguageEnglish           = @"en";
/** 法语 */
NSString * const YDLanguageFrench            = @"fr";


@implementation YDMultiLanguage

/**
 * 读取当前设置的语言,默认设置汉语
 */
+ (YDMultiLanguageType)multiLanguageType {
    NSString *currentType = [self currentMultiLanguageCode];
    if ([currentType isEqualToString:YDLanguageChinese]) {
        return YDMultiLanguageTypeChinese;
    }
    if ([currentType isEqualToString:YDLanguageEnglish]) {
        return YDMultiLanguageTypeEnglish;
    }
    if ([currentType isEqualToString:YDLanguageFrench]) {
        return YDMultiLanguageTypeFrench;
    }
    return YDMultiLanguageTypeChinese;
}
/**
 * 设置多语言类型
 * @pram type 多语言类型
 */
+ (void)setMultiLanguageType:(YDMultiLanguageType)type {
    switch (type) {
        case YDMultiLanguageTypeChinese:
            [self updateCurrentLanguage:YDLanguageChinese];
            [[YDMultiLanguageContainer shared] reloadAllControllerMultiLanguage];
            break;
        case YDMultiLanguageTypeFrench:
            [self updateCurrentLanguage:YDLanguageFrench];
            [[YDMultiLanguageContainer shared] reloadAllControllerMultiLanguage];
            break;
        case YDMultiLanguageTypeEnglish:
            [self updateCurrentLanguage:YDLanguageEnglish];
            [[YDMultiLanguageContainer shared] reloadAllControllerMultiLanguage];
            break;
        default:
            [self updateCurrentLanguage:YDLanguageChinese];
            [[YDMultiLanguageContainer shared] reloadAllControllerMultiLanguage];
            break;
    }
}
/**
 * 获取当前的多语言
 */
+ (NSString *)currentMultiLanguageCode {
    NSString *currentLanguage = [[NSUserDefaults standardUserDefaults] objectForKey:YDLanguageCodeIdIndentifier];
    if (currentLanguage) {
        return currentLanguage;
    } else {
        return YDLanguageChinese;
    }
}
//初始化
+ (void)initialize {
    NSString *currentLanguage = [[NSUserDefaults standardUserDefaults] objectForKey:YDLanguageCodeIdIndentifier];
    if (!currentLanguage || [currentLanguage length] == 0) {
        NSArray *setLanguageArray = @[YDLanguageChinese,YDLanguageFrench,YDLanguageEnglish];
        NSArray *array = [[NSBundle mainBundle] preferredLocalizations];
        NSString *current = nil;
        if (array && [array count] > 0) {
            current = [array firstObject];
        }
        if (current && [setLanguageArray containsObject:current]) {
            current = [array firstObject];
        } else {
            current = YDLanguageChinese;
        }
        [self updateCurrentLanguage:current];
    } else {
        [self updateCurrentLanguage:currentLanguage];
    }
}
/**
 * 更新保存的多语言
 */
+ (void)updateCurrentLanguage:(NSString *)currentLanguage {
    [[NSUserDefaults standardUserDefaults] setObject:currentLanguage forKey:YDLanguageCodeIdIndentifier];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self setMultiLanguage:currentLanguage];
}
/**
 * 设置多语言
 */
+ (void)setMultiLanguage:(NSString *)language {
    NSString *path = [[NSBundle mainBundle] pathForResource:language ofType:@"lproj"];
    bundle = [NSBundle bundleWithPath:path];
}

/**
 * 读取当前的多语言
 */
+ (NSString *)get:(NSString *)key alter:(NSString *)alternate {
    return [bundle localizedStringForKey:key value:alternate table:nil];
}



@end

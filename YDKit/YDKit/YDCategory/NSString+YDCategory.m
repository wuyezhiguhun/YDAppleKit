//
//  NSString+YDCategory.m
//  YDKit
//
//  Created by rowena on 2018/6/29.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import "NSString+YDCategory.h"

@implementation NSString (YDCategory)

/**
 * 字符串转字典
 * @return 返回字典
 */
- (NSDictionary *)dictionaryValue {
    NSData *jsonData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:jsonData
                                                               options:NSJSONReadingMutableContainers
                                                                 error:&error];
    if(error) {
        return nil;
    }
    return dictionary;
}

@end

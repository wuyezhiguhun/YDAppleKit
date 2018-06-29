//
//  NSDictionary+YDCategory.m
//  YDKit
//
//  Created by rowena on 2018/6/29.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import "NSDictionary+YDCategory.h"

@implementation NSDictionary (YDCategory)

/**
 * 字典转JSON字符串
 * @return JSON字符串
 */
- (NSString *)stringValue {
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    
    NSString *jsonString = @"";
    
    if (jsonData) {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    jsonString = [jsonString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];  //去除掉首尾的空白字符和换行字符
    [jsonString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    return jsonString;
}

@end

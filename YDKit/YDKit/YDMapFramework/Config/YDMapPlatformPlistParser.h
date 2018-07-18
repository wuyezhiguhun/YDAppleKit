//
//  YDMapPlatformPlistParser.h
//  YDKit
//
//  Created by rowena on 2018/7/18.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YDMapPlatformPlistParser : NSObject

+ (NSMutableArray *)parser;

+ (void)setMapType:(NSString *)type;

/**
 * 查看本地地图模式
 * @return 返回当前设置地图模式
 */
+ (NSString *)lookMapType;

@end

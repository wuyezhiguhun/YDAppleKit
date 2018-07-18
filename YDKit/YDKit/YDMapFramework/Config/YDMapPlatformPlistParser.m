//
//  YDMapPlatformPlistParser.m
//  YDKit
//
//  Created by rowena on 2018/7/18.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import "YDMapPlatformPlistParser.h"
#import "YDMapPlatform.h"

@interface YDMapPlatformPlistParser()

@property (nonatomic, strong) NSMutableArray *array;

@end

@implementation YDMapPlatformPlistParser

- (instancetype)init {
    if (self) {
        self.array = [[NSMutableArray alloc] init];
    }
    return self;
}

+ (NSMutableArray *)parser {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"YDConfig" ofType:@"map.plist"];
    NSArray *platformList = [NSArray arrayWithContentsOfFile:filePath];
    NSMutableArray *platformArray = [[NSMutableArray alloc] init];
    for (NSDictionary *dict in platformList) {
        @autoreleasepool {
            YDMapPlatform *platform = [[YDMapPlatform alloc] initWithDict:dict];
            [platformArray addObject:platform];
        }
    }
    return platformArray;
}

+ (void)setMapType:(NSString *)type {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"YDConfig" ofType:@"map.plist"];
    NSArray *platformList = [NSArray arrayWithContentsOfFile:filePath];
    NSMutableArray *platformArray = [NSMutableArray array];
    for (NSDictionary *dict in platformList) {
        NSString *mapId = [dict objectForKey:@"id"];
        NSMutableDictionary *platformDict = [NSMutableDictionary dictionaryWithDictionary:dict];
        if ([mapId isEqualToString:type]) {
            [platformDict setValue:@"YES" forKey:@"isOpen"];
        } else {
            [platformDict setValue:@"NO" forKey:@"isOpen"];
        }
        [platformArray addObject:platformDict];
    }
    [platformArray writeToFile:filePath atomically:NO];
}
/**
 * 查看本地地图模式
 * @return 返回当前设置地图模式
 */
+ (NSString *)lookMapType {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"YDConfig" ofType:@"map.plist"];
    NSArray *platformList = [NSArray arrayWithContentsOfFile:filePath];
    for (NSDictionary *dict in platformList) {
        NSString *isOpen = [dict objectForKey:@"isOpen"];
        if ([isOpen isEqualToString:@"YES"]) {
            return [dict objectForKey:@"id"];
        }
    }
    return @"";
}

@end

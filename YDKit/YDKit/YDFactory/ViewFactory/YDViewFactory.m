//
//  YDViewFactory.m
//  YDKit
//
//  Created by rowena on 2018/7/9.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import "YDViewFactory.h"
#import "YDViewXmlParser.h"

@implementation YDViewFactory

/**
 * 创建类
 * @pram key 需要创建的类的key
 * @return 返回工厂创建的类
 */
+ (NSObject *)getInstance:(NSString *)key {
    YDViewXmlParser *parser = [[YDViewXmlParser alloc] init];
    NSMutableDictionary *dict = [parser parser];
    return [[NSClassFromString([dict objectForKey:key]) alloc] init];
}

@end

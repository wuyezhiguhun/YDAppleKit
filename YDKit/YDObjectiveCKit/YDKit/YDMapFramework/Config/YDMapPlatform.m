//
//  YDMapPlatform.m
//  YDKit
//
//  Created by rowena on 2018/7/18.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import "YDMapPlatform.h"

@implementation YDMapPlatform

- (instancetype)initWithDict:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        self.mapId = dict[@"id"];
        self.appKey = dict[@"appKey"];
        self.factoryName = dict[@"factoryName"];
        self.isOpen = dict[@"isOpen"];
    }
    return self;
}

@end

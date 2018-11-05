//
//  YDBaiduAiAuthInfo.m
//  YDAppleKit
//
//  Created by rowena on 2018/10/23.
//  Copyright © 2018年 wuyezhiguhun. All rights reserved.
//

#import "YDBaiduAiAuthInfo.h"

@implementation YDBaiduAiAuthInfo


/**
 * 数据解析
 */
- (instancetype)initWithDict:(NSDictionary *)dict {
    self = [super init];
    if (self && dict) {
        self.access_token = [dict objectForKey:@"access_token"];
        self.expires_in = [dict objectForKey:@"expires_in"];
        self.refresh_token = [dict objectForKey:@"refresh_token"];
        self.scope = [dict objectForKey:@"scope"];
        self.session_key = [dict objectForKey:@"session_key"];
        self.session_secret = [dict objectForKey:@"session_secret"];
    }
    return self;
}

@end

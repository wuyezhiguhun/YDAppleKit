//
//  YDBaiduAiAuthInfo.h
//  YDAppleKit
//
//  Created by rowena on 2018/10/23.
//  Copyright © 2018年 wuyezhiguhun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>



@interface YDBaiduAiAuthInfo : NSObject

NS_ASSUME_NONNULL_BEGIN

@property (nonatomic, copy) NSString *access_token;
@property (nonatomic, copy) NSString *expires_in;
@property (nonatomic, copy) NSString *refresh_token;
@property (nonatomic, copy) NSString *scope;
@property (nonatomic, copy) NSString *session_key;
@property (nonatomic, copy) NSString *session_secret;

NS_ASSUME_NONNULL_END

/**
 * 数据解析
 */
- (instancetype)initWithDict:(NSDictionary *)dict;

@end



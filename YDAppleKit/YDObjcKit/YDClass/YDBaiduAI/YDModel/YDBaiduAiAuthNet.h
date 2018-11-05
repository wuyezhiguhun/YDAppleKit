//
//  YDBaiduAiAuthNet.h
//  YDAppleKit
//
//  Created by rowena on 2018/10/23.
//  Copyright © 2018年 wuyezhiguhun. All rights reserved.
//
//
/**
 * 百度AI 授权 接口
 */

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol YDBaiduAiAuthNetDelegate <NSObject>

@optional
- (void)baiduAiAuthNetStart;
- (void)baiduAiAuthNetSuccess:(NSDictionary *)success;
- (void)baiduAiAuthNetFailure:(NSString *)failure;

@end

@interface YDBaiduAiAuthNet : NSObject

/** 代理 */
@property (nonatomic, weak) id<YDBaiduAiAuthNetDelegate> delegate;

/**
 * 百度AI 授权 网络请求
 */
- (void)baiduAiAuthBaidubceNet;

@end

NS_ASSUME_NONNULL_END

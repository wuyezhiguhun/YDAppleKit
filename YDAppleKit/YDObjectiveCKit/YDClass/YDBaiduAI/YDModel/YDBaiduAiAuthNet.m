//
//  YDBaiduAiAuthNet.m
//  YDAppleKit
//
//  Created by rowena on 2018/10/23.
//  Copyright © 2018年 wuyezhiguhun. All rights reserved.
//

#import "YDBaiduAiAuthNet.h"
#import "YDBaiduAiMacro.h"
#import "YDNetworking.h"

@implementation YDBaiduAiAuthNet

/**
 * 百度AI 授权 网络请求
 */
- (void)baiduAiAuthBaidubceNet {
    
    NSDictionary *parameters = @{@"grant_type": YDBaiDuAiGrantType, YDBaiDuAiClientId: [YDConstant shareConstant].baiduAiApiKey, YDBaiDuAiClientSecret: [YDConstant shareConstant].baiduAiSecretKey};
    [YDNetworking GETWithURLString:YDBaiDuAIAuthURL parameters:parameters error:nil completionError:^(NSURLResponse * _Nonnull response, NSError * _Nullable error) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(baiduAiAuthNetFailure:)]) {
            [self.delegate baiduAiAuthNetFailure:error.description];
        }
    } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(baiduAiAuthNetSuccess:)]) {
            [self.delegate baiduAiAuthNetSuccess:responseObject];
        }
    }];
    if (self.delegate && [self.delegate respondsToSelector:@selector(baiduAiAuthNetStart)]) {
        [self.delegate baiduAiAuthNetStart];
    }

}

@end

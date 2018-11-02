//
//  YDConstant.h
//  YDKit
//
//  Created by rowena on 2018/6/26.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, YDAppType){
    YDAppTypeSwift       = 1,
    YDAppTypeObjectC     = 2,
    YDAppTypeiOS         = 3
};

@interface YDConstant : NSObject

/** 记录当前APP是哪个 */
@property (nonatomic, assign, readonly) YDAppType appType;
/** AppDelegate 名字 */
@property (nonatomic, copy, readonly) NSString *appDelegateName;
/** 百度AI AppID */
@property (nonatomic, copy, readonly) NSString *baiduAiAppID;
/** 百度AI API key */
@property (nonatomic, copy, readonly) NSString *baiduAiApiKey;
/** 百度AI Secret Key */
@property (nonatomic, copy, readonly) NSString *baiduAiSecretKey;



/** 创建单例 */
+ (instancetype)shareConstant;

@end

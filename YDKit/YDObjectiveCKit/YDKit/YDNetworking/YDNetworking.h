//
//  YDNetworking.h
//  YDThread
//
//  Created by 王允顶 on 2018/4/14.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@interface YDNetworking : NSObject

@property (nonatomic, strong) AFURLSessionManager *manager;

NS_ASSUME_NONNULL_BEGIN
/**
 * 创建单例
 * @return 返回对象
 */
+ (instancetype)shareNetworking;



/**
 * POST请求类方法,包含上传进度和下载进度
 * @pram urlString URL
 * @pram parameters 请求参数
 * @pram error 错误
 * @pram uploadProgressBlock 上传进度Block
 * @pram downloadProgressBlock 下载进度Block
 * @pram completionHandler 请求完成Block
 */
+ (void)POSTWithURLString:(nullable NSString *)urlString
               parameters:(nullable id)parameters
                    error:(NSError * _Nullable __autoreleasing *)error
           uploadProgress:(nullable void (^)(NSProgress *uploadProgress)) uploadProgressBlock
         downloadProgress:(nullable void (^)(NSProgress *downloadProgress)) downloadProgressBlock
        completionHandler:(nullable void (^)(NSURLResponse *response, id _Nullable responseObject,  NSError * _Nullable error))completionHandler;

/**
 * POST请求类方法，不包含上传进度和下载进度
 * @pram urlString URL
 * @pram parameters 请求参数
 * @pram error 错误
 * @pram completionHandler 请求完成Block
 */
+ (void)POSTWithURLString:(nullable NSString *)urlString
               parameters:(nullable id)parameters
                    error:(NSError * _Nullable __autoreleasing *)error
        completionHandler:(nullable void (^)(NSURLResponse *response, id _Nullable responseObject,  NSError * _Nullable error))completionHandler;


/**
 * GET请求类方法，包含上传进度和下载进度
 * @pram urlString URL
 * @pram parameters 请求参数
 * @pram error 错误
 * @pram uploadProgressBlock 上传进度Block
 * @pram downloadProgressBlock 下载进度Block
 * @pram completionHandler 请求完成Block
 */
+ (void)GETWithURLString:(nullable NSString *)urlString
              parameters:(nullable id)parameters
                   error:(NSError * _Nullable __autoreleasing *)error
          uploadProgress:(nullable void (^)(NSProgress *uploadProgress)) uploadProgressBlock
        downloadProgress:(nullable void (^)(NSProgress *downloadProgress)) downloadProgressBlock
       completionHandler:(nullable void (^)(NSURLResponse *response, id _Nullable responseObject,  NSError * _Nullable error))completionHandler;
/**
 * GET请类方法，不包含上传进度和下载进度
 * @pram urlString URL
 * @pram parameters 请求参数
 * @pram error 错误
 * @pram completionHandler 请求完成Block
 */
+ (void)GETWithURLString:(nullable NSString *)urlString
              parameters:(nullable id)parameters
                   error:(NSError * _Nullable __autoreleasing *)error
       completionHandler:(nullable void (^)(NSURLResponse *response, id _Nullable responseObject,  NSError * _Nullable error))completionHandler;


/**
 * POST请求对象方法,包含上传进度和下载进度
 * @pram urlString URL
 * @pram parameters 请求参数
 * @pram error 错误
 * @pram uploadProgressBlock 上传进度Block
 * @pram downloadProgressBlock 下载进度Block
 * @pram completionHandler 请求完成Block
 */
- (void)POSTWithURLString:(nullable NSString *)urlString
               parameters:(nullable id)parameters
                    error:(NSError * _Nullable __autoreleasing *)error
           uploadProgress:(nullable void (^)(NSProgress *uploadProgress)) uploadProgressBlock
         downloadProgress:(nullable void (^)(NSProgress *downloadProgress)) downloadProgressBlock
        completionHandler:(nullable void (^)(NSURLResponse *response, id _Nullable responseObject,  NSError * _Nullable error))completionHandler;
/**
 * POST请求对象方法，不包含上传进度和下载进度
 * @pram urlString URL
 * @pram parameters 请求参数
 * @pram error 错误
 * @pram completionHandler 请求完成Block
 */
- (void)POSTWithURLString:(nullable NSString *)urlString
               parameters:(nullable id)parameters
                    error:(NSError * _Nullable __autoreleasing *)error
        completionHandler:(nullable void (^)(NSURLResponse *response, id _Nullable responseObject,  NSError * _Nullable error))completionHandler;


/**
 * GET请求对方法，包含上传进度和下载进度
 * @pram urlString URL
 * @pram parameters 请求参数
 * @pram error 错误
 * @pram uploadProgressBlock 上传进度Block
 * @pram downloadProgressBlock 下载进度Block
 * @pram completionHandler 请求完成Block
 */
- (void)GETWithURLString:(nullable NSString *)urlString
              parameters:(nullable id)parameters
                   error:(NSError * _Nullable __autoreleasing *)error
          uploadProgress:(nullable void (^)(NSProgress *uploadProgress)) uploadProgressBlock
        downloadProgress:(nullable void (^)(NSProgress *downloadProgress)) downloadProgressBlock
       completionHandler:(nullable void (^)(NSURLResponse *response, id _Nullable responseObject,  NSError * _Nullable error))completionHandler;
/**
 * GET请求对象方法，不包含上传进度和下载进度
 * @pram urlString URL
 * @pram parameters 请求参数
 * @pram error 错误
 * @pram completionHandler 请求完成Block
 */
- (void)GETWithURLString:(nullable NSString *)urlString
              parameters:(nullable id)parameters
                   error:(NSError * _Nullable __autoreleasing *)error
       completionHandler:(nullable void (^)(NSURLResponse *response, id _Nullable responseObject,  NSError * _Nullable error))completionHandler;

NS_ASSUME_NONNULL_END

@end

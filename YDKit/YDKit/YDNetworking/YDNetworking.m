//
//  YDNetworking.m
//  YDThread
//
//  Created by 王允顶 on 2018/4/14.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import "YDNetworking.h"
#import <AFNetworking/AFNetworking.h>

@interface YDNetworking ()

@property (nonatomic, strong) AFURLSessionManager *manager;

@end

@implementation YDNetworking

/**
 * 创建单例
 * @return 返回对象
 */
+ (instancetype)shareNetworking {
    static YDNetworking *networking;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        networking = [[YDNetworking alloc] init];
    });
    return networking;
}

/**
 * POST请求类方法,包含上传进度和下载进度
 * @pram urlString URL
 * @pram parameters 请求参数
 * @pram error 错误
 * @pram uploadProgressBlock 上传进度Block
 * @pram downloadProgressBlock 下载进度Block
 * @pram completionHandler 请求完成Block
 */
+ (void)POSTWithURLString:(NSString *)urlString
               parameters:(id)parameters
                    error:(NSError *__autoreleasing *)error
           uploadProgress:(nullable void (^)(NSProgress *uploadProgress)) uploadProgressBlock
         downloadProgress:(nullable void (^)(NSProgress *downloadProgress)) downloadProgressBlock
        completionHandler:(nullable void (^)(NSURLResponse *response, id _Nullable responseObject,  NSError * _Nullable error))completionHandler {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    NSURLRequest *request = [[AFJSONRequestSerializer serializer] requestWithMethod:@"POST" URLString:urlString parameters:parameters error:error];

    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request uploadProgress:^(NSProgress * _Nonnull uploadProgress) {
        uploadProgressBlock(uploadProgress);
    } downloadProgress:^(NSProgress * _Nonnull downloadProgress) {
        downloadProgressBlock(downloadProgress);
        
    } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        completionHandler(response,responseObject,error);
    }];
    [dataTask resume];
}

/**
 * POST请求类方法，不包含上传进度和下载进度
 * @pram urlString URL
 * @pram parameters 请求参数
 * @pram error 错误
 * @pram completionHandler 请求完成Block
 */
+ (void)POSTWithURLString:(NSString *)urlString
               parameters:(id)parameters
                    error:(NSError *__autoreleasing *)error
        completionHandler:(nullable void (^)(NSURLResponse *response, id _Nullable responseObject,  NSError * _Nullable error))completionHandler {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    NSURLRequest *request = [[AFJSONRequestSerializer serializer] requestWithMethod:@"POST" URLString:urlString parameters:parameters error:error];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request uploadProgress:^(NSProgress * _Nonnull uploadProgress) {
    } downloadProgress:^(NSProgress * _Nonnull downloadProgress) {
    } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        completionHandler(response,responseObject,error);
    }];
    [dataTask resume];
}


/**
 * GET请求类方法，包含上传进度和下载进度
 * @pram urlString URL
 * @pram parameters 请求参数
 * @pram error 错误
 * @pram uploadProgressBlock 上传进度Block
 * @pram downloadProgressBlock 下载进度Block
 * @pram completionHandler 请求完成Block
 */
+ (void)GETWithURLString:(NSString *)urlString
               parameters:(id)parameters
                    error:(NSError *__autoreleasing *)error
           uploadProgress:(nullable void (^)(NSProgress *uploadProgress)) uploadProgressBlock
         downloadProgress:(nullable void (^)(NSProgress *downloadProgress)) downloadProgressBlock
        completionHandler:(nullable void (^)(NSURLResponse *response, id _Nullable responseObject,  NSError * _Nullable error))completionHandler {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    NSURLRequest *request = [[AFJSONRequestSerializer serializer] requestWithMethod:@"GET" URLString:urlString parameters:parameters error:error];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request uploadProgress:^(NSProgress * _Nonnull uploadProgress) {
        uploadProgressBlock(uploadProgress);
    } downloadProgress:^(NSProgress * _Nonnull downloadProgress) {
        downloadProgressBlock(downloadProgress);
        
    } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        completionHandler(response,responseObject,error);
    }];
    [dataTask resume];
}
/**
 * GET请类方法，不包含上传进度和下载进度
 * @pram urlString URL
 * @pram parameters 请求参数
 * @pram error 错误
 * @pram completionHandler 请求完成Block
 */
+ (void)GETWithURLString:(NSString *)urlString
              parameters:(id)parameters
                   error:(NSError *__autoreleasing *)error
       completionHandler:(nullable void (^)(NSURLResponse *response, id _Nullable responseObject,  NSError * _Nullable error))completionHandler {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    NSURLRequest *request = [[AFJSONRequestSerializer serializer] requestWithMethod:@"GET" URLString:urlString parameters:parameters error:error];
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request uploadProgress:^(NSProgress * _Nonnull uploadProgress) {
    } downloadProgress:^(NSProgress * _Nonnull downloadProgress) {
    } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        completionHandler(response,responseObject,error);
    }];
    [dataTask resume];
}


/**
 * POST请求对象方法,包含上传进度和下载进度
 * @pram urlString URL
 * @pram parameters 请求参数
 * @pram error 错误
 * @pram uploadProgressBlock 上传进度Block
 * @pram downloadProgressBlock 下载进度Block
 * @pram completionHandler 请求完成Block
 */
- (void)POSTWithURLString:(NSString *)urlString
               parameters:(id)parameters
                    error:(NSError *__autoreleasing *)error
           uploadProgress:(nullable void (^)(NSProgress *uploadProgress)) uploadProgressBlock
         downloadProgress:(nullable void (^)(NSProgress *downloadProgress)) downloadProgressBlock
        completionHandler:(nullable void (^)(NSURLResponse *response, id _Nullable responseObject,  NSError * _Nullable error))completionHandler {
    NSURLRequest *request = [[AFJSONRequestSerializer serializer] requestWithMethod:@"POST" URLString:urlString parameters:parameters error:error];
    NSURLSessionDataTask *dataTask = [self.manager dataTaskWithRequest:request uploadProgress:^(NSProgress * _Nonnull uploadProgress) {
        uploadProgressBlock(uploadProgress);
    } downloadProgress:^(NSProgress * _Nonnull downloadProgress) {
        downloadProgressBlock(downloadProgress);
        
    } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        completionHandler(response,responseObject,error);
    }];
    [dataTask resume];
}

/**
 * POST请求对象方法，不包含上传进度和下载进度
 * @pram urlString URL
 * @pram parameters 请求参数
 * @pram error 错误
 * @pram completionHandler 请求完成Block
 */
- (void)POSTWithURLString:(NSString *)urlString
               parameters:(id)parameters
                    error:(NSError *__autoreleasing *)error
        completionHandler:(nullable void (^)(NSURLResponse *response, id _Nullable responseObject,  NSError * _Nullable error))completionHandler {
    NSURLRequest *request = [[AFJSONRequestSerializer serializer] requestWithMethod:@"POST" URLString:urlString parameters:parameters error:error];
    NSURLSessionDataTask *dataTask = [self.manager dataTaskWithRequest:request uploadProgress:^(NSProgress * _Nonnull uploadProgress) {
    } downloadProgress:^(NSProgress * _Nonnull downloadProgress) {
    } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        completionHandler(response,responseObject,error);
    }];
    [dataTask resume];
}


/**
 * GET请求对方法，包含上传进度和下载进度
 * @pram urlString URL
 * @pram parameters 请求参数
 * @pram error 错误
 * @pram uploadProgressBlock 上传进度Block
 * @pram downloadProgressBlock 下载进度Block
 * @pram completionHandler 请求完成Block
 */
- (void)GETWithURLString:(NSString *)urlString
              parameters:(id)parameters
                   error:(NSError *__autoreleasing *)error
          uploadProgress:(nullable void (^)(NSProgress *uploadProgress)) uploadProgressBlock
        downloadProgress:(nullable void (^)(NSProgress *downloadProgress)) downloadProgressBlock
       completionHandler:(nullable void (^)(NSURLResponse *response, id _Nullable responseObject,  NSError * _Nullable error))completionHandler {
    NSURLRequest *request = [[AFJSONRequestSerializer serializer] requestWithMethod:@"GET" URLString:urlString parameters:parameters error:error];
    NSURLSessionDataTask *dataTask = [self.manager dataTaskWithRequest:request uploadProgress:^(NSProgress * _Nonnull uploadProgress) {
        uploadProgressBlock(uploadProgress);
    } downloadProgress:^(NSProgress * _Nonnull downloadProgress) {
        downloadProgressBlock(downloadProgress);
        
    } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        completionHandler(response,responseObject,error);
    }];
    [dataTask resume];
}
/**
 * GET请求对象方法，不包含上传进度和下载进度
 * @pram urlString URL
 * @pram parameters 请求参数
 * @pram error 错误
 * @pram completionHandler 请求完成Block
 */
- (void)GETWithURLString:(NSString *)urlString
              parameters:(id)parameters
                   error:(NSError *__autoreleasing *)error
       completionHandler:(nullable void (^)(NSURLResponse *response, id _Nullable responseObject,  NSError * _Nullable error))completionHandler {
    NSURLRequest *request = [[AFJSONRequestSerializer serializer] requestWithMethod:@"GET" URLString:urlString parameters:parameters error:error];
    NSURLSessionDataTask *dataTask = [self.manager dataTaskWithRequest:request uploadProgress:^(NSProgress * _Nonnull uploadProgress) {
    } downloadProgress:^(NSProgress * _Nonnull downloadProgress) {
    } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        completionHandler(response,responseObject,error);
    }];
    [dataTask resume];
}



#pragma mark -- get 函数
- (AFURLSessionManager *)manager {
    if (!_manager) {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        _manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    }
    return _manager;
}

@end

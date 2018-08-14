//
//  YDJokeNetworking.m
//  YDKit
//
//  Created by 王允顶 on 2018/8/14.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import "YDJokeNetworking.h"
#import "YDNetworking.h"

@implementation YDJokeNetworking

- (void)getJokeWithPageNum:(NSInteger)pageNum pageSize:(NSInteger)pageSize {
    
    NSString *appcode = @"你自己的AppCode";
    NSString *host = @"https://jisuxhdq.market.alicloudapi.com";
    NSString *path = @"/xiaohua/text";
    NSString *method = @"GET";
    NSString *querys = @"?pagenum=1&pagesize=1&sort=addtime";
    NSString *url = [NSString stringWithFormat:@"%@%@%@",  host,  path , querys];
    NSString *bodys = @"";
    
    YDNetworking *networking = [YDNetworking shareNetworking];

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString: url]  cachePolicy:1  timeoutInterval:  5];
    request.HTTPMethod  =  method;
    [request addValue:  [NSString  stringWithFormat:@"APPCODE %@" ,  appcode]  forHTTPHeaderField:  @"Authorization"];
    NSURLSession *requestSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionDataTask *task = [requestSession dataTaskWithRequest:request
                                                   completionHandler:^(NSData * _Nullable body , NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                                       NSLog(@"Response object: %@" , response);
                                                       NSString *bodyString = [[NSString alloc] initWithData:body encoding:NSUTF8StringEncoding];
                                                       
                                                       //打印应答中的body
                                                       NSLog(@"Response body: %@" , bodyString);
                                                   }];
    
    [task resume];
}

@end

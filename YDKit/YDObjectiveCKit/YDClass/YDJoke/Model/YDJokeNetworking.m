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
    
    NSString *host = @"https://jisuxhdq.market.alicloudapi.com";
    NSString *path = @"/xiaohua/text";
    NSString *method = @"GET";
    NSString *querys = [NSString stringWithFormat:@"?pagenum=%ld&pagesize=%ld&sort=rand",(long)pageNum,(long)pageSize];
    NSString *url = [NSString stringWithFormat:@"%@%@%@", host, path, querys];
 

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString: url]  cachePolicy:1  timeoutInterval:  5];
    request.HTTPMethod  =  method;
    [request addValue:@"APPCODE 9b2dd63024474f79b69a8aab70c8d658" forHTTPHeaderField:@"Authorization"];
    NSURLSession *requestSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionDataTask *task = [requestSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable body , NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"Response object: %@" , response);
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:body options:NSUTF8StringEncoding error:nil];
        NSMutableArray *mutableArray = [NSMutableArray array];
        NSDictionary *result = [dictionary objectForKey:@"result"];
        NSArray *listArray = [result objectForKey:@"list"];
        for (NSDictionary *dict in listArray) {
            NSString *content = [dict objectForKey:@"content"];
            [mutableArray addObject:content];
        }
        if (self.delegate && [self.delegate respondsToSelector:@selector(jokeNetworkingSuccess:)]) {
            [self.delegate jokeNetworkingSuccess:[mutableArray copy]];
        }
    }];
    
    [task resume];
}

@end

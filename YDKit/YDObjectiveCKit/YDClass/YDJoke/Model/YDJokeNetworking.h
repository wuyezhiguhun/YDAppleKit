//
//  YDJokeNetworking.h
//  YDKit
//
//  Created by 王允顶 on 2018/8/14.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol YDJokeNetworkingDelegate <NSObject>

@optional
- (void)jokeNetworkingStart;
- (void)jokeNetworkingSuccess:(NSArray *)success;
- (void)jokeNetworkingFailure:(NSArray *)failure;

@end

@interface YDJokeNetworking : NSObject

@property (nonatomic, weak) id <YDJokeNetworkingDelegate> delegate;

- (void)getJokeWithPageNum:(NSInteger)pageNum pageSize:(NSInteger)pageSize;

@end

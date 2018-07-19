//
//  YDLocationServiceDelegate.h
//  YDKit
//
//  Created by rowena on 2018/7/19.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YDUserLocation.h"

@class CLHeading;

//定位回调协议
@protocol YDLocationServiceDelegate <NSObject>

//实现相关delegate 处理位置信息更新
//处理方向变更信息
- (void)didUpdateUserHeadingLocation:(id<YDUserLocation>)userLocation;
- (void)didUpdateUserHeading:(CLHeading *)heading;

//处理位置坐标更新
- (void)didUpdateUserLocation:(id<YDUserLocation>)userLocation;

//定位失败后，调用此方法
- (void)didFailToLocateUserWithError:(NSError *)error;

@end

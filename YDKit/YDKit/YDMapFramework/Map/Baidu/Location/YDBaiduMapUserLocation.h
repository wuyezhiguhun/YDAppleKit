//
//  YDBaiduMapUserLocation.h
//  YDKit
//
//  Created by rowena on 2018/7/19.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <BaiduMapAPI_Base/BMKBaseComponent.h>
#import <BaiduMapAPI_Location/BMKLocationComponent.h>
#import "YDUserLocation.h"

@interface YDBaiduMapUserLocation : NSObject <YDUserLocation>

- (instancetype)initWithUserLocation:(BMKUserLocation *)userLocation;

@end

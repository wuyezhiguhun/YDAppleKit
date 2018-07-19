//
//  YDAmapMapUserLocation.h
//  YDKit
//
//  Created by rowena on 2018/7/19.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MAMapKit/MAMapKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <AMapLocationKit/AMapLocationKit.h>
#import "YDUserLocation.h"

@interface YDAmapMapUserLocation : NSObject<YDUserLocation>

- (instancetype)initWithUserLocation:(MAUserLocation *)userLocation;



@end

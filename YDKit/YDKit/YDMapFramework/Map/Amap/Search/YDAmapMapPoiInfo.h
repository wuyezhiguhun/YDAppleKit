//
//  YDAmapMapPoiInfo.h
//  YDKit
//
//  Created by rowena on 2018/7/27.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YDMapPoiInfo.h"
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <AMapSearchKit/AMapSearchKit.h>

@interface YDAmapMapPoiInfo : NSObject <YDMapPoiInfo>

- (instancetype)initWithPoi:(AMapPOI *)poi;

@end

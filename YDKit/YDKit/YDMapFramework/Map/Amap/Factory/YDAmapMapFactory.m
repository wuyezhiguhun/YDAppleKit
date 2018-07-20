//
//  YDAmapMapFactory.m
//  YDKit
//
//  Created by rowena on 2018/7/18.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import "YDAmapMapFactory.h"
#import "YDAmapMapView.h"
#import <AMapFoundation-NO-IDFA/AMapFoundationKit/AMapServices.h>
#import "YDAmapMapLocationService.h"

@implementation YDAmapMapFactory

- (instancetype)initWithAppKey:(NSString *)appKey {
    self = [super init];
    if (self) {
        [AMapServices sharedServices].apiKey = appKey;
    }
    return self;
}

//生产线
- (id<YDMapView>)getMapViewWithFrame:(CGRect)frame {
    return [[YDAmapMapView alloc] initWithFrame:frame];
}

//生产线 定位 （定位SDK生产线）
- (id<YDLocationService>)getMapLocationService {
    return [[YDAmapMapLocationService alloc] init];
}

@end

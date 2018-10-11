//
//  YDMapFactory.h
//  YDKit
//
//  Created by rowena on 2018/7/18.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YDMapView.h"
#import "YDLocationService.h"
#import "YDMapPoiSearch.h"


@protocol YDMapFactory <NSObject>

//每个地图都需要appKey
- (instancetype)initWithAppKey:(NSString *)appKey;

//生产线（视图生产线）
- (id<YDMapView>)getMapViewWithFrame:(CGRect)frame;

//生产线 定位 （定位SDK生产线）
- (id<YDLocationService>)getMapLocationService;

//生产线 - POI搜索
- (id<YDMapPoiSearch>)getMapPoiSearch;

@end

//
//  YDBaiduMapFactory.m
//  YDKit
//
//  Created by rowena on 2018/7/18.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import "YDBaiduMapFactory.h"
#import "YDBaiduMapView.h"
#import <BaiduMapAPI_Base/BMKBaseComponent.h>
#import <BaiduMapAPI_Map/BMKMapComponent.h>
#import "YDBaiduMapLocationService.h"
#import "YDBaiduMapPoiSearch.h"

@interface YDBaiduMapFactory()

@property (nonatomic, strong) BMKMapManager *mapManager;

@end

@implementation YDBaiduMapFactory

- (instancetype)initWithAppKey:(NSString *)appKey {
    self = [super init];
    if (self) {
        self.mapManager = [[BMKMapManager alloc] init];
        [self.mapManager start:appKey generalDelegate:nil];
    }
    return self;
}

//生产线
- (id<YDMapView>)getMapViewWithFrame:(CGRect)frame {
    return [[YDBaiduMapView alloc] initWithFrame:frame];
}

//生产线  定位 （定位SDK生产线）
- (id<YDLocationService>)getMapLocationService {
    return [[YDBaiduMapLocationService alloc] init];
}

//生产线 - POI搜索
- (id<YDMapPoiSearch>)getMapPoiSearch {
    return [[YDBaiduMapPoiSearch alloc] init];
}

@end

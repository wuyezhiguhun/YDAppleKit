//
//  YDAmapMapSearchResponse.m
//  YDKit
//
//  Created by rowena on 2018/7/27.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import "YDAmapMapSearchResponse.h"
#import "YDAmapMapPoiInfo.h"

@interface YDAmapMapSearchResponse()

@property (nonatomic, strong) AMapPOISearchResponse *searchResponse;

@end

@implementation YDAmapMapSearchResponse

- (instancetype)initWithResponse:(AMapPOISearchResponse *)response {
    self = [super init];
    if (self) {
        self.searchResponse = response;
    }
    return self;
}

//POI搜索关键字总数
- (NSInteger)getTotalPoiNum {
    return self.searchResponse.count;
}

//POI列表
- (NSArray<id<YDMapPoiInfo>>*)getPoiInfoList {
    NSMutableArray<id<YDMapPoiInfo>> *poiInfoArray = [[NSMutableArray alloc] init];
    for (AMapPOI *poiInfo in self.searchResponse.pois) {
        YDAmapMapPoiInfo *amapPoiInfo = [[YDAmapMapPoiInfo alloc] initWithPoi:poiInfo];
        [poiInfoArray addObject:amapPoiInfo];
    }
    return poiInfoArray;
}

//城市列表
- (NSArray<id<YDMapCityInfo>>*)getCityList {
    return nil;
}

@end

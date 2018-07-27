//
//  YDBaiduMapPoiSearchResponse.m
//  YDKit
//
//  Created by rowena on 2018/7/23.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import "YDBaiduMapPoiSearchResponse.h"
#import "YDBaiduMapPoiInfo.h"

@interface YDBaiduMapPoiSearchResponse()

@property (nonatomic, strong) BMKPOISearchResult *searchResult;

@end

@implementation YDBaiduMapPoiSearchResponse

- (instancetype)initWithResult:(BMKPOISearchResult *)result {
    self = [super init];
    if (self) {
        self.searchResult = result;
    }
    return self;
}

//POI搜索关键字总数
- (NSInteger)getTotalPoiNum {
    return self.searchResult.totalPOINum;
}

//POI列表
- (NSArray<id<YDMapPoiInfo>>*)getPoiInfoList {
    NSMutableArray<id<YDMapPoiInfo>> *poiArray = [NSMutableArray<id<YDMapPoiInfo>> array];
    for (BMKPoiInfo *poiInfo in self.searchResult.poiInfoList) {
        YDBaiduMapPoiInfo *baiduPoiInfo = [[YDBaiduMapPoiInfo alloc] initWithPoiInfo:poiInfo];
        [poiArray addObject:baiduPoiInfo];
    }
    return [poiArray copy];
}

//城市列表
- (NSArray<id<YDMapCityInfo>>*)getCityList {
    return nil;
}

@end

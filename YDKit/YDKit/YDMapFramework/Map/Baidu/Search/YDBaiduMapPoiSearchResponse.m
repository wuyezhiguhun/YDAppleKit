//
//  YDBaiduMapPoiSearchResponse.m
//  YDKit
//
//  Created by rowena on 2018/7/23.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import "YDBaiduMapPoiSearchResponse.h"

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
    return 0;
}

//POI列表
- (NSArray<id<YDMapPoiInfo>>*)getPoiInfoList {
    return nil;
}

//城市列表
- (NSArray<id<YDMapCityInfo>>*)getCityList {
    return nil;
}

@end

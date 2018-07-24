//
//  YDBaiduMapPoiSearch.m
//  YDKit
//
//  Created by rowena on 2018/7/23.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import "YDBaiduMapPoiSearch.h"
#import <BaiduMapAPI_Base/BMKBaseComponent.h>
#import <BaiduMapAPI_Search/BMKPoiSearch.h>
#import "YDBaiduMapPoiSearchResponse.h"
#import "YDBaiduMapPoiDetailResult.h"

@interface YDBaiduMapPoiSearch()<BMKPoiSearchDelegate>

@property (nonatomic, strong) BMKPoiSearch *poiSearch;
@property (nonatomic, weak) id<YDMapPoiSearchDelegate> delegate;

@end

@implementation YDBaiduMapPoiSearch

- (instancetype)init {
    self = [super init];
    if (self) {
        self.poiSearch = [[BMKPoiSearch alloc] init];
    }
    return self;
}

//POI搜索结果回调
- (void)setDelegate:(id<YDMapPoiSearchDelegate>)delegate {
    _delegate = delegate;
    if (delegate == nil) {
        self.poiSearch.delegate = nil;
    } else {
        self.poiSearch.delegate = self;
    }
}

//设置搜索条件
- (void)setSearchOption:(id<YDMapPoiSearchRequest>)option {
    BMKPOICitySearchOption *citySearchOption = [[BMKPOICitySearchOption alloc] init];
    citySearchOption.pageIndex = [option getPageIndex];
    citySearchOption.pageSize = [option getPageSize];
    citySearchOption.city = [option getCity];
    BOOL flag = [self.poiSearch poiSearchInCity:citySearchOption];
    if (flag) {
        NSLog(@"城市内检索发送成功");
    } else {
        NSLog(@"城市内检索发送失败");
    }
}


#pragma mark --- BMKPoiSearchDelegate

/**
 *返回POI搜索结果
 *@param searcher 搜索对象
 *@param poiResult 搜索结果列表
 *@param errorCode 错误号，@see BMKSearchErrorCode
 */
- (void)onGetPoiResult:(BMKPoiSearch*)searcher result:(BMKPOISearchResult*)poiResult errorCode:(BMKSearchErrorCode)errorCode {
    if (self.delegate && [self.delegate respondsToSelector:@selector(onGetPoiResul:errorCode:)]) {
        [self.delegate onGetPoiResul:[[YDBaiduMapPoiSearchResponse alloc] initWithResult:poiResult] errorCode:YD_MAP_SEARCH_NO_ERROR];
    }
}

/**
 *返回POI详情搜索结果
 *@param searcher 搜索对象
 *@param poiDetailResult 详情搜索结果
 *@param errorCode 错误号，@see BMKSearchErrorCode
 */
- (void)onGetPoiDetailResult:(BMKPoiSearch*)searcher result:(BMKPOIDetailSearchResult*)poiDetailResult errorCode:(BMKSearchErrorCode)errorCode {
    if (self.delegate && [self.delegate respondsToSelector:@selector(onGetPoiDetailResult:errorCode:)]) {
        [self.delegate onGetPoiDetailResult:[[YDBaiduMapPoiDetailResult alloc] initWithPoiDetailResult:poiDetailResult] errorCode:YD_MAP_SEARCH_NO_ERROR];
    }
}

/**
 *返回POI室内搜索结果
 *@param searcher 搜索对象
 *@param poiIndoorResult 搜索结果列表
 *@param errorCode 错误号，@see BMKSearchErrorCode
 */
- (void)onGetPoiIndoorResult:(BMKPoiSearch*)searcher result:(BMKPOIIndoorSearchResult*)poiIndoorResult errorCode:(BMKSearchErrorCode)errorCode {
    
}
@end

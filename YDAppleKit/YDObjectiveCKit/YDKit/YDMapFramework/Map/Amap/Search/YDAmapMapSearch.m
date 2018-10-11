//
//  YDAmapMapSearch.m
//  YDKit
//
//  Created by rowena on 2018/7/27.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import "YDAmapMapSearch.h"
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <AMapSearchKit/AMapSearchKit.h>
#import "YDAmapMapSearchResponse.h"

@interface YDAmapMapSearch ()<AMapSearchDelegate>

@property (nonatomic, strong) AMapSearchAPI *searchAPI;
@property (nonatomic, weak) id<YDMapPoiSearchDelegate> delegate;

@end

@implementation YDAmapMapSearch

- (instancetype)init {
    self = [super init];
    if (self) {
        self.searchAPI = [[AMapSearchAPI alloc] init];
    }
    return self;
}

//POI搜索结果回调
- (void)setDelegate:(id<YDMapPoiSearchDelegate>)delegate {
    _delegate = delegate;
    if (delegate == nil) {
        self.searchAPI.delegate = nil;
    } else {
        self.searchAPI.delegate = self;
    }
}

//设置搜索条件
- (void)setSearchOption:(id<YDMapPoiSearchRequest>)option {
    AMapPOIKeywordsSearchRequest *request = [[AMapPOIKeywordsSearchRequest alloc] init];
    request.keywords = [option getKeyword];
    request.city = [option getCity];
    
    request.requireExtension = YES;
    request.cityLimit = YES;
    request.requireSubPOIs = YES;
    
    [self.searchAPI AMapPOIKeywordsSearch:request];
}

#pragma mark -- AMapSearchDelegate
/**
 * @brief 当请求发生错误时，会调用代理的此方法.
 * @param request 发生错误的请求.
 * @param error   返回的错误.
 */
- (void)AMapSearchRequest:(id)request didFailWithError:(NSError *)error {
    
}

/**
 * @brief POI查询回调函数
 * @param request  发起的请求，具体字段参考 AMapPOISearchBaseRequest 及其子类。
 * @param response 响应结果，具体字段参考 AMapPOISearchResponse 。
 */
- (void)onPOISearchDone:(AMapPOISearchBaseRequest *)request response:(AMapPOISearchResponse *)response {
    if (self.delegate && [self.delegate respondsToSelector:@selector(onGetPoiResul:errorCode:)]) {
        [self.delegate onGetPoiResul:[[YDAmapMapSearchResponse alloc] initWithResponse:response] errorCode:YD_MAP_SEARCH_NO_ERROR];
    }
}



@end

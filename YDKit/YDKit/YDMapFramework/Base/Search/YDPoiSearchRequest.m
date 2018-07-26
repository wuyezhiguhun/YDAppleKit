//
//  YDPoiSearchRequest.m
//  YDKit
//
//  Created by rowena on 2018/7/24.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import "YDPoiSearchRequest.h"


@interface YDPoiSearchRequest()

@property (nonatomic, copy) NSString *keyword;

@property (nonatomic, copy) NSString *city;

@property (nonatomic, assign) NSInteger pageIndex;

@property (nonatomic, assign) NSInteger pageSize;

@end

@implementation YDPoiSearchRequest

//根据关键字搜索
- (void)setKeyword:(NSString *)keyword {
    _keyword = keyword;
}
- (NSString *)getKeyword {
    return _keyword;
}

//根据城市进行搜索
- (void)setCity:(NSString *)city {
    _city = city;
}
- (NSString *)getCity {
    return _city;
}

//分页索引，可选，默认为0
- (void)setPageIndex:(NSInteger)pageIndex {
    _pageIndex = pageIndex;
}
- (NSInteger)getPageIndex {
    return _pageIndex;
}

//分页数量，可选，默认为10，最多为50
- (void)setPageSize:(NSInteger)pageSize {
    _pageSize = pageSize;
}
- (NSInteger)getPageSize {
    return _pageSize;
}

@end

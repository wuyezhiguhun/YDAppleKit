//
//  YDMapPoiSearchRequest.h
//  YDKit
//
//  Created by rowena on 2018/7/23.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol YDMapPoiSearchRequest <NSObject>

//根据关键字搜索
- (void)setKeyword:(NSString *)keyword;
- (NSString *)getKeyword;

//根据城市进行搜索
- (void)setCity:(NSString *)city;
- (NSString *)getCity;

//分页索引，可选，默认为0
- (void)setPageIndex:(NSInteger)pageIndex;
- (NSInteger)getPageIndex;

//分页数量，可选，默认为10，最多为50
- (void)setPageSize:(NSInteger)pageSize;
- (NSInteger)getPageSize;

@end

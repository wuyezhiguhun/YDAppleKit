//
//  YDMapPoiSearchDelegate.h
//  YDKit
//
//  Created by rowena on 2018/7/23.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YDMapSearchErrorCode.h"
#import "YDMapPoiSearchResponse.h"
#import "YDMapPoiDetailResult.h"
#import "YDMapPoiIndoorResult.h"


@protocol YDMapPoiSearchDelegate <NSObject>


/**
 *返回POI搜索结果
 *@param poiResult 搜索结果列表
 *@param errorCode 错误号，@see BMKSearchErrorCode
 */
- (void)onGetPoiResul:(id<YDMapPoiSearchResponse>)poiResult errorCode:(YDMapSearchErrorCode)errorCode;

/**
 *返回POI详情搜索结果
 *@param poiDetailResult 详情搜索结果
 *@param errorCode 错误号，@see BMKSearchErrorCode
 */
- (void)onGetPoiDetailResult:(id<YDMapPoiDetailResult>)poiDetailResult errorCode:(YDMapSearchErrorCode)errorCode;

/**
 *返回POI室内搜索结果
 *@param poiIndoorResult 搜索结果列表
 *@param errorCode 错误号，@see BMKSearchErrorCode
 */
- (void)onGetPoiIndoorResult:(id<YDMapPoiIndoorResult>)poiIndoorResult errorCode:(YDMapSearchErrorCode)errorCode;

@end

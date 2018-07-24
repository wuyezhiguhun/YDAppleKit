//
//  YDBaiduMapPoiDetailResult.h
//  YDKit
//
//  Created by rowena on 2018/7/24.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YDMapPoiDetailResult.h"
#import <BaiduMapAPI_Base/BMKBaseComponent.h>
#import <BaiduMapAPI_Search/BMKPoiSearch.h>

@interface YDBaiduMapPoiDetailResult : NSObject<YDMapPoiDetailResult>

- (instancetype)initWithPoiDetailResult:(BMKPOIDetailSearchResult *)poiDetailResult;

@end

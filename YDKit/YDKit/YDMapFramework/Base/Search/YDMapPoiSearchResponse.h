//
//  YDMapPoiSearchResponse.h
//  YDKit
//
//  Created by rowena on 2018/7/23.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YDMapCityInfo.h"
#import "YDMapPoiInfo.h"

//POI响应
@protocol YDMapPoiSearchResponse <NSObject>

//POI搜索关键字总数
- (NSInteger)getTotalPoiNum;

//POI列表
- (NSArray<id<YDMapPoiInfo>>*)getPoiInfoList;

//城市列表
- (NSArray<id<YDMapCityInfo>>*)getCityList;

@end

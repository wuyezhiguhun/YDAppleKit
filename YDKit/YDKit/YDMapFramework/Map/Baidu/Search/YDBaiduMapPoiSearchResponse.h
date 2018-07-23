//
//  YDBaiduMapPoiSearchResponse.h
//  YDKit
//
//  Created by rowena on 2018/7/23.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YDMapPoiSearchResponse.h"
#import <BaiduMapAPI_Base/BMKBaseComponent.h>
#import <BaiduMapAPI_Search/BMKPoiSearch.h>

@interface YDBaiduMapPoiSearchResponse : NSObject <YDMapPoiSearchResponse>

- (instancetype)initWithResult:(BMKPOISearchResult *)result;

@end

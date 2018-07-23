//
//  YDMapPoiSearch.h
//  YDKit
//
//  Created by rowena on 2018/7/23.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YDMapPoiSearchDelegate.h"
#import "YDMapPoiSearchRequest.h"

@protocol YDMapPoiSearch <NSObject>

//POI搜索结果回调
- (void)setDelegate:(id<YDMapPoiSearchDelegate>)delegate;

//设置搜索条件
- (void)setSearchOption:(id<YDMapPoiSearchRequest>)option;

@end


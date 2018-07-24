//
//  YDMapPoiIndoorResult.h
//  YDKit
//
//  Created by rowena on 2018/7/23.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YDMapPoiIndoorInfo.h"

@protocol YDMapPoiIndoorResult<NSObject>

///本次POI室内搜索的总结果数
-(NSInteger)getTotalPoiNum;
///当前页的室内POI结果数
-(NSInteger)getCurrPoiNum;
///本次POI室内搜索的总页数
-(NSInteger)getPageNum;
///当前页的索引
-(int)getPageIndex;
///室内POI列表，成员是BMKPoiIndoorInfo
-(NSArray<id<YDMapPoiIndoorInfo>>*)getPoiIndoorInfoList;

@end


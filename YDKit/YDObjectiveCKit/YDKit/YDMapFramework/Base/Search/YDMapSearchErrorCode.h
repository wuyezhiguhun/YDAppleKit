//
//  YDMapSearchErrorCode.h
//  YDKit
//
//  Created by rowena on 2018/7/23.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import <Foundation/Foundation.h>

//检索结果状态码
typedef NS_ENUM(NSInteger, YDMapSearchErrorCode) {
    YD_MAP_SEARCH_NO_ERROR = 0,///<检索结果正常返回
    YD_MAP_SEARCH_AMBIGUOUS_KEYWORD,///<检索词有岐义
    YD_MAP_SEARCH_AMBIGUOUS_ROURE_ADDR,///<检索地址有岐义
    YD_MAP_SEARCH_NOT_SUPPORT_BUS,///<该城市不支持公交搜索
    YD_MAP_SEARCH_NOT_SUPPORT_BUS_2CITY,///<不支持跨城市公交
    YD_MAP_SEARCH_RESULT_NOT_FOUND,///<没有找到检索结果
    YD_MAP_SEARCH_ST_EN_TOO_NEAR,///<起终点太近
    YD_MAP_SEARCH_KEY_ERROR,///<key错误
    YD_MAP_SEARCH_NETWOKR_ERROR,///网络连接错误
    YD_MAP_SEARCH_NETWOKR_TIMEOUT,///网络连接超时
    YD_MAP_SEARCH_PERMISSION_UNFINISHED,///还未完成鉴权，请在鉴权通过后重试
    YD_MAP_SEARCH_INDOOR_ID_ERROR,///室内图ID错误
    YD_MAP_SEARCH_FLOOR_ERROR,///室内图检索楼层错误
    YD_MAP_SEARCH_INDOOR_ROUTE_NO_IN_BUILDING,///起终点不在支持室内路线的室内图内
    YD_MAP_SEARCH_INDOOR_ROUTE_NO_IN_SAME_BUILDING,///起终点不在同一个室内
    YD_MAP_SEARCH_PARAMETER_ERROR,///参数错误
};

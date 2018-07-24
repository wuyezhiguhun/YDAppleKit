//
//  YDBaiduMapPoiDetailResult.m
//  YDKit
//
//  Created by rowena on 2018/7/24.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import "YDBaiduMapPoiDetailResult.h"

@interface YDBaiduMapPoiDetailResult ()

@property (nonatomic, strong) BMKPOIDetailSearchResult *poiDetailResult;

@end

@implementation YDBaiduMapPoiDetailResult

- (instancetype)initWithPoiDetailResult:(BMKPOIDetailSearchResult *)poiDetailResult {
    self = [super init];
    if (self) {
        _poiDetailResult = poiDetailResult;
    }
    return self;
}

/// 符合条件的检索结果总个数
- (NSInteger)getTotalPOINum {
    return self.poiDetailResult.totalPOINum;
}
/// POI列表，成员是BMKPoiInfo
- (NSArray<id<YDMapPoiInfo>>*)getPoiInfoList {
    return self.poiDetailResult.poiInfoList;
}

/////POI名称
//-(NSString*)getName {
//    return self.poiDetailResult.name
//}
/////POI地址
//-(NSString*)getAddress {
//
//}
/////POI电话号码
//-(NSString*)getPhone {
//
//}
/////POIuid
//-(NSString*)getUid {
//
//}
/////POI标签
//-(NSString*)getTag {
//
//}
/////POI详情页url
//-(NSString*)getDetailUrl {
//
//}
/////POI所属分类，如“hotel”，“cater”，“life”
//-(NSString*)getType {
//
//}
/////POI地理坐标
//-(CLLocationCoordinate2D)getPt {
//
//}
/////POI价格
//-(double)getPrice {
//
//}
/////POI综合评分
//-(double)getOverallRating {
//
//}
/////POI口味评分
//-(double)getTasteRating {
//
//}
/////POI服务评分
//-(double)getServiceRating;
/////POI环境评分
//-(double)getEnvironmentRating;
/////POI设施评分
//-(double)getFacilityRating;
/////POI卫生评分
//-(double)getHygieneRating;
/////POI技术评分
//-(double)getTechnologyRating;
/////POI图片数目
//-(int)getImageNum;
/////POI团购数目
//-(int)getGrouponNum;
/////POI评论数目
//-(int)getCommentNum;
/////POI收藏数目
//-(int)getFavoriteNum;
/////POI签到数目
//-(int)getCheckInNum;
/////POI营业时间
//-(NSString*)getShopHours;


@end

//
//  YDMapPoiIndoorInfo.h
//  YDKit
//
//  Created by rowena on 2018/7/24.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@protocol YDMapPoiIndoorInfo <NSObject>

///POI名称
-(NSString*)getName;
///POIuid
-(NSString*)getUid;
///该室内POI所在 室内ID
-(NSString*)getIndoorId;
///该室内POI所在楼层
-(NSString*)getFloor;
///POI地址
-(NSString*)getAddress;
///POI所在城市
-(NSString*)getCity;
///POI电话号码
-(NSString*)getPhone;
///POI坐标
-(CLLocationCoordinate2D)getPt;
///POI标签
-(NSString*)gettag;
///价格
-(double)getPrice;
///星级（0-50），50表示五星
-(NSInteger)getStarLevel;
///是否有团购
-(BOOL)getGrouponFlag;
///是否有外卖
-(BOOL)getTakeoutFlag;
///是否排队
-(BOOL)getWaitedFlag;
///团购数,-1表示没有团购信息
-(NSInteger)getGrouponNum;

@end


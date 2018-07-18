//
//  YDMapFactory.h
//  YDKit
//
//  Created by rowena on 2018/7/18.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YDMapView.h"

@protocol YDMapFactory <NSObject>

//每个地图都需要appKey
- (instancetype)initWithAppKey:(NSString *)appKey;

//生产线（视图生产线）
- (id<YDMapView>)getMapViewWithFrame:(CGRect)frame;

@end

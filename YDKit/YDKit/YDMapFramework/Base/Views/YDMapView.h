//
//  YDMapView.h
//  YDKit
//
//  Created by rowena on 2018/7/18.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol YDMapView <NSObject>

//返回地图视图（父类的引用指向子类的实例对象）
- (UIView *)getView;

//构造方法需要指定MapView大小
- (instancetype)initWithFrame:(CGRect)frame;

@end

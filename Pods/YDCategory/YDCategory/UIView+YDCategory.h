//
//  UIView+YDCategory.h
//  Category
//
//  Created by rowena on 2018/9/12.
//  Copyright © 2018年 rowena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YDCategory)

/*------ 设置视图基本坐标 -------*/

//rect.origin.y = top
@property (nonatomic) CGFloat yd_top;

//rect.origin.x = left;
@property (nonatomic) CGFloat yd_left;

//rect.origin.y = bottom - CGRectGetHeight(self.frame);
@property (nonatomic) CGFloat yd_bottom;

//rect.origin.x = right - CGRectGetWidth(self.frame);
@property (nonatomic) CGFloat yd_right;

//rect.origin.x
@property (nonatomic) CGFloat yd_x;

//rect.origin.y
@property (nonatomic) CGFloat yd_y;

//CGRectGetWidth(self.frame)
@property (nonatomic) CGFloat yd_width;

//CGRectGetHeight(self.frame)
@property (nonatomic) CGFloat yd_height;

//size
@property (nonatomic) CGSize yd_size;

//origin
@property (nonatomic) CGPoint yd_origin;

/**
 *  设置视图中心点x轴坐标
 */
@property (nonatomic) CGFloat yd_centerX;

/**
 *  设置视图中心点y轴坐标
 */
@property (nonatomic) CGFloat yd_centerY;


/*========设置视图基本样式========*/
@property (nonatomic) BOOL yd_maskBounds;

@property (nonatomic) CGFloat yd_cornerRadius;

@property (nonatomic) CGFloat yd_borderWidth;

@property (nonatomic,strong) UIColor *yd_borderColor;

/**
 view的快照
 
 @return 快照
 */
- (UIImage *)yd_snapImage;

@end

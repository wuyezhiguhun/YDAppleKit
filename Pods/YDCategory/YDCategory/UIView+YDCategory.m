//
//  UIView+YDCategory.m
//  Category
//
//  Created by rowena on 2018/9/12.
//  Copyright © 2018年 rowena. All rights reserved.
//

#import "UIView+YDCategory.h"

@implementation UIView (YDCategory)

#pragma mark --- 设置视图基本坐标 ---
- (void)setYd_top:(CGFloat)yd_top {
    CGRect rect = self.frame;
    rect.origin.y = yd_top;
    self.frame = rect;
}

- (CGFloat)yd_top {
    return self.frame.origin.y;
}

- (void)setYd_left:(CGFloat)yd_left {
    CGRect rect = self.frame;
    rect.origin.x = yd_left;
    self.frame = rect;
}

- (CGFloat)yd_left {
    return self.frame.origin.x;
}

- (void)setYd_right:(CGFloat)yd_right {
    CGRect rect = self.frame;
    rect.origin.x = yd_right - CGRectGetWidth(self.frame);
    self.frame = rect;
}

- (CGFloat)yd_right {
    return self.frame.origin.x + CGRectGetWidth(self.frame);
}

- (void)setYd_bottom:(CGFloat)yd_bottom {
    CGRect rect = self.frame;
    rect.origin.y = yd_bottom - CGRectGetHeight(self.frame);
    self.frame = rect;
}

- (CGFloat)yd_bottom {
    return self.frame.origin.y + CGRectGetHeight(self.frame);
}

- (void)setYd_y:(CGFloat)yd_y {
    CGRect rect = self.frame;
    rect.origin.y = yd_y;
    self.frame = rect;
}

- (CGFloat)yd_y {
    return self.frame.origin.y;
}

- (void)setYd_x:(CGFloat)yd_x {
    CGRect rect = self.frame;
    rect.origin.x = yd_x;
    self.frame = rect;
}

- (CGFloat)yd_x {
    return self.frame.origin.x;
}

- (void)setYd_width:(CGFloat)yd_width {
    CGRect rect = self.frame;
    rect.size.width = yd_width;
    self.frame = rect;
}

- (CGFloat)yd_width {
    return CGRectGetWidth(self.frame);
}

- (void)setYd_height:(CGFloat)yd_height {
    CGRect rect = self.frame;
    rect.size.height = yd_height;
    self.frame = rect;
}

- (CGFloat)yd_height {
    return CGRectGetHeight(self.frame);
}

- (void)setYd_size:(CGSize)yd_size {
    CGRect rect = self.frame;
    rect.size = yd_size;
    self.frame = rect;
}

- (CGSize)yd_size {
    return self.frame.size;
}

- (void)setYd_origin:(CGPoint)yd_origin {
    CGRect rect = self.frame;
    rect.origin = yd_origin;
    self.frame = rect;
}

- (CGPoint)yd_origin {
    return self.frame.origin;
}

- (CGFloat)yd_centerX {
    
    return self.center.x;
}

- (CGFloat)yd_centerY {
    
    return self.center.y;
}

- (void)setYd_centerX:(CGFloat)yd_centerX {
    
    CGPoint center  = CGPointMake(self.yd_centerX, self.yd_centerY);
    center.x        = yd_centerX;
    
    self.center     = center;
}

- (void)setYd_centerY:(CGFloat)yd_centerY {
    
    CGPoint center  = CGPointMake(self.yd_centerX, self.yd_centerY);
    center.y        = yd_centerY;
    
    self.center     = center;
}

#pragma mark --- 设置视图基本样式 ---

- (void)setYd_maskBounds:(BOOL)yd_maskBounds {
    self.layer.masksToBounds = yd_maskBounds;
}

- (BOOL)yd_maskBounds {
    return self.layer.masksToBounds;
}

- (void)setYd_cornerRadius:(CGFloat)yd_cornerRadius {
    self.layer.cornerRadius = yd_cornerRadius;
}

- (CGFloat)yd_cornerRadius {
    return self.layer.cornerRadius;
}

- (void)setYd_borderWidth:(CGFloat)yd_borderWidth {
    if (self.layer.masksToBounds == NO) {
        self.layer.masksToBounds = YES;
    }
    self.layer.borderWidth = yd_borderWidth;
}

- (CGFloat)yd_borderWidth {
    return self.layer.borderWidth;
}

- (void)setYd_borderColor:(UIColor *)yd_borderColor {
    if (self.layer.masksToBounds == NO) {
        self.layer.masksToBounds = YES;
    }
    self.layer.borderColor = yd_borderColor.CGColor;
}

- (UIColor *)yd_borderColor {
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

- (UIImage *)yd_snapImage {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, [UIScreen mainScreen].scale);
    //UIGraphicsBeginImageContext(self.bounds.size);
    //[self drawViewHierarchyInRect:self.bounds afterScreenUpdates:YES];
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end

//
//  UIView+WeicyCommon.m
//  Common
//
//  Created by CityDoWCY on 2020/12/2.
//

#import "UIView+WeicyCommon.h"
#import <objc/runtime.h>

@implementation UIView (WeicyCommon)

#pragma mark - frame
// Get方法
- (CGFloat)weicy_x {
    return self.frame.origin.x;
}

- (CGFloat)weicy_y {
    return self.frame.origin.y;
}

- (CGFloat)weicy_centerX {
    return self.center.x;
}

- (CGFloat)weicy_centerY {
    return self.center.y;
}

- (CGFloat)weicy_maxX {
    return CGRectGetMaxX(self.frame);
}

- (CGFloat)weicy_maxY {
    return CGRectGetMaxY(self.frame);
}

- (CGFloat)weicy_width {
    return self.frame.size.width;
}

- (CGFloat)weicy_height {
    return self.frame.size.height;
}

- (CGSize)weicy_size {
    return self.frame.size;
}

- (CGPoint)weicy_origin {
    return self.frame.origin;
}

- (CGFloat)weicy_left {
    return self.frame.origin.x;
}

- (CGFloat)weicy_top {
    return self.frame.origin.y;
}

- (CGFloat)weicy_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (CGFloat)weicy_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

// Set方法
- (void)setWeicy_x:(CGFloat)weicy_x {
    CGRect frame = self.frame;
    frame.origin.x = weicy_x;
    self.frame = frame;
}

- (void)setWeicy_y:(CGFloat)weicy_y {
    CGRect frame = self.frame;
    frame.origin.y = weicy_y;
    self.frame = frame;
}

- (void)setWeicy_centerX:(CGFloat)weicy_centerX {
    CGPoint center = self.center;
    center.x = weicy_centerX;
    self.center = center;
}

- (void)setWeicy_centerY:(CGFloat)weicy_centerY {
    CGPoint center = self.center;
    center.y = weicy_centerY;
    self.center = center;
}

- (void)setWeicy_maxX:(CGFloat)weicy_maxX {
    CGRect frame = self.frame;
    frame.origin.x = weicy_maxX - frame.size.width;
    self.frame = frame;
}

- (void)setWeicy_maxY:(CGFloat)weicy_maxY {
    CGRect frame = self.frame;
    frame.origin.y = weicy_maxY - frame.size.height;
    self.frame = frame;
}

- (void)setWeicy_width:(CGFloat)weicy_width {
    CGRect frame = self.frame;
    frame.size.width = weicy_width;
    self.frame = frame;
}

- (void)setWeicy_height:(CGFloat)weicy_height {
    CGRect frame = self.frame;
    frame.size.height = weicy_height;
    self.frame = frame;
}

- (void)setWeicy_size:(CGSize)weicy_size {
    CGRect frame = self.frame;
    frame.size = weicy_size;
    self.frame = frame;
}

- (void)setWeicy_origin:(CGPoint)weicy_origin {
    CGRect frame = self.frame;
    frame.origin = weicy_origin;
    self.frame = frame;
}

- (void)setWeicy_left:(CGFloat)weicy_left {
    CGRect frame = self.frame;
    frame.origin.x = weicy_left;
    self.frame = frame;
}

- (void)setWeicy_top:(CGFloat)weicy_top {
    CGRect frame = self.frame;
    frame.origin.y = weicy_top;
    self.frame = frame;
}

- (void)setWeicy_right:(CGFloat)weicy_right {
    CGRect frame = self.frame;
    frame.origin.x = weicy_right - frame.size.width;
    self.frame = frame;
}

- (void)setWeicy_bottom:(CGFloat)weicy_bottom {
    CGRect frame = self.frame;
    frame.origin.y = weicy_bottom - frame.size.height;
    self.frame = frame;
}

#pragma mark - 截屏
- (UIImage *)weicy_snapshotImage {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *snap = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snap;
}

- (UIImage *)weicy_snapshotImageAfterScreenUpdates:(BOOL)afterUpdates {
    if (![self respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)]) {
        return [self weicy_snapshotImage];
    }
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0);
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:afterUpdates];
    UIImage *snap = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snap;
}

#pragma mark - 阴影
/// layer 添加全部阴影
/// @param color 阴影颜色
/// @param offset 偏移量
/// @param radius 角度
- (void)weicy_setLayerShadow:(nullable UIColor*)color offset:(CGSize)offset opacity:(CGFloat)opacity radius:(CGFloat)radius {
    self.layer.shadowColor = color.CGColor;
    self.layer.shadowOffset = offset;
    self.layer.shadowRadius = radius;
    self.layer.shadowOpacity = opacity;
    self.layer.shouldRasterize = YES;
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
}

- (void)weicy_setBezierShadow:(nullable UIColor *)shadowColor opacity:(CGFloat)shadowOpacity radius:(CGFloat)shadowRadius shadowSide:(WeicyShadowPathType)shadowPathType pathWidth:(CGFloat)shadowPathWidth {
    
    self.layer.masksToBounds = NO;
    self.layer.shadowColor = shadowColor.CGColor;
    self.layer.shadowOpacity = shadowOpacity;
    self.layer.shadowRadius = shadowRadius;
    self.layer.shadowOffset = CGSizeZero;
    
    CGRect shadowRect;
    CGFloat originX = 0;
    CGFloat originY = 0;
    CGFloat originW = self.bounds.size.width;
    CGFloat originH = self.bounds.size.height;
    
    switch (shadowPathType) {
        case WeicyShadowPathTypeTop:
            shadowRect  = CGRectMake(originX, originY - shadowPathWidth/2, originW,  shadowPathWidth);
            break;
            
        case WeicyShadowPathTypeLeft:
            shadowRect  = CGRectMake(originX - shadowPathWidth/2, originY, shadowPathWidth, originH);
            break;
            
        case WeicyShadowPathTypeBottom:
            shadowRect  = CGRectMake(originX, originH -shadowPathWidth/2, originW, shadowPathWidth);
            break;
            
        case WeicyShadowPathTypeRight:
            shadowRect  = CGRectMake(originW - shadowPathWidth/2, originY, shadowPathWidth, originH);
            break;
            
        case WeicyShadowPathTypeNoTop:
            shadowRect  = CGRectMake(originX -shadowPathWidth/2, originY +1, originW +shadowPathWidth,originH + shadowPathWidth/2 );
            break;
            
        case WeicyShadowPathTypeAll:
            shadowRect  = CGRectMake(originX - shadowPathWidth/2, originY - shadowPathWidth/2, originW +  shadowPathWidth, originH + shadowPathWidth);
            break;
            
        default:
            break;
    }
    
    UIBezierPath *path =[UIBezierPath bezierPathWithRect:shadowRect];
    self.layer.shadowPath = path.CGPath;
}

/// 移除全部子视图
- (void)weicy_removeAllSubviews {
    //[self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    while (self.subviews.count) {
        [self.subviews.lastObject removeFromSuperview];
    }
}

#pragma mark - 渐变
- (void)weicy_gradientBgColorWithColors:(NSArray *)colors locations:(NSArray *)locations startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint {
    CAGradientLayer *gradientLayer = [self weicy_gradientLayerWithColors:colors frame:self.bounds locations:locations startPoint:startPoint endPoint:endPoint];
    [self.layer insertSublayer:gradientLayer atIndex:0];
}

- (CAGradientLayer *)weicy_gradientLayerWithColors:(NSArray *)colors frame:(CGRect)frm locations:(NSArray *)locations startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    if (colors == nil || [colors isKindOfClass:[NSNull class]] || colors.count == 0){
        return nil;
    }
    if (locations == nil || [locations isKindOfClass:[NSNull class]] || locations.count == 0){
        return nil;
    }
    NSMutableArray *colorsTemp = [NSMutableArray new];
    for (UIColor *color in colors) {
        if ([color isKindOfClass:[UIColor class]]) {
            [colorsTemp addObject:(__bridge id)color.CGColor];
        }
    }
    gradientLayer.colors = colorsTemp;
    gradientLayer.locations = locations;
    gradientLayer.startPoint = startPoint;
    gradientLayer.endPoint = endPoint;
    gradientLayer.frame =  frm;
    return gradientLayer;
}


@end

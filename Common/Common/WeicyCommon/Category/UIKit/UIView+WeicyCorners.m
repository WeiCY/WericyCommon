//
//  UIView+WeicyCorners.m
//  Common
//
//  Created by CityDoWCY on 2020/12/2.
//

#import "UIView+WeicyCorners.h"

@implementation UIView (WeicyCorners)

- (void)weicy_useBezierPathClipCornerWithType:(WeicyViewCornerType)cornerType WithCornerRadius:(CGFloat)cornerRadius {
    
    [self makeCornerWithMaskPath:[self getBezierPathWithUILayoutCornerType:cornerType WithCornerRadius:cornerRadius]];
}

- (void)weicy_useBezierPathClipCornerWithType:(WeicyViewCornerType)cornerType WithCornerRadius:(CGFloat)cornerRadius WithBorderColor:(UIColor *)color withBorderWidth:(CGFloat)width {
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = self.bounds;
    shapeLayer.path = [[self getBezierPathWithUILayoutCornerType:cornerType WithCornerRadius:cornerRadius] CGPath];
    shapeLayer.lineWidth = width;
    shapeLayer.strokeColor = color.CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    [self.layer addSublayer:shapeLayer];
    
    [self weicy_useBezierPathClipCornerWithType:cornerType WithCornerRadius:cornerRadius];
}

#pragma mark - 添加边框
- (void)weicy_useCALayerMakeBorderLineWithBorderColor:(UIColor *)color borderWidth:(CGFloat)width {
    self.layer.borderColor = color.CGColor;//设置边框颜色
    self.layer.borderWidth = width;//设置边框颜色
}

#pragma mark - 私有处理方法
- (UIBezierPath *)getBezierPathWithUILayoutCornerType:(WeicyViewCornerType)cornerType WithCornerRadius:(CGFloat)cornerRadius {
    UIBezierPath *maskPath;
    CGSize cornerSize = CGSizeMake(cornerRadius, cornerRadius);
    
    switch (cornerType) {
            // 四个角全切
        case WeicyViewCornerTypeAll:{
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:UIRectCornerAllCorners
                                                   cornerRadii:cornerSize];
            
        }
            break;
            
            // 三个角
        case WeicyViewCornerTypeExceptTopLeft:{
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:(UIRectCornerTopRight|UIRectCornerBottomLeft|UIRectCornerBottomRight)
                                                   cornerRadii:cornerSize];
            
        }
            break;
            
        case WeicyViewCornerTypeExceptTopRight:{
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:(UIRectCornerTopLeft|UIRectCornerBottomLeft|UIRectCornerBottomRight)
                                                   cornerRadii:cornerSize];
            
        }
            break;
            
        case WeicyViewCornerTypeExceptBottomLeft:{
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:(UIRectCornerTopRight|UIRectCornerTopLeft|UIRectCornerBottomRight)
                                                   cornerRadii:cornerSize];
            
        }
            break;
            
        case WeicyViewCornerTypeExceptBottomRight:{
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:(UIRectCornerTopRight|UIRectCornerBottomLeft|UIRectCornerTopLeft)
                                                   cornerRadii:cornerSize];
            
        }
            break;
            
            // 两个角
        case WeicyViewCornerTypeTop:{
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:(UIRectCornerTopLeft|UIRectCornerTopRight)
                                                   cornerRadii:cornerSize];
            
        }
            break;
            
        case WeicyViewCornerTypeLeft:{
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:(UIRectCornerTopLeft|UIRectCornerBottomLeft)
                                                   cornerRadii:cornerSize];
            
        }
            break;
            
        case WeicyViewCornerTypeRight:{
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:(UIRectCornerTopRight|UIRectCornerBottomRight)
                                                   cornerRadii:cornerSize];
            
        }
            break;
            
        case WeicyViewCornerTypeBottom:{
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:(UIRectCornerBottomLeft|UIRectCornerBottomRight)
                                                   cornerRadii:cornerSize];
            
        }
            break;
            
            // 一个角
        case WeicyViewCornerTypeTopLeft:{
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:(UIRectCornerTopLeft)
                                                   cornerRadii:cornerSize];
            
        }
            break;
            
        case WeicyViewCornerTypeTopRight:{
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:(UIRectCornerTopRight)
                                                   cornerRadii:cornerSize];
            
        }
            break;
            
        case WeicyViewCornerTypeBottomLeft:{
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:(UIRectCornerBottomLeft)
                                                   cornerRadii:cornerSize];
            
        }
            break;
            
        case WeicyViewCornerTypeBottomRight:{
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:(UIRectCornerBottomRight)
                                                   cornerRadii:cornerSize];
            
        }
            break;
            
            // 对角线
        case WeicyViewCornerTypeTopLeftToBottomRight:{
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:(UIRectCornerTopLeft|UIRectCornerBottomRight)
                                                   cornerRadii:cornerSize];
            
        }
            break;
            
        case WeicyViewCornerTypeTopRightToBottomLeft:{
            maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                             byRoundingCorners:(UIRectCornerTopRight|UIRectCornerBottomLeft)
                                                   cornerRadii:cornerSize];
            
        }
            break;
            
        default: {
            
        }
            break;
            
    }
    
    return maskPath;
}

- (void)makeCornerWithMaskPath:(UIBezierPath *)maskPath {
    // Create the shape layer and set its path
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

@end

//
//  UIView+WeicyCorners.h
//  Common
//
//  Created by CityDoWCY on 2020/12/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, WeicyViewCornerType) {
    // 全部角都切圆角
    WeicyViewCornerTypeAll = 0,
    // 切三个角
    WeicyViewCornerTypeExceptTopLeft,
    WeicyViewCornerTypeExceptTopRight,
    WeicyViewCornerTypeExceptBottomLeft,
    WeicyViewCornerTypeExceptBottomRight,
    
    // 切两个角（同一边）
    WeicyViewCornerTypeTop,
    WeicyViewCornerTypeLeft,
    WeicyViewCornerTypeRight,
    WeicyViewCornerTypeBottom,
    
    // 切一个角
    WeicyViewCornerTypeTopLeft,
    WeicyViewCornerTypeTopRight,
    WeicyViewCornerTypeBottomLeft,
    WeicyViewCornerTypeBottomRight,
    
    // 对角线
    WeicyViewCornerTypeTopLeftToBottomRight,
    WeicyViewCornerTypeTopRightToBottomLeft,
};

@interface UIView (WeicyCorners)

/**
 切割圆角方法

 @param cornerType 切割类型
 @param cornerRadius 切割角度
 */
- (void)weicy_useBezierPathClipCornerWithType:(WeicyViewCornerType)cornerType WithCornerRadius:(CGFloat)cornerRadius;

/**
 切割圆角方法和添加边框

 @param cornerType 切割类型
 @param cornerRadius 切割角度
 @param color 颜色 例：[UIColor BlackColor] 方法里会转成CGColor
 @param width 宽度 例：1.0f
 
 */
- (void)weicy_useBezierPathClipCornerWithType:(WeicyViewCornerType)cornerType WithCornerRadius:(CGFloat)cornerRadius WithBorderColor:(UIColor *)color withBorderWidth:(CGFloat)width;

/**
 添加边框
 使用CALayer添加边框 可以做到不切割圆角加线
 
 @param color 颜色 例：[UIColor BlackColor] 方法里会转成CGColor
 @param width 宽度 例：1.0f
 */
- (void)weicy_useCALayerMakeBorderLineWithBorderColor:(UIColor *)color borderWidth:(CGFloat)width;

@end

NS_ASSUME_NONNULL_END

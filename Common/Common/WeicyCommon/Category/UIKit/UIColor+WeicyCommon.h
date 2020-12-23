//
//  UIColor+WeicyCommon.h
//  Common
//
//  Created by CityDoWCY on 2020/12/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (WeicyCommon)

/// 生成随机颜色
+ (UIColor *)weicy_randomColor;

/// 生成带透明度的随机颜色
/// @param alpha 透明度
+ (UIColor *)weicy_randomColorWithAlpha:(CGFloat)alpha;

/// 根据16进制取颜色  支持@“#123456”、 @“0X123456”、 @“123456”三种格式
/// @param color 颜色字符串
+ (UIColor *)weicy_colorWithHexString:(NSString *)color;

/// 根据16进制取颜色  支持@“#123456”、 @“0X123456”、 @“123456”三种格式
/// @param color 颜色字符串
/// @param alpha 透明度
+ (UIColor *)weicy_colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end

NS_ASSUME_NONNULL_END

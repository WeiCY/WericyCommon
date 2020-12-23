//
//  UILabel+WeicyCommon.h
//  Common
//
//  Created by CityDoWCY on 2020/12/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (WeicyCommon)

#pragma mark - 修改间距

/// 修改行间距
/// @param space 行间距
- (void)weicy_changeLineSpace:(float)space;

/// 修改字间距
/// @param space 字间距
- (void)weicy_changeWordSpace:(float)space;

/// 修改行间距、字间距
/// @param lineSpace 行间距
/// @param wordSpace 字间距
- (void)weicy_changeLineSpace:(float)lineSpace wordSpace:(float)wordSpace;

#pragma mark - 富文本改字体颜色

/// 修改范围内字体大小
/// @param font 字体
/// @param range 范围
- (void)weicy_attributedStringTextFont:(UIFont *)font range:(NSRange)range;

/// 修改范围内字体颜色
/// @param color 颜色
/// @param range 范围
- (void)weicy_attributedStringTextColor:(UIColor *)color range:(NSRange)range;

/// 修改范围内字体大小和颜色
/// @param font 字体
/// @param color 颜色
/// @param range 范围
- (void)weicy_attributedStringTextFont:(UIFont *)font textColor:(UIColor*)color range:(NSRange)range;

/// 修改范围内文字相关属性
/// @param attributes 属性
/// @param range 范围
- (void)weicy_attributedStringTextAttributes:(NSDictionary *)attributes range:(NSRange)range;

@end

NS_ASSUME_NONNULL_END

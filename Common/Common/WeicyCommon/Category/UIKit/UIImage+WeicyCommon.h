//
//  UIImage+WeicyCommon.h
//  Common
//
//  Created by CityDoWCY on 2020/12/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (WeicyCommon)

#pragma mark - 创建image
/// 生成GIF
/// @param data gif数据
/// @param scale 比例
+ (nullable UIImage *)weicy_imageWithSmallGIFData:(NSData *)data scale:(CGFloat)scale;
/// 根据颜色生成图片
/// @param color 图片颜色
+ (UIImage *)weicy_imageWithColor:(UIColor *)color;
/// 根据颜色生成规定尺寸图片
/// @param color 图片颜色
/// @param size 图片尺寸
+ (UIImage *)weicy_imageWithColor:(UIColor *)color size:(CGSize)size;

#pragma mark - Image信息
/// 是否含有透明像素
- (BOOL)weicy_hasAlphaChannel;

#pragma mark - 压缩图片
/// 压缩图片
/// @param sourceImage 原图
+ (UIImage *)weicy_compressImageWithOriginalImage:(UIImage *)sourceImage;

#pragma mark - 二维码

/// 生成二维码
/// @param string 二维码数据
/// @param size 二维码大小
+ (UIImage *)weicy_generateQRCodeWithString:(NSString *)string size:(CGFloat)size;

/// 生成二维码（自定义颜色）
/// @param string 二维码数据
/// @param size 二维码大小
/// @param color 二维码颜色
/// @param backgroundColor 二维码背景颜色
+ (UIImage *)weicy_generateQRCodeWithString:(NSString *)string size:(CGFloat)size color:(UIColor *)color backgroundColor:(UIColor *)backgroundColor;

/// 生成带 logo 的二维码（推荐使用）
/// @param string  二维码数据
/// @param size 二维码大小
/// @param logoImage logo
/// @param ratio logo 相对二维码的比例（取值范围 0.0 ～ 0.5f）推荐0.3以下
+ (UIImage *)weicy_generateQRCodeWithString:(NSString *)string size:(CGFloat)size logoImage:(UIImage *)logoImage ratio:(CGFloat)ratio;

/// 生成带 logo 的二维码（拓展）
/// @param string 二维码数据
/// @param size 二维码大小
/// @param logoImage  logo
/// @param ratio  logo 相对二维码的比例（取值范围 0.0 ～ 0.5f）推荐0.3以下
/// @param logoImageCornerRadius  logo 外边框圆角（取值范围 0.0 ～ 10.0f）
/// @param logoImageBorderWidth logo 外边框宽度（取值范围 0.0 ～ 10.0f）
/// @param logoImageBorderColor logo 外边框颜色
+ (UIImage *)weicy_generateQRCodeWithString:(NSString *)string size:(CGFloat)size logoImage:(UIImage *)logoImage ratio:(CGFloat)ratio logoImageCornerRadius:(CGFloat)logoImageCornerRadius logoImageBorderWidth:(CGFloat)logoImageBorderWidth logoImageBorderColor:(UIColor *)logoImageBorderColor;

/// 适配不同模式下的颜色
/// @param lightImage light环境下的图片
/// @param darkImage dark环境下的图片
+ (UIImage *)weicy_imageWithLightImage:(UIImage *)lightImage darkImage:(UIImage *)darkImage;

@end

NS_ASSUME_NONNULL_END

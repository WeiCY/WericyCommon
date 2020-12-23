//
//  NSString+WeicyCommon.h
//  Common
//
//  Created by CityDoWCY on 2020/12/11.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (WeicyCommon)

#pragma mark - Hash 字符串加密
/**
 返回使用md2/md4/md5/sha1/sha224/sha256/sha384/sha512/crc32进行加密的小写字符串
 原理：通过NSString系统的dataUsingEncoding 转化为data类型，然后通过为NSData添加的扩展转化为对应加密字符串
 */
// 普通加密
- (nullable NSString *)weicy_md2String;
- (nullable NSString *)weicy_md4String;
- (nullable NSString *)weicy_md5String;
- (nullable NSString *)weicy_sha1String;
- (nullable NSString *)weicy_sha224String;
- (nullable NSString *)weicy_sha256String;
- (nullable NSString *)weicy_sha384String;
- (nullable NSString *)weicy_sha512String;
- (nullable NSString *)weicy_crc32String;

/**
 返回使用md5/sha1/sha224/sha256/sha384/sha512和key进行加密的小写字符串
 @param key hmac key值
 原理：通过NSString系统的dataUsingEncoding 转化为data类型，然后通过为NSData添加的扩展转化为对应加密字符串，通过CCHmac系统方法进行修改
 */
// key加密
- (nullable NSString *)weicy_hmacMD5StringWithKey:(NSString *)key;
- (nullable NSString *)weicy_hmacSHA1StringWithKey:(NSString *)key;
- (nullable NSString *)weicy_hmacSHA224StringWithKey:(NSString *)key;
- (nullable NSString *)weicy_hmacSHA256StringWithKey:(NSString *)key;
- (nullable NSString *)weicy_hmacSHA384StringWithKey:(NSString *)key;
- (nullable NSString *)weicy_hmacSHA512StringWithKey:(NSString *)key;

#pragma mark - 编码解码
/// 返回base64编码后的字符串
- (nullable NSString *)weicy_base64EncodedString;

/// 解密base64加密的字符串
/// @param base64EncodedString base64加密后的字符串
+ (nullable NSString *)weicy_stringWithBase64EncodedString:(NSString *)base64EncodedString;

/// 给定的字符串进行URL 的UTF-8编码。
- (NSString *)weicy_stringByURLEncode;

/// 对给定的字符串进行UTF - 8解码
- (NSString *)weicy_stringByURLDecode;

#pragma mark - 计算宽高
/// 指定最大宽高后返回字符串的宽高
/// @param font 字体
/// @param size 最大宽高
/// @param lineBreakMode 折行模式
- (CGSize)weicy_sizeForFont:(UIFont *)font size:(CGSize)size mode:(NSLineBreakMode)lineBreakMode;

/// 字符串的宽度
/// 返回一行指定字体的字符串的宽度。这些值可能是四舍五入到最接近的整数。
/// @param font 字体
- (CGFloat)weicy_widthForFont:(UIFont *)font;

/// 字符串的高度
/// @param font 字体
/// @param width 指定的宽度
- (CGFloat)weicy_heightForFont:(UIFont *)font width:(CGFloat)width;

#pragma mark - Utilities
/// 去除首尾的空白字符合回车
- (NSString *)weicy_stringByTrim;

/// json字符串解析为字典或数组
- (nullable id)weicy_jsonValueDecoded;

@end

NS_ASSUME_NONNULL_END

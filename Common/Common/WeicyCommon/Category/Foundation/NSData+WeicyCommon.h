//
//  NSData+WeicyCommon.h
//  Common
//
//  Created by CityDoWCY on 2020/12/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (WeicyCommon)

#pragma mark - Hash
/**
 返回使用md2/md4/md5/sha1/sha224/sha256/sha384/sha512/crc32进行加密的小写字符串
 */
- (NSString *)weicy_md2String;
- (NSString *)weicy_md4String;
- (NSString *)weicy_md5String;
- (NSString *)weicy_sha1String;
- (NSString *)weicy_sha224String;
- (NSString *)weicy_sha256String;
- (NSString *)weicy_sha384String;
- (NSString *)weicy_sha512String;
- (NSString *)weicy_crc32String;

/**
 返回使用md2/md4/md5/sha1/sha224/sha256/sha384/sha512/crc32进行加密的data
 */
- (NSData *)weicy_md2Data;
- (NSData *)weicy_md4Data;
- (NSData *)weicy_md5Data;
- (NSData *)weicy_sha1Data;
- (NSData *)weicy_sha224Data;
- (NSData *)weicy_sha256Data;
- (NSData *)weicy_sha384Data;
- (NSData *)weicy_sha512Data;


/**
 返回使用md5/sha1/sha224/sha256/sha384/sha512和key进行加密的小写字符串
 @param key hmac key值
 */
- (NSString *)weicy_hmacMD5StringWithKey:(NSString *)key;
- (NSString *)weicy_hmacSHA1StringWithKey:(NSString *)key;
- (NSString *)weicy_hmacSHA224StringWithKey:(NSString *)key;
- (NSString *)weicy_hmacSHA256StringWithKey:(NSString *)key;
- (NSString *)weicy_hmacSHA384StringWithKey:(NSString *)key;
- (NSString *)weicy_hmacSHA512StringWithKey:(NSString *)key;

/**
 返回使用md5/sha1/sha224/sha256/sha384/sha512和key进行加密的data
 @param key hmac key值
 */
- (NSData *)weicy_hmacMD5DataWithKey:(NSData *)key;
- (NSData *)weicy_hmacSHA1DataWithKey:(NSData *)key;
- (NSData *)weicy_hmacSHA224DataWithKey:(NSData *)key;
- (NSData *)weicy_hmacSHA256DataWithKey:(NSData *)key;
- (NSData *)weicy_hmacSHA384DataWithKey:(NSData *)key;
- (NSData *)weicy_hmacSHA512DataWithKey:(NSData *)key;

#pragma mark - 编码解码
/// 返回utf8编码后的字符串
- (nullable NSString *)weicy_utf8String;

/// 返回base64编码后的字符串
- (nullable NSString *)weicy_base64EncodedString;

#pragma mark - 格式化
/// data解析为字典或数组
- (nullable id)weicy_jsonValueDecoded;
@end

NS_ASSUME_NONNULL_END

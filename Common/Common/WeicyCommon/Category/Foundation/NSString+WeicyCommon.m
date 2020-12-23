//
//  NSString+WeicyCommon.m
//  Common
//
//  Created by CityDoWCY on 2020/12/11.
//

#import "NSString+WeicyCommon.h"
#import "NSData+WeicyCommon.h"

@implementation NSString (WeicyCommon)

#pragma mark - hash
// 普通加密
- (nullable NSString *)weicy_md2String {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] weicy_md2String];
}
- (nullable NSString *)weicy_md4String {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] weicy_md4String];
}
- (nullable NSString *)weicy_md5String {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] weicy_md5String];
}
- (nullable NSString *)weicy_sha1String {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] weicy_sha1String];
}
- (nullable NSString *)weicy_sha224String {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] weicy_sha224String];
}
- (nullable NSString *)weicy_sha256String {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] weicy_sha256String];
}
- (nullable NSString *)weicy_sha384String {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] weicy_sha384String];
}
- (nullable NSString *)weicy_sha512String {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] weicy_sha512String];
}
- (nullable NSString *)weicy_crc32String {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] weicy_crc32String];
}

// key加密
- (nullable NSString *)weicy_hmacMD5StringWithKey:(NSString *)key {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] weicy_hmacMD5StringWithKey:key];
}
- (nullable NSString *)weicy_hmacSHA1StringWithKey:(NSString *)key {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] weicy_hmacSHA1StringWithKey:key];
}
- (nullable NSString *)weicy_hmacSHA224StringWithKey:(NSString *)key {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] weicy_hmacSHA224StringWithKey:key];
}
- (nullable NSString *)weicy_hmacSHA256StringWithKey:(NSString *)key {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] weicy_hmacSHA256StringWithKey:key];
}
- (nullable NSString *)weicy_hmacSHA384StringWithKey:(NSString *)key {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] weicy_hmacSHA384StringWithKey:key];
}
- (nullable NSString *)weicy_hmacSHA512StringWithKey:(NSString *)key {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] weicy_hmacSHA512StringWithKey:key];
}

#pragma mark - 编码解码
// base64
- (nullable NSString *)weicy_base64EncodedString {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] weicy_base64EncodedString];
}

+ (nullable NSString *)weicy_stringWithBase64EncodedString:(NSString *)base64EncodedString {
    NSData *data = [[NSData alloc] initWithBase64EncodedString:base64EncodedString options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return data.weicy_utf8String;
}

- (NSString *)weicy_stringByURLEncode {
    if ([self respondsToSelector:@selector(stringByAddingPercentEncodingWithAllowedCharacters:)]) {
        /**
         AFNetworking/AFURLRequestSerialization.m
         
         Returns a percent-escaped string following RFC 3986 for a query string key or value.
         RFC 3986 states that the following characters are "reserved" characters.
            - General Delimiters: ":", "#", "[", "]", "@", "?", "/"
            - Sub-Delimiters: "!", "$", "&", "'", "(", ")", "*", "+", ",", ";", "="
         In RFC 3986 - Section 3.4, it states that the "?" and "/" characters should not be escaped to allow
         query strings to include a URL. Therefore, all "reserved" characters with the exception of "?" and "/"
         should be percent-escaped in the query string.
            - parameter string: The string to be percent-escaped.
            - returns: The percent-escaped string.
         */
        static NSString * const kAFCharactersGeneralDelimitersToEncode = @":#[]@"; // does not include "?" or "/" due to RFC 3986 - Section 3.4
        static NSString * const kAFCharactersSubDelimitersToEncode = @"!$&'()*+,;=";
        
        NSMutableCharacterSet * allowedCharacterSet = [[NSCharacterSet URLQueryAllowedCharacterSet] mutableCopy];
        [allowedCharacterSet removeCharactersInString:[kAFCharactersGeneralDelimitersToEncode stringByAppendingString:kAFCharactersSubDelimitersToEncode]];
        static NSUInteger const batchSize = 50;
        
        NSUInteger index = 0;
        NSMutableString *escaped = @"".mutableCopy;
        
        while (index < self.length) {
            NSUInteger length = MIN(self.length - index, batchSize);
            NSRange range = NSMakeRange(index, length);
            // To avoid breaking up character sequences such as 👴🏻👮🏽
            range = [self rangeOfComposedCharacterSequencesForRange:range];
            NSString *substring = [self substringWithRange:range];
            NSString *encoded = [substring stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacterSet];
            [escaped appendString:encoded];
            
            index += range.length;
        }
        return escaped;
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        CFStringEncoding cfEncoding = CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding);
        NSString *encoded = (__bridge_transfer NSString *)
        CFURLCreateStringByAddingPercentEscapes(
                                                kCFAllocatorDefault,
                                                (__bridge CFStringRef)self,
                                                NULL,
                                                CFSTR("!#$&'()*+,/:;=?@[]"),
                                                cfEncoding);
        return encoded;
#pragma clang diagnostic pop
    }
}

- (NSString *)weicy_stringByURLDecode {
    if ([self respondsToSelector:@selector(stringByRemovingPercentEncoding)]) {
        return [self stringByRemovingPercentEncoding];
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        CFStringEncoding en = CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding);
        NSString *decoded = [self stringByReplacingOccurrencesOfString:@"+"
                                                            withString:@" "];
        decoded = (__bridge_transfer NSString *)
        CFURLCreateStringByReplacingPercentEscapesUsingEncoding(
                                                                NULL,
                                                                (__bridge CFStringRef)decoded,
                                                                CFSTR(""),
                                                                en);
        return decoded;
#pragma clang diagnostic pop
    }
}

#pragma mark - 计算宽高
- (CGSize)weicy_sizeForFont:(UIFont *)font size:(CGSize)size mode:(NSLineBreakMode)lineBreakMode {
    CGSize result;
    if (!font) font = [UIFont systemFontOfSize:12];
   
    NSMutableDictionary *attr = [NSMutableDictionary new];
    attr[NSFontAttributeName] = font;
    if (lineBreakMode != NSLineBreakByWordWrapping) {
        NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
        paragraphStyle.lineBreakMode = lineBreakMode;
        attr[NSParagraphStyleAttributeName] = paragraphStyle;
    }
    CGRect rect = [self boundingRectWithSize:size
                                     options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                  attributes:attr context:nil];
    result = rect.size;
    return result;
}
- (CGFloat)weicy_widthForFont:(UIFont *)font {
    CGSize size = [self weicy_sizeForFont:font size:CGSizeMake(HUGE, HUGE) mode:NSLineBreakByWordWrapping];
    return size.width;
}
- (CGFloat)weicy_heightForFont:(UIFont *)font width:(CGFloat)width {
    CGSize size = [self weicy_sizeForFont:font size:CGSizeMake(width, HUGE) mode:NSLineBreakByWordWrapping];
    return size.height;
}

#pragma mark - Utilities
- (NSString *)weicy_stringByTrim {
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    return [self stringByTrimmingCharactersInSet:set];
}

- (id)weicy_jsonValueDecoded {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] weicy_jsonValueDecoded];
}
@end

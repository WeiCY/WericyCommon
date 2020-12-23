//
//  NSDictionary+WeicyCommon.h
//  Common
//
//  Created by CityDoWCY on 2020/12/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 为字典添加的功能
@interface NSDictionary (WeicyCommon)

#pragma mark - Dictionary Convertor
/// 判断是否含有某个key
/// @param key 关键字
- (BOOL)weicy_containsObjectForKey:(nullable id)key;

/// 返回一个包含key的新字典
/// @param keys key数组 包含会返回，没有就不会显示
- (NSDictionary *)weicy_entriesForKeys:(NSArray *)keys;

/// 是否为空字典
- (BOOL)weicy_isEmptyDictionary;

/// 转化为json字符串
/// @param dict 字典
- (NSString *)weicy_convertToJsonData:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END

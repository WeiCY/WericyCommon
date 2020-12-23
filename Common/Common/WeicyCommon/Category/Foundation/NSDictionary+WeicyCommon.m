//
//  NSDictionary+WeicyCommon.m
//  Common
//
//  Created by CityDoWCY on 2020/12/1.
//

#import "NSDictionary+WeicyCommon.h"

@implementation NSDictionary (WeicyCommon)

#pragma mark - Dictionary Convertor
- (BOOL)weicy_containsObjectForKey:(nullable id)key {
    if (!key) return NO;
    return self[key] != nil;
}

- (NSDictionary *)weicy_entriesForKeys:(NSArray *)keys {
    NSMutableDictionary *dic = [NSMutableDictionary new];
    for (id key in keys) {
        id value = self[key];
        if (value) dic[key] = value;
    }
    return [dic copy];
}

- (BOOL)weicy_isEmptyDictionary {
    return [self count] == 0 ? YES : NO;
}

- (NSString *)weicy_convertToJsonData:(NSDictionary *)dict {
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString;
    
    if (!jsonData) {
        NSLog(@"%@",error);
    }else{
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    NSRange range = {0,jsonString.length};
    
    //去掉字符串中的空格
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    NSRange range2 = {0,mutStr.length};
    //去掉字符串中的换行符
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    return mutStr;
}

@end

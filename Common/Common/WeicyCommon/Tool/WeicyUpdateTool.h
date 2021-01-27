//
//  WeicyUpdateTool.h
//  Common
//
//  Created by CityDoWCY on 2021/1/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    WeicyUpdateToolCodeSuccess = 10088,
    WeicyUpdateToolCodeFailAppIDError,
    WeicyUpdateToolCodeFailNetwork,
} WeicyUpdateToolCode;

/// 使用原生请求+APP Store接口进行更新判断
@interface WeicyUpdateTool : NSObject

+ (void)weicy_updateWithAppId:(NSString *)appId successBlock:(void (^)(NSDictionary *dictionary))success failBlock:(void(^)(NSError *error))fail;

@end

NS_ASSUME_NONNULL_END

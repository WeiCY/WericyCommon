//
//  WeicyUpdateTool.m
//  Common
//
//  Created by CityDoWCY on 2021/1/26.
//

#import "WeicyUpdateTool.h"

@implementation WeicyUpdateTool

+ (void)weicy_updateWithAppId:(NSString *)appId successBlock:(nonnull void (^)(NSDictionary * _Nonnull))success failBlock:(nonnull void (^)(NSError * _Nonnull))fail {
    // 判断id的长度是否为10位
    if (appId.length != 10) {
        NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys:@"APPID错误", NSLocalizedDescriptionKey, @"失败原因：APPID错误", NSLocalizedFailureReasonErrorKey, @"建议：请查看APPID，重新调用",NSLocalizedRecoverySuggestionErrorKey,nil];
        NSError *netError = [[NSError alloc] initWithDomain:NSCocoaErrorDomain code:WeicyUpdateToolCodeFailAppIDError userInfo:userInfo];
        if (fail) {
            fail(netError);
        }
        return;
    }
    
    NSString *urlStr = [NSString stringWithFormat:@"https://itunes.apple.com/cn/lookup?id=%@", appId];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration ephemeralSessionConfiguration]];
        
    NSURLSessionDataTask *task = [session dataTaskWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (response == nil) {
        
            NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys:@"网络异常", NSLocalizedDescriptionKey, @"失败原因：网络不存在", NSLocalizedFailureReasonErrorKey, @"建议：请查看网络后，重新调用",NSLocalizedRecoverySuggestionErrorKey,nil];

            NSError *netError = [[NSError alloc] initWithDomain:NSCocoaErrorDomain code:WeicyUpdateToolCodeFailNetwork userInfo:userInfo];
            if (fail) {
                fail(netError);
            }
            return;
        }
        
        if (data) {
            NSDictionary *appInfoDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
            if (success) {
                success(appInfoDic);
            }
        }
     
    }];
    [task resume];
}

@end

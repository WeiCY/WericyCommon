//
//  WeicyAppTool.h
//  Common
//
//  Created by CityDoWCY on 2020/12/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// app相关工具类
@interface WeicyAppTool : NSObject

#pragma mark - 打开 App Store
/**
 在App Store打开应用
 */
+ (void)weicy_openAppStoreWithAppId:(NSString *__nonnull)appId;

/**
 在App Store打开应用评论页面
 */
+ (void)weicy_openAPPCommenWithAppId:(NSString *__nonnull)appid;

#pragma mark - 拨打电话
/**
 拨打电话

 @param phoneNumber 电话号码
 */
+ (void)weicy_telWithPhoneNumber:(NSString *_Nonnull)phoneNumber;

#pragma mark - 打开链接 跳转safari

/**
 打开链接

 @param urlStr 需要用Safari打开的url
 */
+ (void)weicy_gotoSafariBrowserWithURL:(NSString *_Nonnull)urlStr;

@end

NS_ASSUME_NONNULL_END

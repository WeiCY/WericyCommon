//
//  UIDevice+WeicyCommon.h
//  Common
//
//  Created by CityDoWCY on 2020/12/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (WeicyCommon)
#pragma mark - API
/// 设备系统版本 (e.g. 8.1)
+ (double)weicy_systemVersion;

/// 设备是否是iPad
@property (nonatomic, readonly) BOOL isPad;

/// 设备是不是模拟器.
@property (nonatomic, readonly) BOOL isSimulator;

/// 设备是否可以打电话
@property (nonatomic, readonly) BOOL canMakePhoneCalls NS_EXTENSION_UNAVAILABLE_IOS("");

/// 设备是否有摄像头
@property (nonatomic, readonly) BOOL isHasCamera;

/// 设备是否是全面屏
@property (nonatomic, readonly) BOOL isFullScreen;

@end

NS_ASSUME_NONNULL_END

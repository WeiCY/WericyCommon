//
//  UIApplication+WeicyCommon.h
//  Common
//
//  Created by CityDoWCY on 2020/12/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIApplication (WeicyCommon)

/// 主目录路径
@property (nonatomic, readonly) NSString * _Nonnull homePath;

/// “文档”文件夹  在这个应用的沙箱里。
@property (nonatomic, readonly) NSURL * _Nonnull documentsURL;
@property (nonatomic, readonly) NSString * _Nonnull documentsPath;

/// “缓存”文件夹在这个应用的沙箱里。
@property (nonatomic, readonly) NSURL * _Nonnull cachesURL;
@property (nonatomic, readonly) NSString * _Nonnull cachesPath;

/// “库”文件夹在这个应用的沙箱里。
@property (nonatomic, readonly) NSURL * _Nonnull libraryURL;
@property (nonatomic, readonly) NSString * _Nonnull libraryPath;

/// temp
@property (nonatomic, readonly) NSString * _Nonnull tmpPath;

/// Application's Bundle Name (show in SpringBoard).
@property (nullable, nonatomic, readonly) NSString *appBundleName;

/// Application's Bundle ID.  e.g. "com.ibireme.MyApp"
@property (nullable, nonatomic, readonly) NSString *appBundleID;

/// Application's Version.  e.g. "1.2.0"
@property (nullable, nonatomic, readonly) NSString *appVersion;

/// Application's Build number. e.g. "123"
@property (nullable, nonatomic, readonly) NSString *appBuildVersion;

/// Current thread real memory used in byte. (-1 when error occurs)
@property (nonatomic, readonly) int64_t memoryUsage;

/// Current thread CPU usage, 1.0 means 100%. (-1 when error occurs)
@property (nonatomic, readonly) float cpuUsage;


@end

NS_ASSUME_NONNULL_END

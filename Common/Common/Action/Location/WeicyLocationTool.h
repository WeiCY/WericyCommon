//
//  WeicyLocationTool.h
//  Common
//
//  Created by CityDoWCY on 2021/1/20.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WeicyLocationTool : NSObject

#pragma mark - 坐标转换
/// 世界标准地理坐标(WGS-84) 转换成 中国国测局地理坐标（GCJ-02）<火星坐标>
/// 只在中国大陆的范围的坐标有效，以外直接返回世界标准坐标
/// @param location 世界标准地理坐标(WGS-84)
+ (CLLocationCoordinate2D)wgs84ToGcj02:(CLLocationCoordinate2D)location;

/// <#Description#>
/// @param location <#location description#>
+ (CLLocationCoordinate2D)gcj02ToWgs84:(CLLocationCoordinate2D)location;

@end

NS_ASSUME_NONNULL_END

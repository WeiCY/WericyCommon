//
//  UINavigationItem+WeicyCommon.h
//  Common
//
//  Created by CityDoWCY on 2021/1/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    NaviBarLoaderPositionCenter = 0,
    NaviBarLoaderPositionLeft,
    NaviBarLoaderPositionRight,
} NaviBarLoaderPosition;

@interface UINavigationItem (WeicyCommon)

/// 开始动画
/// @param position 位置
- (void)weicy_startAnimating:(NaviBarLoaderPosition)position;
/// 停止动画
- (void)weicy_stopAnimating;

@end

NS_ASSUME_NONNULL_END

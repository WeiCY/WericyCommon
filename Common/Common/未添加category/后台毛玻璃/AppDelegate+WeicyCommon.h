//
//  AppDelegate+WeicyCommon.h
//  Common
//
//  Created by CityDoWCY on 2021/1/27.
//

#import "AppDelegate.h"

NS_ASSUME_NONNULL_BEGIN

/*
 * 为应用添加后台毛玻璃效果
 
    - (void)applicationWillResignActive:(UIApplication *)application {
        [self weicy_addBlurEffectView];
    }

    - (void)applicationDidBecomeActive:(UIApplication *)application {
        [self weicy_removeBlurEffectView];
    }
 
 */
@interface AppDelegate (WeicyCommon)

- (void)weicy_addBlurEffectView;

- (void)weicy_removeBlurEffectView;

@end

NS_ASSUME_NONNULL_END

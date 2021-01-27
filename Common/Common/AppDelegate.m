//
//  AppDelegate.m
//  Common
//
//  Created by CityDoWCY on 2020/12/1.
//

#import "AppDelegate.h"

#import "AppDelegate+WeicyCommon.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    [self weicy_addBlurEffectView];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
    [self weicy_removeBlurEffectView];
}

@end

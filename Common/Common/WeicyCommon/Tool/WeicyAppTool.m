//
//  WeicyAppTool.m
//  Common
//
//  Created by CityDoWCY on 2020/12/1.
//

#import "WeicyAppTool.h"
#import <UIKit/UIKit.h>

@implementation WeicyAppTool

#pragma mark - 打开App Store
+ (void)weicy_openAppStoreWithAppId:(NSString *)appId {
    
    NSString *urlPath = [@"itms-apps://itunes.apple.com/cn/app/id" stringByAppendingString:appId];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlPath] options:@{} completionHandler:^(BOOL success) {
        
    }];
}

+ (void)weicy_openAPPCommenWithAppId:(NSString *)appid {
    
    NSString *str = [NSString stringWithFormat:
                     @"http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=%@&pageNumber=0&sortOrdering=2&type=Purple+Software&mt=8",
                     appid];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str] options:@{} completionHandler:^(BOOL success) {

    }];
}

#pragma mark - 拨打电话
+ (void)weicy_telWithPhoneNumber:(NSString *)phoneNumber {
    // 拨打电话的几种方法 请详看我的博客----iOS 拨打电话（解决openURL延迟和不同方法比较）[https://www.cnblogs.com/weicyNo-1/p/7151605.html]
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"tel:" stringByAppendingString: phoneNumber]] options:@{} completionHandler:^(BOOL success) {
            
    }];
}

#pragma mark - 打开链接
+ (void)weicy_gotoSafariBrowserWithURL:(NSString *)urlStr {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlStr] options:@{} completionHandler:^(BOOL success) {
            
    }];
}

#pragma mark - 强制让App直接退出（非闪退，非崩溃）
+ (void)weicy_exitApplicationDuration:(NSTimeInterval)interval animations:(void (^)(void))animations {
    [UIView animateWithDuration:interval animations:animations completion:^(BOOL finished) {
        exit(0);
    }];
}

@end

//
//  AppDelegate+WeicyGT.m
//  LGHuiGuanJia
//
//  Created by CityDoWCY on 2020/12/25.
//  Copyright © 2020 CityDoWCY. All rights reserved.
//

#import "AppDelegate+WeicyGT.h"

//
//#import <GTSDK/GeTuiSdk.h>
//#import <UserNotifications/UserNotifications.h>
//


#define kGtAppId @"nMR5bnj6Ir7O46FKzuc7d8"
#define kGtAppKey @"l6u7NVEgDQ7FaM46OfQFM8"
#define kGtAppSecret @"yosZW0lkHm9CMqtnpzCK74"

//@interface AppDelegate (GT) <GeTuiSdkDelegate, UNUserNotificationCenterDelegate>
//
//@end

@implementation AppDelegate (WeicyGT)

//- (void)weicy_initGT {
//    [GeTuiSdk startSdkWithAppId:kGtAppId appKey:kGtAppKey appSecret:kGtAppSecret delegate:self];
//    // 注册 APNs
//    [self registerRemoteNotification];
//}
//
//- (void)registerRemoteNotification {
//    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
//    center.delegate = self;
//    [center requestAuthorizationWithOptions:(UNAuthorizationOptionBadge | UNAuthorizationOptionSound | UNAuthorizationOptionAlert | UNAuthorizationOptionCarPlay) completionHandler:^(BOOL granted, NSError *_Nullable error) {
//        if (!error && granted) {
//            NSLog(@"[ TestDemo ] iOS request authorization succeeded!");
//        }
//    }];
//    [[UIApplication sharedApplication] registerForRemoteNotifications];
//}
//
///** 远程通知注册成功委托 */
//- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
//    [GeTuiSdk registerDeviceTokenData:deviceToken];
//}
//
////  iOS 10: App在前台获取到通知
//- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler {
//
//    NSLog(@"willPresentNotification：%@", notification.request.content.userInfo);
//
//    // 根据APP需要，判断是否要提示用户Badge、Sound、Alert
//    completionHandler(UNNotificationPresentationOptionBadge | UNNotificationPresentationOptionSound | UNNotificationPresentationOptionAlert);
//}
//
////  iOS 10: 点击通知进入App时触发，在该方法内统计有效用户点击数
//- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler {
//
//    NSLog(@"didReceiveNotification：%@", response.notification.request.content.userInfo);
//
//    // [ GTSdk ]：将收到的APNs信息传给个推统计
//    [GeTuiSdk handleRemoteNotification:response.notification.request.content.userInfo];
//
//    completionHandler();
//    // 可以进行点击通知的操作
////    [self noticeClickActionAccordingMsgDic:response.notification.request.content.userInfo];
//}
//
//- (void)GeTuiSdkDidReceivePayloadData:(NSData *)payloadData andTaskId:(NSString *)taskId andMsgId:(NSString *)msgId andOffLine:(BOOL)offLine fromGtAppId:(NSString *)appId {
//    NSString *payloadMsg = nil;
//    if (payloadData) {
//        payloadMsg = [[NSString alloc] initWithBytes:payloadData.bytes length:payloadData.length encoding:NSUTF8StringEncoding];
//    }
//
//    //解析json字符串
//    NSString *msg = [NSString stringWithFormat:@"%@", payloadMsg];
//    NSDictionary *msdDic = [self dictionaryWithJsonString:msg];
//    [self noticeActionAccordingMsgDic:msdDic];
//
//}
//
///** SDK启动成功返回cid */
//- (void)GeTuiSdkDidRegisterClient:(NSString *)clientId {
//    // 个推SDK已注册，返回clientId
//    NSLog(@"\n>>>[GeTuiSdk RegisterClient]:%@\n\n", clientId);
//}
//
///** SDK遇到错误回调 */
//- (void)GeTuiSdkDidOccurError:(NSError *)error {
//    // 个推错误报告，集成步骤发生的任何错误都在这里通知，如果集成后，无法正常收到消息，查看这里的通知。
//    NSLog(@"\n>>>[GexinSdk error]:%@\n\n", [error localizedDescription]);
//}
//
//
////json字符串的转换
//- (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
//
//    if (jsonString == nil) {
//        return nil;
//    }
//    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
//    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
//    return dic;
//}
//
//// 透传消息收到后的操作
//- (void)noticeActionAccordingMsgDic:(NSDictionary *)msdDic {
//
//}

@end

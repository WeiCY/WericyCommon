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

//@interface AppDelegate (GT) <GeTuiSdkDelegate>
//
//@end

@implementation AppDelegate (WeicyGT)
//
//- (void)weicy_initGT {
//    [GeTuiSdk startSdkWithAppId:GtAppId appKey:GtAppKey appSecret:GtAppSecret delegate:self];
//    // 注册 APNs
//    [GeTuiSdk registerRemoteNotification: (UNAuthorizationOptionSound | UNAuthorizationOptionAlert | UNAuthorizationOptionBadge)];
//
//}
//
///// 通知展示（iOS10及以上版本）
///// @param center center
///// @param notification notification
///// @param completionHandler completionHandler
//- (void)GeTuiSdkNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification completionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler {
////    NSString *msg = [NSString stringWithFormat:@"[ TestDemo ] [APNs] %@ \n%@", NSStringFromSelector(_cmd), notification.request.content.userInfo];
//
//    // [ 参考代码，开发者注意根据实际需求自行修改 ] 根据APP需要，判断是否要提示用户Badge、Sound、Alert等
//    //completionHandler(UNNotificationPresentationOptionNone); 若不显示通知，则无法点击通知
//    completionHandler(UNNotificationPresentationOptionBadge | UNNotificationPresentationOptionSound | UNNotificationPresentationOptionAlert);
//}
//
///// 收到通知信息
///// @param userInfo apns通知内容
///// @param center UNUserNotificationCenter（iOS10及以上版本）
///// @param response UNNotificationResponse（iOS10及以上版本）
///// @param completionHandler 用来在后台状态下进行操作（iOS10以下版本）
//- (void)GeTuiSdkDidReceiveNotification:(NSDictionary *)userInfo notificationCenter:(UNUserNotificationCenter *)center response:(UNNotificationResponse *)response fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
////    NSString *msg = [NSString stringWithFormat:@"[ TestDemo ] [APNs] %@ \n%@", NSStringFromSelector(_cmd), userInfo];
//
//    if(completionHandler) {
//        // [ 参考代码，开发者注意根据实际需求自行修改 ] 根据APP需要自行修改参数值
//        completionHandler(UIBackgroundFetchResultNoData);
//    }
//}
//
///// 收到透传消息
///// @param userInfo    推送消息内容
///// @param fromGetui   YES: 个推通道  NO：苹果apns通道
///// @param offLine     是否是离线消息，YES.是离线消息
///// @param appId       应用的appId
///// @param taskId      推送消息的任务id
///// @param msgId       推送消息的messageid
///// @param completionHandler 用来在后台状态下进行操作（通过苹果apns通道的消息 才有此参数值）
//- (void)GeTuiSdkDidReceiveSlience:(NSDictionary *)userInfo fromGetui:(BOOL)fromGetui offLine:(BOOL)offLine appId:(NSString *)appId taskId:(NSString *)taskId msgId:(NSString *)msgId fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
//    // [ GTSDK ]：汇报个推自定义事件(反馈透传消息)，开发者可以根据项目需要决定是否使用, 非必须
//    // [GeTuiSdk sendFeedbackMessage:90001 andTaskId:taskId andMsgId:msgId];
////    NSString *msg = [NSString stringWithFormat:@"[ TestDemo ] [APN] %@ \nReceive Slience: fromGetui:%@ appId:%@ offLine:%@ taskId:%@ msgId:%@ userInfo:%@ ", NSStringFromSelector(_cmd), fromGetui ? @"个推消息" : @"APNs消息", appId, offLine ? @"离线" : @"在线", taskId, msgId, userInfo];
////    [self.homePage logMsg:msg];
//
//    if(completionHandler) {
//        // [ 参考代码，开发者注意根据实际需求自行修改 ] 根据APP需要自行修改参数值
//        completionHandler(UIBackgroundFetchResultNoData);
//    }
//}
//
//- (void)GeTuiSdkNotificationCenter:(UNUserNotificationCenter *)center openSettingsForNotification:(UNNotification *)notification {
//    // [ 参考代码，开发者注意根据实际需求自行修改 ] 根据APP需要自行修改参数值
//}
//
//
//- (void)GeTuiSdkDidOccurError:(NSError *)error {
//    NSString *msg = [NSString stringWithFormat:@"[ TestDemo ] [GeTuiSdk GeTuiSdkDidOccurError]:%@\n\n",error.localizedDescription];
//
//    // SDK发生错误时，回调异常错误信息
//    NSLog(@"%@", msg);
//}
//
///** SDK启动成功返回cid */
//- (void)GeTuiSdkDidRegisterClient:(NSString *)clientId {
//    //个推SDK已注册，返回clientId
//    NSLog(@"\n>>>[GeTuiSdk RegisterClient]:%@\n\n", clientId);
//}
//
///// [ 系统回调 ] 远程通知注册成功回调，获取DeviceToken成功，同步给个推服务器
//- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
//    // [ GTSDK ]：向个推服务器注册deviceToken
//    // 2.5.2.0 之前版本需要调用：
//    //[GeTuiSdk registerDeviceTokenData:deviceToken];
//}
//
///// [ 系统回调:可选 ] 远程通知注册失败回调，获取DeviceToken失败，打印错误信息
//- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
//    NSLog(@"fail");
//}

@end

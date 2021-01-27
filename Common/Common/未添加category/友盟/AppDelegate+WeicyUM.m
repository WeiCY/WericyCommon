//
//  AppDelegate+WeicyUM.m
//  Common
//
//  Created by CityDoWCY on 2020/12/30.
//

#import "AppDelegate+WeicyUM.h"
//#import <UMCommon/UMCommon.h>
//#import <UMShare/UMShare.h>
//
//#define UMAppkey @"59892ebcaed179694b000104"
//#define UMChannel @"App Store"
//
//// wechat
//#define WeChatAppKey @"wxdc1e388c3822c80b"
//#define WeChatAppSercet @"3baf1193c85774b3fd9d18447d76cab0"
//#define WeChatRedirectURL @"http://mobile.umeng.com/social"
//
//// QQ
//#define QQAppKey @"1105821097"
//#define QQRedirectURL @"http://mobile.umeng.com/social"

@implementation AppDelegate (WeicyUM)

//- (void)weicy_initUM {
//
//    [UMConfigure initWithAppkey:UMAppkey channel:UMChannel];
//    [UMConfigure setEncryptEnabled:YES];
//
//    // U-Share 平台设置
//    [self confitUShareSettings];
//    [self configUSharePlatforms];
//}
//
//- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options
//{
//    //6.3的新的API调用，是为了兼容国外平台(例如:新版facebookSDK,VK等)的调用[如果用6.2的api调用会没有回调],对国内平台没有影响
//    BOOL result = [[UMSocialManager defaultManager]  handleOpenURL:url options:options];
//    if (!result) {
//        // 其他如支付等SDK的回调
//    }
//    return result;
//}
//
//- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void(^)(NSArray * __nullable restorableObjects))restorationHandler
//{
//    if (![[UMSocialManager defaultManager] handleUniversalLink:userActivity options:nil]) {
//        // 其他SDK的回调
//    }
//    return YES;
//}
//
//
//#pragma mark - setting
//- (void)confitUShareSettings
//{
//    /*
//     * 打开图片水印
//     */
//    //[UMSocialGlobal shareInstance].isUsingWaterMark = YES;
//
//    /*
//     * 关闭强制验证https，可允许http图片分享，但需要在info.plist设置安全域名
//     <key>NSAppTransportSecurity</key>
//     <dict>
//     <key>NSAllowsArbitraryLoads</key>
//     <true/>
//     </dict>
//     */
//    //[UMSocialGlobal shareInstance].isUsingHttpsWhenShareContent = NO;
//
//        //配置微信平台的Universal Links
//    //微信和QQ完整版会校验合法的universalLink，不设置会在初始化平台失败
//    [UMSocialGlobal shareInstance].universalLinkDic = @{
//        @(UMSocialPlatformType_WechatSession):@"https://umplus-sdk-download.oss-cn-shanghai.aliyuncs.com/",
//        @(UMSocialPlatformType_QQ):@"https://umplus-sdk-download.oss-cn-shanghai.aliyuncs.com/qq_conn/101830139"
//                                                        };
//
//    //extraInitDic，企业微信增加了corpid和agentid，故在UMSocialGlobal的全局配置里面增加extraInitDic来存储额外的初始化参数。extraInitDic的key:corpId和agentId为固定值
//    [UMSocialGlobal shareInstance].extraInitDic = @{
//                                                    @(UMSocialPlatformType_WechatWork):@{@"corpId":@"wwac6ffb259ff6f66a",@"agentId":@"1000002"}
//                                                    };
//
//}
//
//- (void)configUSharePlatforms
//{
//    /* 设置微信的appKey和appSecret */
//    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:WeChatAppKey appSecret:WeChatAppSercet redirectURL:WeChatRedirectURL];
//    /*设置小程序回调app的回调*/
//    [[UMSocialManager defaultManager] setLauchFromPlatform:(UMSocialPlatformType_WechatSession) completion:^(id userInfoResponse, NSError *error) {
//        NSLog(@"setLauchFromPlatform:userInfoResponse:%@",userInfoResponse);
//    }];
//    /*
//     * 移除相应平台的分享，如微信收藏
//     */
//    //[[UMSocialManager defaultManager] removePlatformProviderWithPlatformTypes:@[@(UMSocialPlatformType_WechatFavorite)]];
//
//    /* 设置分享到QQ互联的appID
//     * U-Share SDK为了兼容大部分平台命名，统一用appKey和appSecret进行参数设置，而QQ平台仅需将appID作为U-Share的appKey参数传进即可。
//    */
//    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ appKey:QQAppKey/*设置QQ平台的appID*/  appSecret:nil redirectURL:QQRedirectURL];
//}

@end

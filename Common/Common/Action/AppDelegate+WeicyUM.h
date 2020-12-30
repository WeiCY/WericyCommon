//
//  AppDelegate+WeicyUM.h
//  Common
//
//  Created by CityDoWCY on 2020/12/30.
//

#import "AppDelegate.h"

NS_ASSUME_NONNULL_BEGIN

/*
 * 一行代码集成友盟
 * 在里面需要放开注释的代码
 * 后续考虑添加其余友盟功能  现在只有常用的分享
 */
@interface AppDelegate (WeicyUM)

- (void)weicy_initUM;

@end

/**
 本类只是为了方便友盟的推送使用，后期添加分享的工具类
 使用方法：
 1.导入友盟 ：
    pod 'UMCommon'
    pod 'UMShare/UI'
    pod 'UMShare/Social/WeChat'
    pod 'UMShare/Social/QQ'
    pod 'UMShare/Social/Sina'
 2. 在Appdelegate中倒入本类并在didFinishLaunchingWithOptions中调用 initUM方法
 
 注意点：
 1.需要在.m中修改相应id和key
 2.需要在info.plist中添加对应平台的白名单
 3.需要设置相应的scheme
 
 参考：注册三方平台  https://developer.umeng.com/docs/128606/detail/193651
      文档  https://developer.umeng.com/docs/128606/detail/193653#h1-u7B2Cu4E09u65B9u5E73u53F0u914Du7F6E4
 */

NS_ASSUME_NONNULL_END

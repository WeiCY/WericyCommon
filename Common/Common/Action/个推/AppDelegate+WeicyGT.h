//
//  AppDelegate+WeicyGT.h
//  LGHuiGuanJia
//
//  Created by CityDoWCY on 2020/12/25.
//  Copyright © 2020 CityDoWCY. All rights reserved.
//

#import "AppDelegate.h"

NS_ASSUME_NONNULL_BEGIN

/*
 * 一行代码集成个腿
 * 在里面需要放开注释的代码
 * 后续考虑添加Voip 但是不常用 只有语音通话 首款提醒这些需要
 */
@interface AppDelegate (WeicyGT)

- (void)weicy_initGT;

@end


/**
 本类只是为了方便个推的推送使用
 使用方法：
 1.导入个推 ：
    target 'GtSdkDemo-objc' do
        platform :ios, "8.0"
        pod 'GTSDK'
    end

    target 'NotificationService' do
        platform :ios, "10.0"
        pod 'GTExtensionSDK'
    end
 2. 在Appdelegate中倒入本类并在didFinishLaunchingWithOptions中调用 initGT方法
 
 注意点：
 1.需要在.m中修改appid、appkey、sercet 为方便统一修改 建议设置一个统一配置文件，而本扩展是为了方便调用 就单独抽到了.m中
 2.在项目设置中开启推送功能（必须）、后台运行（提高推送率）、wifi（建议）
 
 参考：https://docs.getui.com/getui/mobile/ios/xcode/
 */

NS_ASSUME_NONNULL_END

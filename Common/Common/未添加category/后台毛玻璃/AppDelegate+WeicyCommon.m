//
//  AppDelegate+WeicyCommon.m
//  Common
//
//  Created by CityDoWCY on 2021/1/27.
//

#import "AppDelegate+WeicyCommon.h"
#import "WeicyJumpTool.h"
#import "UIView+WeicyCommon.h"

#import <objc/runtime.h>

#define EffectViewKey @"effectViewKey"

@interface AppDelegate ()

@property (nonatomic, strong) UIView *effectView;

@end

@implementation AppDelegate (WeicyCommon)

- (void)weicy_addBlurEffectView {
    
    self.effectView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UIImageView *currentImage = [[UIImageView alloc] initWithFrame:self.effectView.bounds];

    //截取当前视图为图片
    currentImage.image = [[WeicyJumpTool weicy_getCurrentVC].view weicy_snapshotImage];
    
    //添加毛玻璃效果
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *effectview = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    effectview.frame = [UIScreen mainScreen].bounds;
    [currentImage addSubview:effectview];
    [self.effectView addSubview:currentImage];
    
    [self.window addSubview:self.effectView];
}

- (void)weicy_removeBlurEffectView {
    [self.effectView removeFromSuperview];
}

- (void)setEffectView:(UIView *)effectView {
    [self willChangeValueForKey:@"_effectView"];
    objc_setAssociatedObject(self, EffectViewKey, effectView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:@"_effectView"];
}

- (UIView *)effectView {
    return objc_getAssociatedObject(self, EffectViewKey);
}

@end

//
//  UIGestureRecognizer+WeicyCommon.h
//  Common
//
//  Created by CityDoWCY on 2020/12/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIGestureRecognizer (WeicyCommon)

/**
 使用方法：
 UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithActionBlock:^(id  _Nonnull sender) {
     NSLog(@"333");
 }];
 [self.view addGestureRecognizer:tap];
 
 UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
 [tap weicy_addActionBlock:^(id  _Nonnull sender) {
     NSLog(@"ddd");
 }];
 [self.view addGestureRecognizer:tap];
 */

#pragma mark - action初始化创建
/// 通过alloc方法创建
/// @param block 事件回调
- (instancetype)initWithActionBlock:(void (^)(id sender))block;

/// 直接手势添加
/// @param block 事件回调
- (void)weicy_addActionBlock:(void (^)(id sender))block;

#pragma mark - 移除
/// 移除事件回调
- (void)weicy_removeAllActionBlocks;

@end

NS_ASSUME_NONNULL_END

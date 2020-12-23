//
//  UIControl+WeicyCommon.h
//  Common
//
//  Created by CityDoWCY on 2020/12/2.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

/// 事件响应
@interface UIControl (WeicyCommon)

#pragma mark - 事件回调
/// 移除所有的事件
- (void)weicy_removeAllTargets;

/// 添加或替换 点击事件的 block回调
/// @param controlEvents 点击事件
/// @param block 回调
- (void)weicy_setBlockForControlEvents:(UIControlEvents)controlEvents block:(void (^)(id sender))block;

@end

NS_ASSUME_NONNULL_END

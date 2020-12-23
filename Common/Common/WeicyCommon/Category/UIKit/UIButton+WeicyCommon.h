//
//  UIButton+WeicyCommon.h
//  Common
//
//  Created by CityDoWCY on 2020/12/11.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    WeicyButtonImagePositionTypeLeft = 0, //图片在左，文字在右，默认
    WeicyButtonImagePositionTypeTop, //图片在上，文字在下
    WeicyButtonImagePositionTypeRight, //图片在右，文字在左
    WeicyButtonImagePositionTypeBottom, //图片在下，文字在上
} WeicyButtonImagePositionType;

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (WeicyCommon)

/// 设置按钮图片文字的图片位置
/// 利用UIButton的titleEdgeInsets和imageEdgeInsets来实现文字和图片的自由排列
/// @param type  图片位置类型
/// @param spacing 图片和文字的间隔
- (void)weicy_setButtonImagePosition:(WeicyButtonImagePositionType)type spacing:(CGFloat)spacing;

#pragma mark - 倒计时相关

/// 开启倒计时
/// @param totalTime 总时间 需大于0 小于0 默认60
/// @param againTitle 重新发送的显示
/// @param againColor 重新发送的姿态颜色
/// @param timeFromat 时间格式 类似 %zi s
/// @param timeColor    时间颜色
- (void)weicy_startTimer:(double)totalTime againTitle:(NSString *)againTitle againColor:(UIColor *)againColor timeFormat:(NSString *)timeFromat timeColor:(UIColor *)timeColor;

@end

NS_ASSUME_NONNULL_END

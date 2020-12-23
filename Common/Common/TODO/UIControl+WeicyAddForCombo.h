//
//  UIControl+WeicyAddForCombo.h
//  deede
//
//  Created by CityDoWCY on 2020/12/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIControl (WeicyAddForCombo)

/* 点击间隔
 * 主要为UIButton写的 防治重复点击 但是现在写法不适合block的事件
 * 还有不适用于UISwitch、UISlider等可能会连续点击的操作 设置间隔后会造成数据错误
 * 所以设置第二个属性防止出现只有设置允许连击忽略后才会显示连击间隔
 * 参考：https://www.cnblogs.com/sundaysgarden/articles/13725563.html
 */
@property (nonatomic, assign) NSTimeInterval weicy_eventInterval;
@property (nonatomic, assign) BOOL weicy_comboIgnore;

@end

NS_ASSUME_NONNULL_END

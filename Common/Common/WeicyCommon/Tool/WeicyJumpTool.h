//
//  WeicyJumpTool.h
//  Common
//
//  Created by CityDoWCY on 2020/12/1.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 跳转功能
@interface WeicyJumpTool : NSObject

/// 获取当前控制器
+ (UIViewController *)weicy_getCurrentVC;

/**
 页面跳转工具

 @param vcName 目标控制器命名
 @param param 额外参数，参数说明：param的key值对应目标控制器需要赋值的的属性名
 */
+ (void)weicy_jumpToVC:(NSString *)vcName param:(NSDictionary *)param;

@end

NS_ASSUME_NONNULL_END

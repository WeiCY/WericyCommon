//
//  UIScrollView+WeicyCommon.h
//  Common
//
//  Created by CityDoWCY on 2020/12/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (WeicyCommon)

#pragma mark - 滑动方法
/**
 滑动到顶部（默认带动画）
 */
- (void)weicy_scrollToTop;

/**
 滑动到底部（默认带动画）
 */
- (void)weicy_scrollToBottom;

/**
 滑动到左边（默认带动画）
 */
- (void)weicy_scrollToLeft;

/**
 滑动到右边（默认带动画）
 */
- (void)weicy_scrollToRight;

/**
 滑动到顶部
 
 @param animated  是否带动画
 */
- (void)weicy_scrollToTopAnimated:(BOOL)animated;

/**
 滑动到底部
 
 @param animated  是否带动画
 */
- (void)weicy_scrollToBottomAnimated:(BOOL)animated;

/**
 滑动到左边
 
 @param animated  是否带动画
 */
- (void)weicy_scrollToLeftAnimated:(BOOL)animated;

/**
 滑动到右边
 
 @param animated  是否带动画
 */
- (void)weicy_scrollToRightAnimated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END

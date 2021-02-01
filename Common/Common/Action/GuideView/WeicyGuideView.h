//
//  WeicyGuideView.h
//  Common
//
//  Created by CityDoWCY on 2021/1/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class WeicyGuideView;
@protocol WeicyGuideViewDelegate <NSObject>

/// 将要消失
- (void)guideViewWillDisapper:(WeicyGuideView *)guideView;

/// 已经消失
- (void)guideViewDidDisapper:(WeicyGuideView *)guideView;

@end

@interface WeicyGuideView : UIView

/**
 使用方法：
 添加引导页  并导入本类

 @property (nonatomic, strong) WeicyGuideViewTool *guideView;
 
 self.guideView = [WeicyGuideViewTool guideViewWithImageNames:@[@"guide_1", @"guide_2", @"guide_3"]];
 self.guideView.delegate = self;
 [self.view addSubview:self.guideView];

 */

// 初始化
/// @param imageNames 引导页图片名称数组
+ (instancetype)guideViewWithImageNames:(NSArray <NSString *> *)imageNames;

@property (nonatomic, weak) id <WeicyGuideViewDelegate> delegate;
@property (nonatomic, assign) UIViewContentMode imageViewsContentMode;          // default is UIViewContentModeScaleAspectFill.
@property (nonatomic, assign) BOOL pageControlHidden;       // default is NO.

@end

NS_ASSUME_NONNULL_END

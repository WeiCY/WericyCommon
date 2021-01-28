//
//  UITextField+WeicyCommon.h
//  Common
//
//  Created by CityDoWCY on 2021/1/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (WeicyCommon)

@property (nonatomic, strong) UIColor *placeholderColor;
@property (nonatomic, strong) UIFont *placegolderFont;
@property (nonatomic, assign) NSInteger limitCount;

@end

NS_ASSUME_NONNULL_END

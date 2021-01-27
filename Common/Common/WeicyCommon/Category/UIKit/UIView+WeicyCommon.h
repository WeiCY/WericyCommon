//
//  UIView+WeicyCommon.h
//  Common
//
//  Created by CityDoWCY on 2020/12/2.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, WeicyViewCornerType) {
    // 全部角都切圆角
    WeicyViewCornerTypeAll = 0,
    // 切三个角
    WeicyViewCornerTypeExceptTopLeft,
    WeicyViewCornerTypeExceptTopRight,
    WeicyViewCornerTypeExceptBottomLeft,
    WeicyViewCornerTypeExceptBottomRight,
    
    // 切两个角（同一边）
    WeicyViewCornerTypeTop,
    WeicyViewCornerTypeLeft,
    WeicyViewCornerTypeRight,
    WeicyViewCornerTypeBottom,
    
    // 切一个角
    WeicyViewCornerTypeTopLeft,
    WeicyViewCornerTypeTopRight,
    WeicyViewCornerTypeBottomLeft,
    WeicyViewCornerTypeBottomRight,
    
    // 对角线
    WeicyViewCornerTypeTopLeftToBottomRight,
    WeicyViewCornerTypeTopRightToBottomLeft,
};

typedef enum : NSUInteger {
    WeicyShadowPathTypeLeft = 0,
    WeicyShadowPathTypeTop,
    WeicyShadowPathTypeRight,
    WeicyShadowPathTypeBottom,
    WeicyShadowPathTypeNoTop,
    WeicyShadowPathTypeAll
} WeicyShadowPathType;

typedef enum : NSUInteger {
    /** Shake left and right */
    WeicyShakeDirectionHorizontal,
    /** Shake up and down */
    WeicyShakeDirectionVertical,
    /** Shake rotation */
    WeicyShakeDirectionRotation,
} WeicyShakeDirection;

NS_ASSUME_NONNULL_BEGIN

@interface UIView (WeicyCommon)

#pragma mark - frame
/** UIView 的坐标X点 */
@property (nonatomic, assign) CGFloat weicy_x;
/** UIView 的坐标Y点 */
@property (nonatomic, assign) CGFloat weicy_y;

/** UIView 的中心点X值 */
@property (nonatomic, assign) CGFloat weicy_centerX;
/** UIView 的中心点Y值 */
@property (nonatomic, assign) CGFloat weicy_centerY;

/** UIView的最大X值 */
@property (assign, nonatomic) CGFloat weicy_maxX;
/** UIView的最大Y值 */
@property (assign, nonatomic) CGFloat weicy_maxY;

/** UIView 的宽度 */
@property (nonatomic, assign) CGFloat weicy_width;
/** UIView 的高度 */
@property (nonatomic, assign) CGFloat weicy_height;

/** UIView 的 size */
@property (nonatomic, assign) CGSize weicy_size;
/** UIView 的坐标 */
@property (nonatomic, assign) CGPoint weicy_origin;

/**
 *  9.上 < Shortcut for frame.origin.y
 */
@property (nonatomic) CGFloat weicy_top;

/**
 *  10.下 < Shortcut for frame.origin.y + frame.size.height
 */
@property (nonatomic) CGFloat weicy_bottom;

/**
 *  11.左 < Shortcut for frame.origin.x.
 */
@property (nonatomic) CGFloat weicy_left;

/**
 *  12.右 < Shortcut for frame.origin.x + frame.size.width
 */
@property (nonatomic) CGFloat weicy_right;

#pragma mark - 截屏
/// 截屏
- (nullable UIImage *)weicy_snapshotImage;

/// 截屏
/// @param afterUpdates 刷新
- (nullable UIImage *)weicy_snapshotImageAfterScreenUpdates:(BOOL)afterUpdates;

#pragma mark - corner
/**
 切割圆角方法

 @param cornerType 切割类型
 @param cornerRadius 切割角度
 */
- (void)weicy_useBezierPathClipCornerWithType:(WeicyViewCornerType)cornerType WithCornerRadius:(CGFloat)cornerRadius;

/**
 切割圆角方法和添加边框

 @param cornerType 切割类型
 @param cornerRadius 切割角度
 @param color 颜色 例：[UIColor BlackColor] 方法里会转成CGColor
 @param width 宽度 例：1.0f
 
 */
- (void)weicy_useBezierPathClipCornerWithType:(WeicyViewCornerType)cornerType WithCornerRadius:(CGFloat)cornerRadius WithBorderColor:(UIColor *)color withBorderWidth:(CGFloat)width;

/**
 添加边框
 使用CALayer添加边框 可以做到不切割圆角加线
 
 @param color 颜色 例：[UIColor BlackColor] 方法里会转成CGColor
 @param width 宽度 例：1.0f
 */
- (void)weicy_useCALayerMakeBorderLineWithBorderColor:(UIColor *)color borderWidth:(CGFloat)width;

#pragma mark - 阴影
/// layer 添加全部阴影
/// @param color 阴影颜色,可设置透明度等.
/// @param offset 偏移量.,xy表示view左上角,width表示阴影与x的偏移量,向右为正。,height表示阴影与y值的偏移量 向下为正
/// @param opacity 阴影透明度,默认为0则看不到阴影.因此要看到阴影这个值必须大于0,shadowColor的透明度也要大于0
/// @param radius 模糊计算的半径,取平均值的半径,设置为0的话则为一个矩形块.
- (void)weicy_setLayerShadow:(nullable UIColor*)color offset:(CGSize)offset opacity:(CGFloat)opacity radius:(CGFloat)radius;

/// Bezier 添加阴影
/// @param shadowColor 阴影颜色,可设置透明度等.
/// @param shadowOpacity 阴影透明度,默认为0则看不到阴影.因此要看到阴影这个值必须大于0,shadowColor的透明度也要大于0
/// @param shadowRadius 模糊计算的半径,取平均值的半径,设置为0的话则为一个矩形块.
/// @param shadowPathType 阴影类型
/// @param shadowPathWidth 阴影宽度
- (void)weicy_setBezierShadow:(nullable UIColor *)shadowColor opacity:(CGFloat)shadowOpacity radius:(CGFloat)shadowRadius shadowSide:(WeicyShadowPathType)shadowPathType pathWidth:(CGFloat)shadowPathWidth;

#pragma mark - 移除
/// 移除全部子视图
- (void)weicy_removeAllSubviews;

#pragma mark - 渐变
/* 生成渐变背景色
 @param colors     渐变的颜色
 @param locations  渐变颜色的分割点
 @param startPoint 渐变颜色的方向起点,范围在（0，0）与（1,1）之间,如(0,0)(1,0)代表水平方向渐变,(0,0)(0,1)代表竖直方向渐变
 @param endPoint   渐变颜色的方向终点
 
 [self.view weicy_gradientBgColorWithColors:@[[UIColor redColor],[UIColor orangeColor]] locations:@[@(0.33),@(0.66)] startPoint:CGPointMake(0, 0) endPoint:CGPointMake(0, 1)];

 */
- (void)weicy_gradientBgColorWithColors:(NSArray*)colors locations:(NSArray*)locations startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;

#pragma mark - 抖动

/// 视图抖动
/// 按照默认状态抖动
- (void)weicy_shake;

/// 视图抖动
/// @param times 抖动次数
/// @param delta 抖动幅度
- (void)weicy_shake:(int)times withDelta:(CGFloat)delta;

/// 视图抖动
/// @param times 抖动次数
/// @param delta 抖动幅度
/// @param handler 结束回调
- (void)weicy_shake:(int)times withDelta:(CGFloat)delta completion:(nullable void (^)(void))handler;

/// 视图以自定义的速度抖动
/// @param times 抖动次数
/// @param delta 抖动幅度
/// @param interval 一次抖动的时间
- (void)weicy_shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval;

/// 视图以自定义的速度抖动
/// @param times 抖动次数
/// @param delta 抖动幅度
/// @param interval 一次抖动的时间
/// @param handler 结束回调
- (void)weicy_shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval completion:(nullable void (^)(void))handler;

/// 视图以自定义的速度和方向抖动
/// @param times 抖动次数
/// @param delta 抖动幅度
/// @param interval 一次抖动的时间
/// @param shakeDirection 抖动方向
- (void)weicy_shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval shakeDirection:(WeicyShakeDirection)shakeDirection;

/// 视图以自定义的速度和方向抖动
/// @param times 抖动次数
/// @param delta 抖动幅度
/// @param interval 一次抖动的时间
/// @param shakeDirection 抖动方向
/// @param completion 结束回掉
- (void)weicy_shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval shakeDirection:(WeicyShakeDirection)shakeDirection completion:(nullable void (^)(void))completion;


@end

NS_ASSUME_NONNULL_END

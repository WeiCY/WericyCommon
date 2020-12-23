//
//  UIButton+WeicyCommon.m
//  Common
//
//  Created by CityDoWCY on 2020/12/11.
//

#import "UIButton+WeicyCommon.h"
#import <objc/runtime.h>

@interface WeicyButtonPositionCacheManager : NSObject

@property (nonatomic, strong) NSCache *cache;

@end

@implementation WeicyButtonPositionCacheManager

+ (instancetype)sharedInstance {
    static WeicyButtonPositionCacheManager * _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[[self class] alloc] init];
    });
    return _sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _cache = [[NSCache alloc] init];
    }
    return self;
}

@end

/**
 缓存用数据结构
 */
@interface WeicyButtonPositionCacheModel : NSObject

@property (nonatomic, assign) UIEdgeInsets imageEdgeInsets;
@property (nonatomic, assign) UIEdgeInsets titleEdgeInsets;
@property (nonatomic, assign) UIEdgeInsets contentEdgeInsets;

@end

@implementation WeicyButtonPositionCacheModel

@end

@implementation UIButton (WeicyCommon)

- (void)weicy_setButtonImagePosition:(WeicyButtonImagePositionType)type spacing:(CGFloat)spacing {
    NSCache *cache = [WeicyButtonPositionCacheManager sharedInstance].cache;
    NSString *cacheKey = [NSString stringWithFormat:@"%@_%@_%@", self.currentTitle, @(self.titleLabel.font.hash),@(type)];
    WeicyButtonPositionCacheModel *savedModel = [cache objectForKey:cacheKey];
    if (savedModel != nil) {
        self.imageEdgeInsets = savedModel.imageEdgeInsets;
        self.titleEdgeInsets = savedModel.titleEdgeInsets;
        self.contentEdgeInsets = savedModel.contentEdgeInsets;
        return;
    }
    
    CGFloat imageWidth = self.currentImage.size.width;
    CGFloat imageHeight = self.currentImage.size.height;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    // Single line, no wrapping. Truncation based on the NSLineBreakMode.
    CGSize size = [self.currentTitle sizeWithFont:self.titleLabel.font];
    CGFloat labelWidth = size.width;
    CGFloat labelHeight = size.height;
#pragma clang diagnostic pop
    
    CGFloat imageOffsetX = (imageWidth + labelWidth) / 2 - imageWidth / 2;//image中心移动的x距离
    CGFloat imageOffsetY = imageHeight / 2 + spacing / 2;//image中心移动的y距离
    CGFloat labelOffsetX = (imageWidth + labelWidth / 2) - (imageWidth + labelWidth) / 2;//label中心移动的x距离
    CGFloat labelOffsetY = labelHeight / 2 + spacing / 2;//label中心移动的y距离
    
    CGFloat tempWidth = MAX(labelWidth, imageWidth);
    CGFloat changedWidth = labelWidth + imageWidth - tempWidth;
    CGFloat tempHeight = MAX(labelHeight, imageHeight);
    CGFloat changedHeight = labelHeight + imageHeight + spacing - tempHeight;
    
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets titleEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets contentEdgeInsets = UIEdgeInsetsZero;
    
    switch (type) {
        case WeicyButtonImagePositionTypeLeft:
            imageEdgeInsets = UIEdgeInsetsMake(0, -spacing/2, 0, spacing/2);
            titleEdgeInsets = UIEdgeInsetsMake(0, spacing/2, 0, -spacing/2);
            contentEdgeInsets = UIEdgeInsetsMake(0, spacing/2, 0, spacing/2);
            break;
            
        case WeicyButtonImagePositionTypeRight:
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth + spacing/2, 0, -(labelWidth + spacing/2));
            titleEdgeInsets = UIEdgeInsetsMake(0, -(imageWidth + spacing/2), 0, imageWidth + spacing/2);
            contentEdgeInsets = UIEdgeInsetsMake(0, spacing/2, 0, spacing/2);
            break;
            
        case WeicyButtonImagePositionTypeTop:
            imageEdgeInsets = UIEdgeInsetsMake(-imageOffsetY, imageOffsetX, imageOffsetY, -imageOffsetX);
            titleEdgeInsets = UIEdgeInsetsMake(labelOffsetY, -labelOffsetX, -labelOffsetY, labelOffsetX);
            contentEdgeInsets = UIEdgeInsetsMake(imageOffsetY, -changedWidth/2, changedHeight-imageOffsetY, -changedWidth/2);
            break;
            
        case WeicyButtonImagePositionTypeBottom:
            imageEdgeInsets = UIEdgeInsetsMake(imageOffsetY, imageOffsetX, -imageOffsetY, -imageOffsetX);
            titleEdgeInsets = UIEdgeInsetsMake(-labelOffsetY, -labelOffsetX, labelOffsetY, labelOffsetX);
            contentEdgeInsets = UIEdgeInsetsMake(changedHeight-imageOffsetY, -changedWidth/2, imageOffsetY, -changedWidth/2);
            break;
            
        default:
            break;
    }
    
    WeicyButtonPositionCacheModel *model = [[WeicyButtonPositionCacheModel alloc] init];
    model.imageEdgeInsets = imageEdgeInsets;
    model.titleEdgeInsets = titleEdgeInsets;
    model.contentEdgeInsets = contentEdgeInsets;
    [cache setObject:model forKey:cacheKey];
    
    self.imageEdgeInsets = imageEdgeInsets;
    self.titleEdgeInsets = titleEdgeInsets;
    self.contentEdgeInsets = contentEdgeInsets;
}

#pragma mark - 倒计时相关
- (void)weicy_startTimer:(double)totalTime againTitle:(NSString *)againTitle againColor:(UIColor *)againColor timeFormat:(NSString *)timeFromat timeColor:(UIColor *)timeColor {
    // 倒计时时间
    __block NSInteger timeOut = totalTime > 0 ? totalTime : 60 ;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC, 0.0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        if (timeOut <= 0) {
            // 倒计时结束，关闭
            dispatch_source_cancel(timer);
            // 主线程操作UI
            dispatch_async(dispatch_get_main_queue(), ^{
                // 倒计时结束显示的UI文本
                [self setTitle:againTitle forState:UIControlStateNormal];
                [self setTitleColor:againColor forState:UIControlStateNormal];
                self.userInteractionEnabled = YES;
            });
        } else {
            // 倒计时中
            NSString * timeStr = [NSString stringWithFormat:timeFromat,timeOut];
            // 主线程操作UI
            dispatch_async(dispatch_get_main_queue(), ^{
                // 倒计中显示的UI文本
                [self setTitle:timeStr forState:UIControlStateNormal];
                [self setTitleColor:timeColor forState:UIControlStateNormal];
                self.userInteractionEnabled = NO;
            });
            
            timeOut--;
        }
    });
    dispatch_resume(timer);
}

@end

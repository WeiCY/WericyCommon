//
//  UIControl+WeicyAddForCombo.m
//  deede
//
//  Created by CityDoWCY on 2020/12/23.
//

#import "UIControl+WeicyAddForCombo.h"
#import <objc/runtime.h>

static char * const weicy_eventIntervalKey = "weicy_eventIntervalKey";
static char * const weicy_eventUnavailableKey = "weicy_eventUnavailableKey";
static char * const weicy_comboIgnoreKey = "weicy_comboIgnoreKey";

@interface UIControl ()

@property (nonatomic, assign) BOOL weicy_eventUnavailable;

@end

@implementation UIControl (WeicyAddForCombo)

+ (void)load {
    Method method = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method weicy_method = class_getInstanceMethod(self, @selector(weicy_sendAction:to:forEvent:));
    method_exchangeImplementations(method, weicy_method);
}

#pragma mark - Action functions
- (void)weicy_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    
    if (self.weicy_comboIgnore) {
        if (self.weicy_eventUnavailable == NO) {
            self.weicy_eventUnavailable = YES;
            [self weicy_sendAction:action to:target forEvent:event];
            // 延迟间隔时间把他改为false 以便进行下一步
            [self performSelector:@selector(setWeicy_eventUnavailable:) withObject:@(NO) afterDelay:self.weicy_eventInterval];
        }
    } else {
        [self weicy_sendAction:action to:target forEvent:event];
    }
}

#pragma mark set / get
- (NSTimeInterval)weicy_eventInterval {
    return [objc_getAssociatedObject(self, weicy_eventIntervalKey) doubleValue];
}

- (void)setWeicy_eventInterval:(NSTimeInterval)weicy_eventInterval {
    objc_setAssociatedObject(self, weicy_eventIntervalKey, @(weicy_eventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)weicy_eventUnavailable {
    return [objc_getAssociatedObject(self, weicy_eventUnavailableKey) boolValue];
}

- (void)setWeicy_eventUnavailable:(BOOL)weicy_eventUnavailable {
    objc_setAssociatedObject(self, weicy_eventUnavailableKey, @(weicy_eventUnavailable), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)weicy_comboIgnore {
    return [objc_getAssociatedObject(self, weicy_comboIgnoreKey) boolValue];
}

- (void)setWeicy_comboIgnore:(BOOL)weicy_comboIgnore {
    objc_setAssociatedObject(self, weicy_comboIgnoreKey, @(weicy_comboIgnore), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


@end

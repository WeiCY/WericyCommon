//
//  UIGestureRecognizer+WeicyCommon.m
//  Common
//
//  Created by CityDoWCY on 2020/12/14.
//

#import "UIGestureRecognizer+WeicyCommon.h"
#import <objc/runtime.h>

static const int block_key;

@interface _WeicyUIGestureRecognizerBlockTarget : NSObject

@property (nonatomic, copy) void (^block)(id sender);

- (id)initWithBlock:(void (^)(id sender))block;
- (void)invoke:(id)sender;

@end

@implementation _WeicyUIGestureRecognizerBlockTarget

- (id)initWithBlock:(void (^)(id sender))block{
    self = [super init];
    if (self) {
        _block = [block copy];
    }
    return self;
}

- (void)invoke:(id)sender {
    if (_block) _block(sender);
}

@end

@implementation UIGestureRecognizer (WeicyCommon)

#pragma mark - action初始化创建
/// 通过alloc方法创建
/// @param block 事件回调
- (instancetype)initWithActionBlock:(void (^)(id sender))block {
    self = [self init];
    [self weicy_addActionBlock:block];
    return self;
}

/// 直接手势添加
/// @param block 事件回调
- (void)weicy_addActionBlock:(void (^)(id sender))block {
    _WeicyUIGestureRecognizerBlockTarget *target = [[_WeicyUIGestureRecognizerBlockTarget alloc] initWithBlock:block];
    [self addTarget:target action:@selector(invoke:)];
    NSMutableArray *targets = [self _weicy_allUIGestureRecognizerBlockTargets];
    [targets addObject:target];
}

#pragma mark - 移除
/// 移除事件回调
- (void)weicy_removeAllActionBlocks {
    NSMutableArray *targets = [self _weicy_allUIGestureRecognizerBlockTargets];
    [targets enumerateObjectsUsingBlock:^(id target, NSUInteger idx, BOOL *stop) {
        [self removeTarget:target action:@selector(invoke:)];
    }];
    [targets removeAllObjects];
}

- (NSMutableArray *)_weicy_allUIGestureRecognizerBlockTargets {
    NSMutableArray *targets = objc_getAssociatedObject(self, &block_key);
    if (!targets) {
        targets = [NSMutableArray array];
        objc_setAssociatedObject(self, &block_key, targets, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return targets;
}

@end

//
//  UIControl+WeicyCommon.m
//  Common
//
//  Created by CityDoWCY on 2020/12/2.
//

#import "UIControl+WeicyCommon.h"
#import <objc/runtime.h>

/// we don't have to use  -all_load or -force_load to load object files from static libraries that only contain categories and no classes.
@interface UIColor_WeicyCommon : NSObject

@end

@implementation UIColor_WeicyCommon

@end


static const int block_key;

@interface _WeicyUIControlBlockTarget : NSObject

@property (nonatomic, copy) void (^block)(id sender);
@property (nonatomic, assign) UIControlEvents events;

- (id)initWithBlock:(void (^)(id sender))block events:(UIControlEvents)events;
- (void)invoke:(id)sender;

@end

@implementation _WeicyUIControlBlockTarget

- (id)initWithBlock:(void (^)(id sender))block events:(UIControlEvents)events {
    self = [super init];
    if (self) {
        _block = [block copy];
        _events = events;
    }
    return self;
}

- (void)invoke:(id)sender {
    if (_block) _block(sender);
}

@end


@interface UIControl ()

@property (nonatomic, assign) BOOL weicy_eventUnavailable;

@end

@implementation UIControl (WeicyCommon)

#pragma mark - 事件回调
- (void)weicy_removeAllTargets {
    [[self allTargets] enumerateObjectsUsingBlock: ^(id object, BOOL *stop) {
        [self removeTarget:object action:NULL forControlEvents:UIControlEventAllEvents];
    }];
    [[self _weicy_allUIControlBlockTargets] removeAllObjects];
}

- (NSMutableArray *)_weicy_allUIControlBlockTargets {
    NSMutableArray *targets = objc_getAssociatedObject(self, &block_key);
    if (!targets) {
        targets = [NSMutableArray array];
        objc_setAssociatedObject(self, &block_key, targets, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return targets;
}

- (void)weicy_setBlockForControlEvents:(UIControlEvents)controlEvents block:(void (^)(id sender))block {
    [self removeAllBlocksForControlEvents:UIControlEventAllEvents];
    [self addBlockForControlEvents:controlEvents block:block];
}

- (void)removeAllBlocksForControlEvents:(UIControlEvents)controlEvents {
    if (!controlEvents) return;
    
    NSMutableArray *targets = [self _weicy_allUIControlBlockTargets];
    NSMutableArray *removes = [NSMutableArray array];
    for (_WeicyUIControlBlockTarget *target in targets) {
        if (target.events & controlEvents) {
            UIControlEvents newEvent = target.events & (~controlEvents);
            if (newEvent) {
                [self removeTarget:target action:@selector(invoke:) forControlEvents:target.events];
                target.events = newEvent;
                [self addTarget:target action:@selector(invoke:) forControlEvents:target.events];
            } else {
                [self removeTarget:target action:@selector(invoke:) forControlEvents:target.events];
                [removes addObject:target];
            }
        }
    }
    [targets removeObjectsInArray:removes];
}

- (void)addBlockForControlEvents:(UIControlEvents)controlEvents
                           block:(void (^)(id sender))block {
    if (!controlEvents) return;
    _WeicyUIControlBlockTarget *target = [[_WeicyUIControlBlockTarget alloc]
                                       initWithBlock:block events:controlEvents];
    [self addTarget:target action:@selector(invoke:) forControlEvents:controlEvents];
    NSMutableArray *targets = [self _weicy_allUIControlBlockTargets];
    [targets addObject:target];
}

@end

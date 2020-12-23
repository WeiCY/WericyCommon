//
//  NSArray+WeicyCommon.m
//  Common
//
//  Created by CityDoWCY on 2020/12/1.
//

#import "NSArray+WeicyCommon.h"

@implementation NSArray (WeicyCommon)

- (nullable id)weicy_randomObject {
    if (self.count) {
        return self[arc4random_uniform((u_int32_t)self.count)];
    }
    return nil;
}

- (nullable id)weicy_safeObjectAtIndex:(NSUInteger)index {
    return index < self.count ? self[index] : nil;
}

- (BOOL)weicy_isEmptyArray {
    return [self count] == 0 ? YES : NO;
}

@end



@implementation NSMutableArray (WeicyCommon)

- (void)weicy_removeFirstObject {
    if (self.count) {
        [self removeObjectAtIndex:0];
    }
}

- (void)weicy_appendObject:(id)anObject {
    [self addObject:anObject];
}

- (void)weicy_prependObject:(id)anObject {
    [self insertObject:anObject atIndex:0];
}

- (void)weicy_appendObjects:(NSArray *)objects {
    if (!objects) {
        return;
    }
    [self addObjectsFromArray:objects];
}

- (void)weicy_prependObjects:(NSArray *)objects {
    if (!objects) {
        return;
    }
    NSInteger i = 0;
    for (id obj in objects) {
        [self insertObject:obj atIndex:i++];
    }
}

- (void)weicy_insertObjects:(NSArray *)objects atIndex:(NSUInteger)index {
    if (!objects) {
        return;
    };
    
    if (index > self.count) {
        return;
    }
    
    NSUInteger i = index;
    for (id obj in objects) {
        [self insertObject:obj atIndex:i++];
    }
}

- (void)weicy_reverseArray {
    NSUInteger count = self.count;
    int mid = floor(count / 2.0);
    for (NSUInteger i = 0; i < mid; i++) {
        [self exchangeObjectAtIndex:i withObjectAtIndex:(count - (i + 1))];
    }
}

@end

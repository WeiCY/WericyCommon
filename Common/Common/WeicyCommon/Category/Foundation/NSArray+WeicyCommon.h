//
//  NSArray+WeicyCommon.h
//  Common
//
//  Created by CityDoWCY on 2020/12/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 为NSArray添加的扩展
 
 原本打算是添加一些修改数组的方法，类似NSMutableArray，后来一想没有什么作用，还容易让别人误解，就不添加了。
 */
@interface NSArray (WeicyCommon)

/// 返回位于随机索引处的对象。 如果数组为空，则返回nil。
- (nullable id)weicy_randomObject;

/// 返回位于索引处的对象，或在越界时返回nil
/// @param index 索引
- (nullable id)weicy_safeObjectAtIndex:(NSUInteger)index;

/// 返回是否为空数组
- (BOOL)weicy_isEmptyArray;

@end


/// 为NSMutableArray添加的扩展
@interface NSMutableArray (WeicyCommon)

/**
 删除数组中值索引为0的对象。
 如果数组为空，则此方法无效。
 */
- (void)weicy_removeFirstObject;

/// 在数组的开头插入一个给定的对象。
/// @param anObject 将对象添加到数组内容的末尾。 不能为null
- (void)weicy_appendObject:(nonnull id)anObject;

/// 在数组的开头插入一个给定的对象。
/// @param anObject 将对象添加到数组内容的开头。
- (void)weicy_prependObject:(nonnull id)anObject;

/// 将包含在另一个给定数组中的对象添加到接收的数组的末尾。
/// @param objects 对象数组
- (void)weicy_appendObjects:(NSArray *_Nullable)objects;

/// 将包含在另一个给定数组中的对象添加到接收的数组的开头。
/// @param objects 对象数组
- (void)weicy_prependObjects:(NSArray *_Nullable)objects;

/// 将包含在另一个给定数组中的对象添加到接收的索引中。
/// @param objects 对象数组
/// @param index 序列号 这个值必须不大于数组中元素的计数。如果索引大于数组中元素的数量，无效
- (void)weicy_insertObjects:(NSArray *_Nullable)objects atIndex:(NSUInteger)index;

/// 倒序输出数组
- (void)weicy_reverseArray;

@end

NS_ASSUME_NONNULL_END

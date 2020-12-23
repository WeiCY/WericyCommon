//
//  NSDate+WeicyCommon.h
//  Common
//
//  Created by CityDoWCY on 2020/12/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 为NSDate添加常用属性方法
@interface NSDate (WeicyCommon)

#pragma mark - Component Properties
@property (nonatomic, readonly) NSInteger weicy_year; ///< 年 component
@property (nonatomic, readonly) NSInteger weicy_month; ///< 月 component (1~12)
@property (nonatomic, readonly) NSInteger weicy_day; ///< 日 component (1~31)
@property (nonatomic, readonly) NSInteger weicy_hour; ///< 时 component (0~23)
@property (nonatomic, readonly) NSInteger weicy_minute; ///< 分 component (0~59)
@property (nonatomic, readonly) NSInteger weicy_second; ///< 秒 component (0~59)
@property (nonatomic, readonly) NSInteger weicy_weekday; ///< 周几 从周日开始 component (1~7, first day is based on user setting)
@property (nonatomic, readonly) NSInteger weicy_weekdayOrdinal; ///< 周几 从周日开始 component
@property (nonatomic, readonly) NSInteger weicy_weekOfMonth; ///< 月的第几周 component (1~5)
@property (nonatomic, readonly) NSInteger weicy_weekOfYear; ///< 年的第几周 component (1~53)

@property (nonatomic, readonly) BOOL weicy_isLeapMonth; ///< 月份是否是闰月
@property (nonatomic, readonly) BOOL weicy_isLeapYear; ///< 月份是否是闰年
@property (nonatomic, readonly) BOOL weicy_isToday; ///< 是不是今天 (based on current locale)

#pragma mark - Format
/**
 根据时间返回字符串

 @return  <60s 刚刚
          <60Min n分钟前
          <24h n小时前
          <1week n天前
          >1week yy-MM-dd hh:mm
 */
- (NSString *)weicy_easyReadPastTimeString;

/// 返回表示此日期的格式化字符串
/// @param format 字符串格式
- (nullable NSString *)weicy_stringWithFormat:(NSString *)format;

/// 返回表示此日期的格式化字符串
/// @param format 字符串时间格式
/// @param timeZone 时区
/// @param locale 语言
- (nullable NSString *)weicy_stringWithFormat:(NSString *)format
                               timeZone:(nullable NSTimeZone *)timeZone
                                 locale:(nullable NSLocale *)locale;


/// 返回解析出来的时间
/// @param dateString 时间字符串
/// @param format 时间格式
+ (nullable NSDate *)weicy_dateWithString:(NSString *)dateString format:(NSString *)format;

/// 返回解析出来的时间
/// @param dateString 时间字符串
/// @param format 时间格式
/// @param timeZone 时区
/// @param locale 语言
+ (nullable NSDate *)weicy_dateWithString:(NSString *)dateString
                             format:(NSString *)format
                           timeZone:(nullable NSTimeZone *)timeZone
                             locale:(nullable NSLocale *)locale;
/**
 关于NSDateFormatter的格式
 G: 公元时代，例如AD公元
 yy: 年的后2位
 yyyy: 完整年
 MM: 月，显示为1-12
 MMM: 月，显示为英文月份简写,如 Jan
 MMMM: 月，显示为英文月份全称，如 Janualy
 dd: 日，2位数表示，如02
 d: 日，1-2位显示，如 2
 EEE: 简写星期几，如Sun
 EEEE: 全写星期几，如Sunday
 aa: 上下午，AM/PM
 H: 时，24小时制，0-23
 K：时，12小时制，0-11
 m: 分，1-2位
 mm: 分，2位
 s: 秒，1-2位
 ss: 秒，2位
 S: 毫秒
 */
#pragma mark - Other
/**
 判断与时间是否一致

 @param date 判断时间
 @return true一致 false不一致
 */
- (BOOL)weicy_isSameDateWithDate:(NSDate *)date;

/**
 判断两个时间的先后

 @param oneDay 第一个时间
 @param anotherDay 第二个时间
 @return  One day is late
          One day is early
          It is same time
 */
+ (NSString *)weicy_compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay;

@end

NS_ASSUME_NONNULL_END

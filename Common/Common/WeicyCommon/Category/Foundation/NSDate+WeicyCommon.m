//
//  NSDate+WeicyCommon.m
//  Common
//
//  Created by CityDoWCY on 2020/12/1.
//

#import "NSDate+WeicyCommon.h"

@implementation NSDate (WeicyCommon)

#pragma mark - Dictionary Convertor
- (NSInteger)weicy_year {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitYear fromDate:self] year];
}

- (NSInteger)weicy_month {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitMonth fromDate:self] month];
}

- (NSInteger)weicy_day {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitDay fromDate:self] day];
}

- (NSInteger)weicy_hour {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitHour fromDate:self] hour];
}

- (NSInteger)weicy_minute {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitMinute fromDate:self] minute];
}

- (NSInteger)weicy_second {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitSecond fromDate:self] second];
}

- (NSInteger)weicy_weekday {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitWeekday fromDate:self] weekday];
}

- (NSInteger)weicy_weekdayOrdinal {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitWeekdayOrdinal fromDate:self] weekdayOrdinal];
}

- (NSInteger)weicy_weekOfMonth {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitWeekOfMonth fromDate:self] weekOfMonth];
}

- (NSInteger)weicy_weekOfYear {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitWeekOfYear fromDate:self] weekOfYear];
}

- (BOOL)weicy_isLeapMonth {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitQuarter fromDate:self] isLeapMonth];
}

- (BOOL)weicy_isLeapYear {
    NSUInteger year = self.weicy_year;
    return ((year % 400 == 0) || ((year % 100 != 0) && (year % 4 == 0)));
}

- (BOOL)weicy_isToday {
    if (fabs(self.timeIntervalSinceNow) >= 60 * 60 * 24) return NO;
    return [NSDate new].weicy_day == self.weicy_day;
}

#pragma mark - Format
- (NSString *)weicy_easyReadPastTimeString {
    NSTimeInterval timeOffset = [[NSDate date] timeIntervalSinceNow] - [self timeIntervalSinceNow];
    if (timeOffset < 0) {
        return @"时间在未来";
    } else if (timeOffset < 60) {
        return @"刚刚";
    } else if (timeOffset < 60 * 60) {
        long min = (long)timeOffset/60;
        return [NSString stringWithFormat:@"%ld分钟前", min];
    } else if (timeOffset < 60 * 60 * 24) {
        long hour = (long)timeOffset/3660;
        return [NSString stringWithFormat:@"%ld小时前", hour];
    } else if (timeOffset < 60 * 60 * 24 * 7) {
        long day = (long)timeOffset/(3600*24);
        return [NSString stringWithFormat:@"%ld天前", day];
    } else {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yy-MM-dd hh:mm";
        return [formatter stringFromDate:self];
    }
}

- (NSString *)weicy_stringWithFormat:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    [formatter setLocale:[NSLocale currentLocale]];
    return [formatter stringFromDate:self];
}

- (NSString *)weicy_stringWithFormat:(NSString *)format timeZone:(NSTimeZone *)timeZone locale:(NSLocale *)locale {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    if (timeZone) [formatter setTimeZone:timeZone];
    if (locale) [formatter setLocale:locale];
    return [formatter stringFromDate:self];
}

+ (nullable NSDate *)weicy_dateWithString:(NSString *)dateString format:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    return [formatter dateFromString:dateString];
}

+ (nullable NSDate *)weicy_dateWithString:(NSString *)dateString
                             format:(NSString *)format
                           timeZone:(nullable NSTimeZone *)timeZone
                                   locale:(nullable NSLocale *)locale {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    if (timeZone) [formatter setTimeZone:timeZone];
    if (locale) [formatter setLocale:locale];
    return [formatter dateFromString:dateString];
}

- (BOOL)weicy_isSameDateWithDate:(NSDate *)date {
    NSDateFormatter *formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"yyyy-MM-dd"];
    NSString *dateStr = [formater stringFromDate:self];
    NSString *dateStr1 = [formater stringFromDate:date];
    return [dateStr isEqualToString:dateStr1];
}

#pragma mark - other
+ (NSString *)weicy_compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    
    NSString *oneDayStr = [dateFormatter stringFromDate:oneDay];
    NSString *anotherDayStr = [dateFormatter stringFromDate:anotherDay];
    
    NSDate *dateA = [dateFormatter dateFromString:oneDayStr];
    NSDate *dateB = [dateFormatter dateFromString:anotherDayStr];
    
    NSComparisonResult result = [dateA compare:dateB];
    NSLog(@"date1 : %@, date2 : %@", oneDay, anotherDay);
    if (result == NSOrderedDescending) {
        //NSLog(@"Date1  is in the future");
        return @"One day is late";
    }
    else if (result == NSOrderedAscending){
        //NSLog(@"Date1 is in the past");
        return @"One day is early";
    }
    //NSLog(@"Both dates are the same");
    return @"It is same time";
}

@end

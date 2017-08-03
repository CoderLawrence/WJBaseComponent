//
//  NSDate+Extensions.m
//  TodayNews
//
//  Created by Lawrence on 2017/7/12.
//  Copyright © 2017年 Lawrence. All rights reserved.
//

#import "NSDate+Extensions.h"

@implementation NSDate (Extensions)

- (NSDate *)dateWithYMD {
    return [self dateWithFormat:DATEFORMAT_yyMMdd];
}

- (NSDate *)dateWithFormat:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = format;
    NSString *selfStr = [formatter stringFromDate:self];
    return [formatter dateFromString:selfStr];
}

/**
 获得当前时间差

 @return 时间差
 */
- (NSDateComponents *)dateWithNow {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear;
    return [calendar components:unit fromDate:self toDate:[NSDate date] options:0];
}

/**
 判断是否为今天
 
 @return YES/NO
 */
- (BOOL)isToday {
    NSCalendar *calender = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear;
    
    //获取当前时间年月日
    NSDateComponents *nowCmps = [calender components:unit fromDate:[NSDate date]];
    //获取self的年月日
    NSDateComponents *selfCmps = [calender components:unit fromDate:self];
    return (selfCmps.year == nowCmps.year) && (selfCmps.month == nowCmps.month) && (selfCmps.day == nowCmps.day);
}

/**
 判断是否为昨天

 @return YES/NO
 */
- (BOOL)isYesterday {
    NSDate *nowDate = [[NSDate date] dateWithYMD];
    NSDate *selfDate = [self dateWithYMD];
    
    //获得nowDate和selfDate的时间差
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *cmps = [calendar components:NSCalendarUnitDay fromDate:selfDate toDate:nowDate options:0];
    return cmps.day == 1;
}

/**
 判断是否为今年

 @return YES/NO
 */
- (BOOL)isThisYear {
    NSDate *nowDate = [NSDate date];
    int unit = NSCalendarUnitYear;
    
    NSCalendar *calentar = [NSCalendar currentCalendar];
    NSDateComponents *nowCmps = [calentar components:unit fromDate:nowDate];
    NSDateComponents *selfCmps = [calentar components:unit fromDate:self];
    
    return nowCmps.year == selfCmps.year;
}

@end

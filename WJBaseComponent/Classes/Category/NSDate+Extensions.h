//
//  NSDate+Extensions.h
//  TodayNews
//
//  Created by Lawrence on 2017/7/12.
//  Copyright © 2017年 Lawrence. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DATEFORMAT_yyMMdd @"yy-MM-dd"

@interface NSDate (Extensions)

/**
 返回一个只有年月日的时间

 @return 日期时间
 */
- (NSDate *)dateWithYMD;

/**
 返回日期时间

 @param format 日期时间格式
 @return 返回日期时间
 */
- (NSDate *)dateWithFormat:(NSString *)format;

/**
 获得当前时间差
 
 @return 时间差
 */
- (NSDateComponents *)dateWithNow;

/**
 判断是否为今天
 
 @return YES/NO
 */
- (BOOL)isToday;

/**
 是否为昨天

 @return YES/NO
 */
- (BOOL)isYesterday;

/**
 是否为今年

 @return YES/NO
 */
- (BOOL)isThisYear;

@end

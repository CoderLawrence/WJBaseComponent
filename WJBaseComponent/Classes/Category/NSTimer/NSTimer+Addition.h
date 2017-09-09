//
//  NSTimer+Addition.h
//  TodayNews
//
//  Created by Lawrence on 2017/7/18.
//  Copyright © 2017年 Lawrence. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (Addition)

/**
 暂停定时器
 */
- (void)pauseTimer;

/**
 重新开启定时器
 */
- (void)resumeTimer;

/**
 在指定的时候后重新开启定时器

 @param interval 时间戳
 */
- (void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval;

@end

//
//  NSObject+Guard.h
//  TodayNews
//
//  Created by Lawrence on 2017/7/14.
//  Copyright © 2017年 Lawrence. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Guard)

/**
 添加一个block,当该对象被释放时调用

 @param block 回调函数
 */
- (void)guard_addDeallocBlock:(void (^)(void))block;

@end

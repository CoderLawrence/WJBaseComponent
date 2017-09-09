//
//  NSObject+Dictionary.h
//  TodayNews
//
//  Created by Lawrence on 2017/6/18.
//  Copyright © 2017年 Lawrence. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Dictionary)

/**
 对象转换为字典

 @return 对象转换后的字典
 */
- (NSMutableDictionary *)getParameterDictionary;

@end

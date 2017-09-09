//
//  NSJSONSerialization+JSON.h
//  TodayNews
//
//  Created by Lawrence on 2017/6/20.
//  Copyright © 2017年 Lawrence. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSJSONSerialization (JSON)

+ (nullable NSString *)stringWithJSONObject:(nonnull id)JSONObject;
+ (nullable id)objectWithJSONString:(nonnull NSString *)JSONString;
+ (nullable id)objectWithJSONData:(nonnull NSData *)JSONData;

@end

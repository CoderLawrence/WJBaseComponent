//
//  NSData+Extensions.h
//  TodayNews
//
//  Created by Lawrence on 2017/6/18.
//  Copyright © 2017年 Lawrence. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (Extensions)

/**
 通过图片data数据第一个字节 来获取图片扩展名

 @param data 图片字节
 @return 图片扩展名
 */
- (NSString *)contentTypeForImageData:(NSData *)data;

@end

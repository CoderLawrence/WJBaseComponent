//
//  NSObject+Extensions.m
//  Pods
//
//  Created by Lawrence on 2017/9/9.
//
//

#import "NSObject+Extensions.h"

@implementation NSObject (Extensions)

/**
 计算文本的高度
 
 @param str 需要计算的文本
 @param font 文本显示的字体
 @param maxSize 文本显示范围
 @return 文本占用的真实高度
 */
- (CGSize)sizeWithString:(NSString *)str font:(UIFont *)font maxSize:(CGSize)maxSize {
    NSDictionary *dict = @{NSFontAttributeName : font};
    CGSize size = [str boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    return size;
}

@end

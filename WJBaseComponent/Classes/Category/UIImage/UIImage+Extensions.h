//
//  UIImage+Extensions.h
//  TodayNews
//
//  Created by Lawrence on 2017/6/18.
//  Copyright © 2017年 Lawrence. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extensions)

/**
 判断图片是否有透明通道

 @return YES/NO
 */
- (BOOL)hasAlphaChannel;

/**
 颜色装换图片

 @param color 颜色
 @return 图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

/**
 获取灰度图片

 @param sourceImage 需要转换为灰度图片的原始图片
 @return 装换后的灰度图片
 */
+ (UIImage *)covertToGrayImageFromImage:(UIImage *)sourceImage;

/**
 根据bundle中的文件名读取图片
 
 @param name 文件名称
 @return 图片
 */
+ (UIImage *)imageWithFileName:(NSString *)name;

/**
 合成两个图片

 @param firstImage 第一张图片
 @param secondImage 第二张图片
 @return 合成后的图片
 */
+ (UIImage *)margeImage:(UIImage *)firstImage withImage:(UIImage *)secondImage;

/**
 拉伸图片

 @param image 要拉伸的图片
 @return 拉伸后的图片
 */
+ (UIImage *)resizableImage:(UIImage *)image;

/**
 获取图片某一点的颜色

 @param point 坐标
 @return 颜色
 */
- (UIColor *)getColorWithPoint:(CGPoint)point;

/**
 高斯模糊

 @param image 图片
 @param level 模糊程度
 @return 高斯模糊后的图片
 */
+ (UIImage *)boxBlurImage:(UIImage *)image withBlurLevel:(CGFloat)level;

@end

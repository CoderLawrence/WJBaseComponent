//
//  UIImage+Bundle.h
//  WJBaseComponent
//
//  Created by Lawrence on 2017/10/15.
//

#import <UIKit/UIKit.h>

@interface UIImage (Bundle)

/**
 通过bundle资源加载图片
 
 @param name 图片名称
 @param bundleName 图片bundle包的名称
 @param bundleClass bundle同目录下的类（作用是为了获取bundle的路径）
 @return 图片
 */
+ (UIImage *)imageWithName:(NSString *)name inBundleName:(NSString *)bundleName bundleForClass:(Class)bundleClass;

@end

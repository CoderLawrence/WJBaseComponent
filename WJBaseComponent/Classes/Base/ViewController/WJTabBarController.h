//
// Created by Lawrence on 2017/8/13.
//

#import <UIKit/UIKit.h>

@interface WJTabBarController : UITabBarController

/*
 * 添加子控制器(此方法会添加默认的导航栏，只需要传递默认的控制器即可)
 */
-(void)addViewControllers:(NSArray *)viewControllers;

@end
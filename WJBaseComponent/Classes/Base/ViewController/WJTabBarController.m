//
// Created by Lawrence on 2017/8/13.
//

#import "Macros.h"
#import "WJTabBarController.h"
#import "WJNavigationViewController.h"

@implementation WJTabBarController

+ (void)initialize {
    [super initialize];

    //统一TabBar样式
    [[UITabBar appearance] setBarStyle:UIBarStyleDefault];
    [[UITabBar appearance] setTintColor:WJColor(245.0f, 90.0f, 93.0f, 1.0f)];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

/*
 * 添加子控制器
 */
- (void)addViewControllers:(NSArray *)viewControllers {
    for (UIViewController *childVC in viewControllers) {
        WJNavigationViewController *nav = [[WJNavigationViewController alloc] initWithRootViewController:childVC];
        [self addChildViewController:nav];
    }
}

@end
//
//  WJNavigationViewController.m
//  Pods
//
//  Created by Lawrence on 2017/8/4.
//
//

#import "WJNavigationViewController.h"
#import <SVProgressHUD/SVProgressHUD.h>
#import "Macros.h"

@interface WJNavigationViewController ()

@end

@implementation WJNavigationViewController

+ (void)initialize {
    [super initialize];

    //统一导航栏样式和标题
    [[UINavigationBar appearance] setBarTintColor:WJGlobalRadColor];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];

    NSDictionary *attributes = @{
            NSForegroundColorAttributeName: [UIColor whiteColor],
            NSFontAttributeName: [UIFont systemFontOfSize:20.0f],
    };

    [[UINavigationBar appearance] setTitleTextAttributes:attributes];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;

        //统一返回按钮样式
        UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"checkUserType_backward_9x15_.png"]
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(navigationBackClick)];
        viewController.navigationItem.leftBarButtonItem = leftBarButtonItem;
    }

    [super pushViewController:viewController animated:animated];
}

- (void)navigationBackClick {
    if ([SVProgressHUD isVisible]) {
        [SVProgressHUD dismiss];
    }

    if ([[UIApplication sharedApplication] isNetworkActivityIndicatorVisible]) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    }

    [self popViewControllerAnimated:YES];
}

@end

//
//  WJNavigationViewController.m
//  Pods
//
//  Created by Lawrence on 2017/8/4.
//
//

#import "WJNavigationViewController.h"
#import <SVProgressHUD/SVProgressHUD.h>

@interface WJNavigationViewController ()

@end

@implementation WJNavigationViewController

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

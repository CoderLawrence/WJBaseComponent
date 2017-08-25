//
//  WJViewController.m
//  WJBaseComponent
//
//  Created by CoderLawrence on 08/03/2017.
//  Copyright (c) 2017 CoderLawrence. All rights reserved.
//

#import "WJViewController.h"
#import <WJBaseComponent/WJBaseComponent.h>
#import "WJClassInfosResponse.h"

@interface WJViewController ()

@end

@implementation WJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    WJBaseRequest *request = [[WJBaseRequest alloc] init];
    
    [[WJNetworkConnection networkManager] sendGetRequestWithUrl:@"http://next-retail.scho.com.cn:80/front/xwTypeDefine/queryXwTypeList" requestModel:request responseModel:[WJClassInfosResponse class] beforeSendCallback:^{
        
    } successCallback:^(id result) {
        NSLog(@"result = %@", result);
    } errorCallback:^(NSError *error) {
        
    } completeCallback:^(NSError *error, id result) {
        NSLog(@"result = %@", result);
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

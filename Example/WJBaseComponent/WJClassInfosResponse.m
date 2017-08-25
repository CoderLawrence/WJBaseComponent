//
//  WJClassInfosResponse.m
//  WJBaseComponent
//
//  Created by Lawrence on 2017/8/25.
//  Copyright © 2017年 CoderLawrence. All rights reserved.
//

#import "WJClassInfosResponse.h"

@implementation WJClassModel

@end

@implementation WJClassInfosResponse

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
             @"result": [WJClassModel class],
             };
}

@end

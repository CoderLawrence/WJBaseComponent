//
//  WJBaseRequest.m
//  Pods
//
//  Created by Lawrence on 2017/8/22.
//
//

#import "WJBaseRequest.h"

@implementation WJBaseRequest

- (WJRequestCachePolicy)cachePolicy {
    return WJRequestCachePolicyReloadIgnoringLocalCacheData; //不缓存response数据
}

- (NSUInteger)cacheTimeOutInterval {
    return 0;
}

@end

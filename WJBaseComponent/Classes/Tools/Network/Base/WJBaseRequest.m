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

- (NSUInteger)cacheTimeOutInteval {
    return 0;
}

@end

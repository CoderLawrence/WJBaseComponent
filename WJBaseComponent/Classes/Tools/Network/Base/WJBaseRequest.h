//
//  WJBaseRequest.h
//  Pods
//
//  Created by Lawrence on 2017/8/22.
//
//

#import <Foundation/Foundation.h>

/**
 缓存策略

 - WJRequestCachePolicyReloadIgnoringLocalCacheData: 直接忽略本地缓存直接请求，本地不会缓存Response
 - WJRequestCachePolicyReturnCacheDataElseLoad: 如果本地有缓存则取缓存，否则请求，本地会缓存Response
 */
typedef NS_ENUM(NSUInteger, WJRequestCachePolicy) {
    WJRequestCachePolicyReloadIgnoringLocalCacheData,
    WJRequestCachePolicyReturnCacheDataElseLoad,
};

@interface WJBaseRequest : NSObject

/**
 登录会话token
 */
@property (nonatomic, copy) NSString *accessToken;

/**
 请求缓存策略
 */
@property (nonatomic, assign) WJRequestCachePolicy cachePolicy;

/**
 缓存超时时间 以天为单位：86400 秒
 */
@property (nonatomic, assign) NSUInteger cacheTimeOutInterval;

@end

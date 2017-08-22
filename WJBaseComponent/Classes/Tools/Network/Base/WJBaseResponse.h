//
//  WJBaseResponse.h
//  Pods
//
//  Created by Lawrence on 2017/8/22.
//
//

#import <Foundation/Foundation.h>

@interface WJBaseResponse : NSObject

/**
 缓存写入时间戳
 */
@property (nonatomic, assign) NSDate *cacheDate;

/**
 服务器返回相关数据定义 
 */
@property (nonatomic, assign) BOOL flag;
@property (nonatomic, assign) NSInteger code;
@property (nonatomic, assign) NSInteger errorCode;
@property (nonatomic, strong) NSString *msg;
@property (nonatomic, strong) NSString *errorDetail;
@property (nonatomic, assign) NSInteger totalCount;

@end

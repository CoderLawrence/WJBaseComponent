//
//  WJNetworkConnection.h
//  Pods
//
//  Created by Lawrence on 2017/8/22.
//
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFHTTPSessionManager.h>

/**
 请求结果枚举

 - WJRequestResultSuccess: 请求成功
 - WJRequestResultFail: 请求失败
 */
typedef NS_ENUM(NSUInteger, WJRequestResult) {
    WJRequestResultSuccess,
    WJRequestResultFail,
};

typedef void (^Callback)(NSInteger error, id result);
typedef void (^BeforeSendCallback)(void);
typedef void (^SuccessCallback)(id result);
typedef void (^ErrorCallback)(NSError *error);
typedef void (CompleteCallback)(NSError *error, id result);

@interface WJNetworkConnection : NSObject

/**
 发送post请求

 @param url 请求地址
 @param parameters 请求参数
 @param beforeSendCallback 开始请求回调
 @param successCallback 请求成功回调
 @param errorCallback 请求失败回调
 @param completeCallback 请求完成回调
 */
+ (void)sendPostRequestWithUrl:(NSString *)url parameters:(NSDictionary *)parameters
            beforeSendCallback:(BeforeSendCallback)beforeSendCallback
               successCallback:(SuccessCallback)successCallback
                 errorCallback:(ErrorCallback)errorCallback
              completeCallback:(CompleteCallback)completeCallback;

@end

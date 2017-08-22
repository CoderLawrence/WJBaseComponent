//
//  WJNetworkConnection.m
//  Pods
//
//  Created by Lawrence on 2017/8/22.
//
//

#import "WJNetworkConnection.h"

@implementation WJNetworkConnection

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
              completeCallback:(CompleteCallback)completeCallback {
    
    //配置需要根据项目的需要配置相应的token信息、ca证书等
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setTimeoutInterval:DYLY_REQUEST_TIMEOUT];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/json",@"text/html",@"application/json", nil];
    [manager.requestSerializer setValue:@"ios" forHTTPHeaderField:@"client-info"];
    
    //这个回调的可以添加loading等相关提示
    if (beforeSendCallback) {
        beforeSendCallback();
    }
    
    [manager POST:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (successCallback) {
            successCallback(responseObject);
        }
        
        if (completeCallback) {
            completeCallback(nil, responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (errorCallback) {
            errorCallback(error);
        }
        
        if (completeCallback) {
            completeCallback(error, nil);
        }
    }];
}

/**
 发送get请求
 
 @param url 请求地址
 @param parameters 请求参数
 @param beforeSendCallback 开始请求回调
 @param successCallback 请求成功回调
 @param errorCallback 请求失败回调
 @param completeCallback 请求完成回调
 */
+ (void)sendGetRequestWithUrl:(NSString *)url parameters:(NSDictionary *)parameters
           beforeSendCallback:(BeforeSendCallback)beforeSendCallback
              successCallback:(SuccessCallback)successCallback
                errorCallback:(ErrorCallback)errorCallback
             completeCallback:(CompleteCallback)completeCallback {
    //配置需要根据项目的需要配置相应的token信息、ca证书等
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setTimeoutInterval:DYLY_REQUEST_TIMEOUT];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/json",@"text/html",@"application/json", @"text/plain", nil];
    [manager.requestSerializer setValue:@"ios" forHTTPHeaderField:@"client-info"];
    
    //这个回调的可以添加loading等相关提示
    if (beforeSendCallback) {
        beforeSendCallback();
    }
    
    [manager GET:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (successCallback) {
            successCallback(responseObject);
        }
        
        if (completeCallback) {
            completeCallback(nil, responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (errorCallback) {
            errorCallback(error);
        }
        
        if (completeCallback) {
            completeCallback(error, nil);
        }
    }];
}

@end

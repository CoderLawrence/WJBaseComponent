//
//  WJNetworkConnection+Model.m
//  Pods
//
//  Created by Lawrence on 2017/8/23.
//
//

#import "WJNetworkConnection+Model.h"

@implementation WJNetworkConnection (Model)

/**
 发送post请求
 
 @param url 请求地址
 @param requestModel 请求model
 @param responseModel 返回model
 @param beforeSendCallback 开始请求回调
 @param successCallback 请求成功回调
 @param errorCallback 请求失败回调
 @param completeCallback 请求完成回调
 */
- (void)sendPostRequestWithUrl:(NSString *)url
                  requestModel:(WJBaseRequest *)requestModel
                 responseModel:(Class)responseModel
            beforeSendCallback:(BeforeSendCallback)beforeSendCallback
               successCallback:(SuccessCallback)successCallback
                 errorCallback:(ErrorCallback)errorCallback
              completeCallback:(CompleteCallback)completeCallback {
    //缓存网络请求
    if (requestModel.cachePolicy == WJRequestCachePolicyReloadIgnoringLocalCacheData) {
        
    } else if (requestModel.cachePolicy == WJRequestCachePolicyReturnCacheDataElseLoad) {
        
    }
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithDictionary: [requestModel modelToJSONObject]];
    [parameters removeObjectForKey:@"cachePolicy"];
    [parameters removeObjectForKey:@"cacheTimeOutInterval"];
    
    [self sendPostRequestWithUrl:url
                      parameters:parameters.count > 0 ? parameters : nil
              beforeSendCallback:beforeSendCallback
                 successCallback:^(id result) {
                     if (successCallback) {
                         WJBaseResponse *response = [responseModel modelWithJSON:result];
                         successCallback(response);
                     }
                 } errorCallback:^(NSError *error) {
                     if (errorCallback) {
                         errorCallback(error);
                     }
                 } completeCallback:^(NSError *error, id result) {
                     if (completeCallback) {
                         WJBaseResponse *response = [WJBaseResponse modelWithJSON:result];
                         completeCallback(error, response);
                     }
                 }];
}

/**
 发送get请求
 
 @param url 请求地址
 @param requestModel 请求model
 @param responseModel 返回model
 @param beforeSendCallback 开始请求回调
 @param successCallback 请求成功回调
 @param errorCallback 请求失败回调
 @param completeCallback 请求完成回调
 */
- (void)sendGetRequestWithUrl:(NSString *)url
                 requestModel:(WJBaseRequest *)requestModel
                responseModel:(Class)responseModel
           beforeSendCallback:(BeforeSendCallback)beforeSendCallback
              successCallback:(SuccessCallback)successCallback
                errorCallback:(ErrorCallback)errorCallback
             completeCallback:(CompleteCallback)completeCallback {
    //缓存网络请求
    if (requestModel.cachePolicy == WJRequestCachePolicyReloadIgnoringLocalCacheData) {
        
    } else if (requestModel.cachePolicy == WJRequestCachePolicyReturnCacheDataElseLoad) {
        
    }
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithDictionary: [requestModel modelToJSONObject]];
    [parameters removeObjectForKey:@"cachePolicy"];
    [parameters removeObjectForKey:@"cacheTimeOutInterval"];
    
    [self sendGetRequestWithUrl:url
                     parameters:parameters.count > 0 ? parameters : nil
             beforeSendCallback:beforeSendCallback
                successCallback:^(id result) {
                    if (successCallback) {
                        WJBaseResponse *response = [responseModel modelWithJSON:result];
                        successCallback(response);
                    }
                } errorCallback:^(NSError *error) {
                    if (errorCallback) {
                        errorCallback(error);
                    }
                } completeCallback:^(NSError *error, id result) {
                    if (completeCallback) {
                        WJBaseResponse *response = [WJBaseResponse modelWithJSON:result];
                        completeCallback(error, response);
                    }
                }];
}

@end

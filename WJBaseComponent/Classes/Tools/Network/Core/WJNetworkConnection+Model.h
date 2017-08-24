//
//  WJNetworkConnection+Model.h
//  Pods
//
//  Created by Lawrence on 2017/8/23.
//
//

#import "WJNetworkConnection.h"
#import "WJBaseRequest.h"
#import "WJBaseResponse.h"

@interface WJNetworkConnection (Model)

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
              completeCallback:(CompleteCallback)completeCallback;

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
             completeCallback:(CompleteCallback)completeCallback;

@end

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
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithDictionary: [requestModel yy_modelToJSONObject]];
    [parameters removeObjectForKey:@"cachePolicy"];
    [parameters removeObjectForKey:@"cacheTimeOutInterval"];
    
    [self sendPostRequestWithUrl:url
                      parameters:parameters.count > 0 ? parameters : nil
              beforeSendCallback:beforeSendCallback
                 successCallback:^(id result) {
                     if (successCallback) {
                         WJBaseResponse *response = [responseModel yy_modelWithJSON:result];
                         successCallback(response);
                     }
                 } errorCallback:^(NSError *error) {
                     if (errorCallback) {
                         errorCallback(error);
                     }
                 } completeCallback:^(NSError *error, id result) {
                     if (completeCallback) {
                         WJBaseResponse *response = [responseModel yy_modelWithJSON:result];
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
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithDictionary: [requestModel yy_modelToJSONObject]];
    [parameters removeObjectForKey:@"cachePolicy"];
    [parameters removeObjectForKey:@"cacheTimeOutInterval"];
    
    [self sendGetRequestWithUrl:url
                     parameters:parameters.count > 0 ? parameters : nil
             beforeSendCallback:beforeSendCallback
                successCallback:^(id result) {
                    if (successCallback) {
                        WJBaseResponse *response = [responseModel yy_modelWithJSON:result];
                        successCallback(response);
                    }
                } errorCallback:^(NSError *error) {
                    if (errorCallback) {
                        errorCallback(error);
                    }
                } completeCallback:^(NSError *error, id result) {
                    if (completeCallback) {
                        WJBaseResponse *response = [responseModel yy_modelWithJSON:result];
                        completeCallback(error, response);
                    }
                }];
}

/**
 批量上传图片
 
 @param url 请求地址
 @param name 服务端对应的字段名称
 @param fileName 服务端文件名称
 @param photoImages 图片
 @param requestModel 请求参数
 @param responseModel 返回参数
 @param beforeSendCallback 开始上传回调
 @param successCallback 上传完成回调
 @param errorCallback 上传失败回调
 @param completeCallback 上传完成回调
 */
- (void)sendUploadImagesRequestWithUrl:(NSString *)url
                                  name:(NSString *)name
                              fileName:(NSString *)fileName
                           photoImages:(NSArray *)photoImages
                          requestModel:(WJBaseRequest *)requestModel
                         responseModel:(Class)responseModel
                    beforeSendCallback:(BeforeSendCallback)beforeSendCallback
                       successCallback:(SuccessCallback)successCallback
                         errorCallback:(ErrorCallback)errorCallback
                      completeCallback:(CompleteCallback)completeCallback {
    if (requestModel.cachePolicy == WJRequestCachePolicyReloadIgnoringLocalCacheData) {
        
    } else if (requestModel.cachePolicy == WJRequestCachePolicyReturnCacheDataElseLoad) {
        
    }
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithDictionary: [requestModel yy_modelToJSONObject]];
    [parameters removeObjectForKey:@"cachePolicy"];
    [parameters removeObjectForKey:@"cacheTimeOutInterval"];
    
    [self sendUploadImagesRequestWithUrl:url
                                    name:name
                                fileName:fileName
                              parameters:parameters.count > 0 ? parameters : nil
                             photoImages:photoImages beforeSendCallback:^{
                                 if (beforeSendCallback) {
                                     beforeSendCallback();
                                 }
                             } successCallback:^(id result) {
                                 if (successCallback) {
                                     WJBaseResponse *response = [responseModel yy_modelWithJSON:result];
                                     successCallback(response);
                                 }
                             } errorCallback:^(NSError *error) {
                                 if (errorCallback) {
                                     errorCallback(error);
                                 }
                             } completeCallback:^(NSError *error, id result) {
                                 if (completeCallback) {
                                     WJBaseResponse *response = [responseModel yy_modelWithJSON:result];
                                     completeCallback(error, response);
                                 }
                             }];
}

@end

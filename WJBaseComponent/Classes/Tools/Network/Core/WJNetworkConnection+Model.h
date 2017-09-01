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
                      completeCallback:(CompleteCallback)completeCallback;

/**
 上传图片
 
 @param url 请求地址
 @param name 服务器对应字段名称
 @param fileName 文件服务器名称
 @param image 要上传的图片
 @param requestModel 请求参数
 @param responseModel 返回参数
 @param beforeSendCallback 开始上传回调
 @param successCallback 完成上传回调
 @param errorCallback 上传失败回调
 @param completeCallback 完成上传回调
 */
- (void)sendUploadImageRequestWithUrl:(NSString *)url
                                 name:(NSString *)name
                             fileName:(NSString *)fileName
                                image:(UIImage *)image
                         requestModel:(WJBaseRequest *)requestModel
                        responseModel:(Class)responseModel
                   beforeSendCallback:(BeforeSendCallback)beforeSendCallback
                      successCallback:(SuccessCallback)successCallback
                        errorCallback:(ErrorCallback)errorCallback
                     completeCallback:(CompleteCallback)completeCallback;

/**
 批量上传文件
 
 @param url 请求地址
 @param requestModel 请求参数
 @param responseModel 返回参数
 @param uploadParams 上传参数
 @param beforeSendCallback 开始上传回调
 @param successCallback 上传完成回调
 @param errorCallback 上传失败回调
 @param completeCallback 上传完成回调
 */
- (void)sendUploadDatasRequestWithUrl:(NSString *)url
                         requestModel:(WJBaseRequest *)requestModel
                        responseModel:(Class)responseModel
                         uploadParams:(NSArray<WJBaseUploadParam *> *)uploadParams
                   beforeSendCallback:(BeforeSendCallback)beforeSendCallback
                      successCallback:(SuccessCallback)successCallback
                        errorCallback:(ErrorCallback)errorCallback
                     completeCallback:(CompleteCallback)completeCallback;

/**
 上传文件
 
 @param url 请求地址
 @param requestModel 请求参数
 @param responseModel 返回参数
 @param uploadParam 上传参数
 @param beforeSendCallback 开始上传回调
 @param successCallback 上传成功回调
 @param errorCallback 上传失败回调
 @param completeCallback 上传完成回调
 */
- (void)sendUploadDataRequestWithUrl:(NSString *)url
                        requestModel:(WJBaseRequest *)requestModel
                       responseModel:(Class)responseModel
                         uploadParam:(WJBaseUploadParam *)uploadParam
                  beforeSendCallback:(BeforeSendCallback)beforeSendCallback
                     successCallback:(SuccessCallback)successCallback
                       errorCallback:(ErrorCallback)errorCallback
                    completeCallback:(CompleteCallback)completeCallback;

@end

//
//  WJNetworkConnection.h
//  Pods
//
//  Created by Lawrence on 2017/8/22.
//
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFHTTPSessionManager.h>
#import <YYModel/YYModel.h>
#import "WJBaseUploadParam.h"

//请求超时时间
#define DYLY_REQUEST_TIMEOUT                 10

/**
 请求结果枚举

 - WJRequestResultSuccess: 请求成功
 - WJRequestResultFail: 请求失败
 */
typedef NS_ENUM(NSUInteger, WJRequestResult) {
    WJRequestResultSuccess,
    WJRequestResultFail,
};

typedef void (^Callback)(NSInteger error, id result);        //回调信息
typedef void (^BeforeSendCallback)(void);                    //开始请求回调
typedef void (^SuccessCallback)(id result);                  //请求成功回调
typedef void (^ErrorCallback)(NSError *error);               //请求失败回调
typedef void (^CompleteCallback)(NSError *error, id result);  //请求完成回调
typedef void (^ProgressCallback)(NSProgress *progress);

@interface WJNetworkConnection : NSObject

/**
 单例

 @return 实例化单例
 */
+ (instancetype)networkManager;

/**
 发送post请求

 @param url 请求地址
 @param parameters 请求参数
 @param beforeSendCallback 开始请求回调
 @param successCallback 请求成功回调
 @param errorCallback 请求失败回调
 @param completeCallback 请求完成回调
 */
- (void)sendPostRequestWithUrl:(NSString *)url parameters:(NSDictionary *)parameters
            beforeSendCallback:(BeforeSendCallback)beforeSendCallback
               successCallback:(SuccessCallback)successCallback
                 errorCallback:(ErrorCallback)errorCallback
              completeCallback:(CompleteCallback)completeCallback;

/**
 发送get请求

 @param url 请求地址
 @param parameters 请求参数
 @param beforeSendCallback 开始请求回调
 @param successCallback 请求成功回调
 @param errorCallback 请求失败回调
 @param completeCallback 请求完成回调
 */
- (void)sendGetRequestWithUrl:(NSString *)url parameters:(NSDictionary *)parameters
           beforeSendCallback:(BeforeSendCallback)beforeSendCallback
              successCallback:(SuccessCallback)successCallback
                errorCallback:(ErrorCallback)errorCallback
             completeCallback:(CompleteCallback)completeCallback;

/**
 上传文件
 
 @param url 请求地址
 @param parameters 请求参数
 @param uploadParams 上传文件参数
 @param beforeSendCallback 开始上传回调
 @param successCallback 上传成功回调
 @param errorCallback 上传失败回调
 @param completeCallback 上传完成回调
 */
- (void)sendUploadRequestWithUrl:(NSString *)url
                      parameters:(NSDictionary *)parameters
                    uploadParams:(NSArray<WJBaseUploadParam *> *)uploadParams
              beforeSendCallback:(BeforeSendCallback)beforeSendCallback
                 successCallback:(SuccessCallback)successCallback
                   errorCallback:(ErrorCallback)errorCallback
                completeCallback:(CompleteCallback)completeCallback;

/**
 上传文件
 
 @param url 请求地址
 @param parameters 请求参数
 @param uploadParams 上传文件参数
 @param progressCallback 上传进度回调
 @param beforeSendCallback 开始上传回调
 @param successCallback 上传成功回调
 @param errorCallback 上传失败回调
 @param completeCallback 上传完成回调
 */
- (void)sendUploadRequestWithUrl:(NSString *)url
                      parameters:(NSDictionary *)parameters
                    uploadParams:(NSArray<WJBaseUploadParam *> *)uploadParams
                progressCallback:(ProgressCallback)progressCallback
              beforeSendCallback:(BeforeSendCallback)beforeSendCallback
                 successCallback:(SuccessCallback)successCallback
                   errorCallback:(ErrorCallback)errorCallback
                completeCallback:(CompleteCallback)completeCallback;

/**
 上传多张图片
 
 @param url 请求地址
 @param paramters 请求参数
 @param photoImages 图片
 @param name 服务器接收的字段名
 @param fileName 文件对应服务器名称
 @param beforeSendCallback 开始上传回调
 @param successCallback 完成上传回调
 @param errorCallback 上传失败回调
 @param completeCallback 上传完成回调
 */
- (void)sendUploadImageRequestWithUrl:(NSString *)url
                           parameters:(NSDictionary *)paramters
                          photoImages:(NSArray *)photoImages
                                 name:(NSString *)name
                             fileName:(NSString *)fileName
                   beforeSendCallback:(BeforeSendCallback)beforeSendCallback
                      successCallback:(SuccessCallback)successCallback
                        errorCallback:(ErrorCallback)errorCallback
                     completeCallback:(CompleteCallback)completeCallback;

@end

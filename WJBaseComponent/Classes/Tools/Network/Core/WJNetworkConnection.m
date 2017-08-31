//
//  WJNetworkConnection.m
//  Pods
//
//  Created by Lawrence on 2017/8/22.
//
//

#import "WJNetworkConnection.h"
#import <SVProgressHUD/SVProgressHUD.h>

@implementation WJNetworkConnection

static id _instance = nil;

+ (instancetype)networkManager {
    return [[self alloc] init];
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    
    return _instance;
}

- (instancetype)init {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super init];
        
        //监听网络状态
        AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager manager];
        [manager startMonitoring];
        [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            switch (status) {
                case AFNetworkReachabilityStatusUnknown: {
                    [SVProgressHUD showErrorWithStatus:@"网络开小差了!"];
                }
                    break;
                case AFNetworkReachabilityStatusNotReachable: {
                    [SVProgressHUD showErrorWithStatus:@"请检查您的网络状态！"];
                }
                    break;
                case AFNetworkReachabilityStatusReachableViaWiFi: {
                    NSLog(@"当前使用的是2G/3G/4G网络");
                }
                    break;
                case AFNetworkReachabilityStatusReachableViaWWAN: {
                    NSLog(@"当前在WIFI网络下");
                }
                    break;
                default:
                    break;
            }
        }];
    });
    
    return _instance;
}

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
              completeCallback:(CompleteCallback)completeCallback {
    
    //配置需要根据项目的需要配置相应的token信息、ca证书等
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setTimeoutInterval:DYLY_REQUEST_TIMEOUT];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/json",@"text/html",@"application/json", nil];
    [manager.requestSerializer setValue:@"ios" forHTTPHeaderField:@"client-info"];
    
    //如果存在token，则设置token(此处是的字段名称是服务器约定好的 所以得根据服务的约定来设置)
    if (parameters.count && [parameters objectForKey:@"accessToken"]) {
        [manager.requestSerializer setValue:[parameters objectForKey:@"accessToken"]  forHTTPHeaderField:@"accessToken"];
    }
    
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
- (void)sendGetRequestWithUrl:(NSString *)url parameters:(NSDictionary *)parameters
           beforeSendCallback:(BeforeSendCallback)beforeSendCallback
              successCallback:(SuccessCallback)successCallback
                errorCallback:(ErrorCallback)errorCallback
             completeCallback:(CompleteCallback)completeCallback {
    //配置需要根据项目的需要配置相应的token信息、ca证书等
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setTimeoutInterval:DYLY_REQUEST_TIMEOUT];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/json",@"text/html",@"application/json", @"text/plain", nil];
    [manager.requestSerializer setValue:@"ios" forHTTPHeaderField:@"client-info"];
    
    //如果存在token，则设置token(此处是的字段名称是服务器约定好的 所以得根据服务的约定来设置)
    if (parameters.count && [parameters objectForKey:@"accessToken"]) {
        [manager.requestSerializer setValue:[parameters objectForKey:@"accessToken"]  forHTTPHeaderField:@"accessToken"];
    }
    
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

/**
 批量上传文件
 
 @param url 请求地址
 @param parameters 请求参数
 @param uploadParams 上传文件参数
 @param progressCallback 上传进度回调
 @param beforeSendCallback 开始上传回调
 @param successCallback 上传成功回调
 @param errorCallback 上传失败回调
 @param completeCallback 上传完成回调
 */
- (void)sendUploadDatasRequestWithUrl:(NSString *)url
                           parameters:(NSDictionary *)parameters
                         uploadParams:(NSArray<WJBaseUploadParam *> *)uploadParams
                     progressCallback:(ProgressCallback)progressCallback
                   beforeSendCallback:(BeforeSendCallback)beforeSendCallback
                      successCallback:(SuccessCallback)successCallback
                        errorCallback:(ErrorCallback)errorCallback
                     completeCallback:(CompleteCallback)completeCallback {
    //配置需要根据项目的需要配置相应的token信息、ca证书等
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setTimeoutInterval:DYLY_REQUEST_TIMEOUT];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/json",@"text/html",@"application/json", @"text/plain", nil];
    [manager.requestSerializer setValue:@"ios" forHTTPHeaderField:@"client-info"];
    
    //如果存在token，则设置token(此处是的字段名称是服务器约定好的 所以得根据服务的约定来设置)
    if (parameters.count && [parameters objectForKey:@"accessToken"]) {
        [manager.requestSerializer setValue:[parameters objectForKey:@"accessToken"]  forHTTPHeaderField:@"accessToken"];
    }
    
    //这个回调的可以添加loading等相关提示
    if (beforeSendCallback) {
        beforeSendCallback();
    }
    
    [manager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        for (WJBaseUploadParam *uploadParam in uploadParams) {
            [formData appendPartWithFileData:uploadParam.data name:uploadParam.name fileName:uploadParam.fileName mimeType:uploadParam.mimeTypeName];
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        if (progressCallback) {
            progressCallback(uploadProgress);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
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
 上传文件
 
 @param url 请求地址
 @param parameters 请求参数
 @param uploadParam 上传文件参数
 @param progressCallback 上传进度回调
 @param beforeSendCallback 开始上传回调
 @param successCallback 上传成功回调
 @param errorCallback 上传失败回调
 @param completeCallback 上传完成回调
 */
- (void)sendUploadDataRequestWithUrl:(NSString *)url
                          parameters:(NSDictionary *)parameters
                         uploadParam:(WJBaseUploadParam *)uploadParam
                    progressCallback:(ProgressCallback)progressCallback
                  beforeSendCallback:(BeforeSendCallback)beforeSendCallback
                     successCallback:(SuccessCallback)successCallback
                       errorCallback:(ErrorCallback)errorCallback
                    completeCallback:(CompleteCallback)completeCallback {
    //配置需要根据项目的需要配置相应的token信息、ca证书等
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setTimeoutInterval:DYLY_REQUEST_TIMEOUT];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/json",@"text/html",@"application/json", @"text/plain", nil];
    [manager.requestSerializer setValue:@"ios" forHTTPHeaderField:@"client-info"];
    
    //如果存在token，则设置token(此处是的字段名称是服务器约定好的 所以得根据服务的约定来设置)
    if (parameters.count && [parameters objectForKey:@"accessToken"]) {
        [manager.requestSerializer setValue:[parameters objectForKey:@"accessToken"]  forHTTPHeaderField:@"accessToken"];
    }
    
    //这个回调的可以添加loading等相关提示
    if (beforeSendCallback) {
        beforeSendCallback();
    }
    
    [manager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:uploadParam.data name:uploadParam.name fileName:uploadParam.fileName mimeType:uploadParam.mimeTypeName];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        if (progressCallback) {
            progressCallback(uploadProgress);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
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
 批量上传图片
 
 @param url 请求地址
 @param name 服务器对应的字段的名称
 @param fileName 图片的服务器名称
 @param parameters 请求参数
 @param photoImages 上传的图片
 @param beforeSendCallback 开始上传回调
 @param successCallback 完成上传回调
 @param errorCallback 上传失败回调
 @param completeCallback 上传完成回调
 */
- (void)sendUploadImagesRequestWithUrl:(NSString *)url
                                  name:(NSString *)name
                              fileName:(NSString *)fileName
                            parameters:(NSDictionary *)parameters
                           photoImages:(NSArray *)photoImages
                    beforeSendCallback:(BeforeSendCallback)beforeSendCallback
                       successCallback:(SuccessCallback)successCallback
                         errorCallback:(ErrorCallback)errorCallback
                      completeCallback:(CompleteCallback)completeCallback {
    //配置需要根据项目的需要配置相应的token信息、ca证书等
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setTimeoutInterval:DYLY_REQUEST_TIMEOUT];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/json",@"text/html",@"application/json", @"text/plain", nil];
    [manager.requestSerializer setValue:@"ios" forHTTPHeaderField:@"client-info"];
    
    //如果存在token，则设置token(此处是的字段名称是服务器约定好的 所以得根据服务的约定来设置)
    if (parameters.count && [parameters objectForKey:@"accessToken"]) {
        [manager.requestSerializer setValue:[parameters objectForKey:@"accessToken"]  forHTTPHeaderField:@"accessToken"];
    }
    
    //这个回调的可以添加loading等相关提示
    if (beforeSendCallback) {
        beforeSendCallback();
    }
    
    [manager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        for (int i = 0; i < photoImages.count; i++) {
            UIImage *image = [photoImages objectAtIndex:i];
            //图片的命名规则为（fileName+ i）
            NSString *imageName = [NSString stringWithFormat:@"%@%d.png", fileName, i];
            //此处图片应该需要做压缩(这个跟服务器的约定有关，可能需要改)
            NSData *imageData = UIImageJPEGRepresentation(image, 1.0f);
            //获取图片压缩率
            double scaleNum = (double)300*1024/imageData.length;
            //压缩图片
            if (scaleNum < 1) {
                imageData = UIImageJPEGRepresentation(image, scaleNum);
            } else {
                imageData = UIImageJPEGRepresentation(image, 0.1);
            }
            
            [formData appendPartWithFileData:imageData name:name fileName:imageName mimeType:@"image/jpg/png/jpeg"];
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
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
 上传图片
 
 @param url 请求地址
 @param name 服务器对应的字段名称
 @param fileName 图片的服务器名称
 @param image 图片
 @param paramters 请求参数
 @param beforeSendCallback 开始上传回调
 @param successCallback 完成上传回调
 @param errorCallback 上传失败回调
 @param completeCallback 上传完成回调
 */
- (void)sendUploadImageRequestWithUrl:(NSString *)url
                                 name:(NSString *)name
                             fileName:(NSString *)fileName
                                image:(UIImage *)image
                           parameters:(NSDictionary *)paramters
                   beforeSendCallback:(BeforeSendCallback)beforeSendCallback
                      successCallback:(SuccessCallback)successCallback
                        errorCallback:(ErrorCallback)errorCallback
                     completeCallback:(CompleteCallback)completeCallback {
    //配置需要根据项目的需要配置相应的token信息、ca证书等
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setTimeoutInterval:DYLY_REQUEST_TIMEOUT];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/json",@"text/html",@"application/json", @"text/plain", nil];
    [manager.requestSerializer setValue:@"ios" forHTTPHeaderField:@"client-info"];
    
    //如果存在token，则设置token(此处是的字段名称是服务器约定好的 所以得根据服务的约定来设置)
    if (paramters.count && [paramters objectForKey:@"accessToken"]) {
        [manager.requestSerializer setValue:[paramters objectForKey:@"accessToken"]  forHTTPHeaderField:@"accessToken"];
    }
    
    //这个回调的可以添加loading等相关提示
    if (beforeSendCallback) {
        beforeSendCallback();
    }
    
    [manager POST:url parameters:paramters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        //此处图片应该需要做压缩(这个跟服务器的约定有关，可能需要改)
        NSData *imageData = UIImageJPEGRepresentation(image, 1.0f);
        //获取图片压缩率
        double scaleNum = (double)300*1024/imageData.length;
        //压缩图片
        if (scaleNum < 1) {
            imageData = UIImageJPEGRepresentation(image, scaleNum);
        } else {
            imageData = UIImageJPEGRepresentation(image, 0.1);
        }
        
        [formData appendPartWithFileData:imageData name:name fileName:fileName mimeType:@"image/jpg/png/jpeg"];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
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

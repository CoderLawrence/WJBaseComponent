//
//  WJBaseUploadParam.h
//  Pods
//
//  Created by Lawrence on 2017/8/24.
//
//

#import <Foundation/Foundation.h>

/**
 上传文件类型枚举
 */
typedef NS_ENUM(NSUInteger, WJUploadMimeType) {
    WJUploadMimeTypePng,
    WJUploadMimeTypeJpg,
    WJUploadMimeTypeWav,
    WJUploadMimeTypeMp3,
    WJUploadMimeTypeM4a,
};

@interface WJBaseUploadParam : NSObject

/**
 二进制数据
 */
@property (nonatomic, strong) NSData *data;

/**
 服务器对应的参数名
 */
@property (nonatomic, copy) NSString *name;

/**
 文件名称（上传到服务器后，服务器的文件名称）
 */
@property (nonatomic, copy) NSString *fileName;

/**
 文件的MIME类型
 */
@property (nonatomic, assign) WJUploadMimeType mimeType;

/**
 *  文件的MIME类型(image/png,image/jpg等)
 */
@property (nonatomic, copy) NSString *mimeTypeName;

/**
 实例化

 @param data 二进制数据
 @param name 服务器对应参数名
 @param fileName 文件名称
 @param mimeType 文件的MIME类型
 @return 实例化的上传文件名model
 */
- (instancetype)initWithData:(NSData *)data name:(NSString *)name fileName:(NSString *)fileName mimeType:(WJUploadMimeType)mimeType;

@end

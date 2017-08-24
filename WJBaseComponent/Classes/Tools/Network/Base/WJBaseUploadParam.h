//
//  WJBaseUploadParam.h
//  Pods
//
//  Created by Lawrence on 2017/8/24.
//
//

#import <Foundation/Foundation.h>

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
 *  文件的MIME类型(image/png,image/jpg等)
 */
@property (nonatomic, copy) NSString *mimeType;

@end

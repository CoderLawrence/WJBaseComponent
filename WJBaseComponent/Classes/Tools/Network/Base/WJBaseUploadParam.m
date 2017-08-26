//
//  WJBaseUploadParam.m
//  Pods
//
//  Created by Lawrence on 2017/8/24.
//
//

#import "WJBaseUploadParam.h"

@implementation WJBaseUploadParam

- (instancetype)initWithData:(NSData *)data name:(NSString *)name fileName:(NSString *)fileName mimeType:(WJUploadMimeType)mimeType {
    if (self = [super init]) {
        _data = data;
        _name = name;
        _fileName = fileName;
        _mimeType = mimeType;
    }
    
    return self;
}

- (void)setMimeType:(WJUploadMimeType)mimeType {
    _mimeType = mimeType;
    
    if (_mimeType == WJUploadMimeTypeJpg) {
        _mimeTypeName = @"image/png";
    } else if (_mimeType == WJUploadMimeTypeJpg) {
        _mimeTypeName = @"image/jpg";
    } else if (_mimeType == WJUploadMimeTypeMp3) {
        _mimeTypeName = @"audio/mp3";
    } else if (_mimeType == WJUploadMimeTypeWav) {
        _mimeTypeName = @"audio/wav";
    } else if (_mimeType == WJUploadMimeTypeM4a) {
        _mimeTypeName = @"audio/m4a";
    }
}

@end

//
//  WJURLSessionDownloadManager.h
//  Pods
//  基于AFNetworking 封装的下载工具
//  Created by Lawrence on 2017/8/29.
//
//

#import <AFNetworking/AFNetworking.h>

@interface WJURLSessionDownloadManager : AFURLSessionManager

/**
 文件的目标路径或者目录
 
 A String value that defines the target path or directory.
 
 We try to be clever here and understand both a directory or a filename.
 The target directory should already be create, or the download fill fail.
 
 If the target is a directory, we use the last part of the URL as a default file name.
 targetPath is the responseObject if operation succeeds
 */
@property (nonatomic, strong) NSString *targetPath;

/**
 是否允许下载的文件覆盖之前下载的同名文件 默认为NO
 
 A Boolean value that indicates if we should allow a downloaded file to overwrite
 a previously downloaded file of the same name. Default is `NO`.
 */
@property (nonatomic, assign) BOOL shouldOverwrite;

/**
 是否允许断点下载 （默认为YES, 需要在创建的时候设置）
 
 A Boolean value that indicates if we should try to resume the download. Defaults is `YES`.
 
 Can only be set while creating the request.
 */
@property (nonatomic, assign, readonly) BOOL shouldResume;

/**
 如果操作被取消，删除临时文件 默认为NO
 
 Deletes the temporary file if operations is cancelled. Defaults to `NO`.
 */
@property (nonatomic, getter=isDeletingTempFileOnCancel) BOOL deleteTempFileOnCancel;

/**
 
 预期的总长度。如果文件被恢复，这与预期的contentlength不同。
 
 注意:如果文件大小没有发送(*)，这也可以是零
 
 Expected total length. This is different than expectedContentLength if the file is resumed.
 
 Note: this can also be zero if the file size is not sent (*)
 */
@property (nonatomic, assign, readonly) long long totalContentLength;

/**
 用于部分下载的文件偏移量指示器。如果文件下载恢复，这个值将大于零
 
 Indicator for the file offset on partial downloads. This is greater than zero if the file download is resumed.
 */
@property (nonatomic, assign, readonly) long long offsetContentLength;

/**
 逐步下载的回调调度队列。如果“NULL”(默认)，则使用主队列。
 
 The callback dispatch queue on progressive download. If `NULL` (default), the main queue is used.
 */
@property (nonatomic, assign) dispatch_queue_t progressiveDownloadCallbackQueue;


/**
 实例化
 
 Creates and returns an `AFURLSessionManager`
 
 @param urlRequest urlRequest description
 @param targetPath targetPath description
 @param shouldResume shouldResume description
 @return return value description
 */
- (instancetype)initWithRequest:(NSURLRequest *)urlRequest targetPath:(NSString *)targetPath shouldResume:(BOOL)shouldResume;

/**
 实例化
 
 Creates and returns an `AFURLSessionManager`

 @param urlRequest urlRequest description
 @param fileIdentifier The target path (with or without file name)（子文件夹）
 @param targetPath targetPath description
 @param shouldResume shouldResume description
 @return return value description
 */
- (instancetype)initWithRequest:(NSURLRequest *)urlRequest fileIdentifier:(NSString *)fileIdentifier targetPath:(NSString *)targetPath shouldResume:(BOOL)shouldResume;

/**
 移除临时文件
 
 Deletes the temporary file.
 
 Returns `NO` if an error happened, `YES` if the file is removed or did not exist in the first place.
 */
- (BOOL)deleteTempFileWithError:(NSError *)error;

/**
 临时文件目录
 
 Returns the path used for the temporary file. Returns `nil` if the targetPath has not been set.
 */
- (NSString *)tempPath;

/**
 Sets a callback to be called when an undetermined number of bytes have been downloaded from the server. This is a variant of setDownloadProgressBlock that adds support for progressive downloads and adds the
 
 @param block A block object to be called when an undetermined number of bytes have been downloaded from the server. This block has no return value and takes five arguments: the number of bytes read since the last time the download progress block was called, the bytes expected to be read during the request, the bytes already read during this request, the total bytes read (including from previous partial downloads), and the total bytes expected to be read for the file. This block may be called multiple times.
 
 @see setDownloadProgressBlock
 */
- (void)setProgressiveDownloadProgressBlock:(void (^)(WJURLSessionDownloadManager *operation, NSInteger bytesRead, long long totalBytesRead, long long totalBytesExpected, long long totalBytesReadForFile, long long totalBytesExpectedToReadForFile))block;

@end

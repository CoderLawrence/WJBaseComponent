//
//  WJClassInfosResponse.h
//  WJBaseComponent
//
//  Created by Lawrence on 2017/8/25.
//  Copyright © 2017年 CoderLawrence. All rights reserved.
//

#import <WJBaseComponent/WJBaseComponent.h>

@interface WJClassModel : NSObject

@property (nonatomic, strong) NSNumber *id;
@property (nonatomic, strong) NSString *typeCode;
@property (nonatomic, strong) NSString *typeName;

@end

@interface WJClassInfosResponse : WJBaseResponse

@property (nonatomic, strong) NSArray<WJClassModel *> *result;

@end

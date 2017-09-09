//
// Created by Lawrence on 2017/8/19.
//

#import "NSObject+ReplaceNullProperty.h"
#import <objc/runtime.h>


@implementation NSObject (ReplaceNullProperty)

- (void)replaceNullProperty {

    unsigned int count;
    //获取成员变量列表
    Ivar *vars = class_copyIvarList(self.class, &count);

    //遍历成员变量列表
    for (int i = 0; i < count; ++i) {
        Ivar var = vars[i];

        NSString *type = [NSString stringWithUTF8String:ivar_getTypeEncoding(var)]; //获取成员变量的数据类型
        NSString *property = [NSString stringWithUTF8String:ivar_getName(var)];     //获取成员变量的属性名称

        //判断属性是否有值
        if ([[self valueForKey:property] isEqual:[NSNull null]]) {
            if ([type isEqualToString:@"i"]) {
                [self setValue:0 forKey:property];
            } else if ([type isEqualToString:@"c"]) {
                [self setValue:@NO forKey:property];
            } else if ([type isEqualToString:@"@\"NSString\""]) {
                [self setValue:@"" forKey:property];
            } else if ([type isEqualToString:@"@\"NSNumber\""]) {
                [self setValue:@0 forKey:property];
            } else if ([type isEqualToString:@"@\"NSArray\""]) {
                [self setValue:@[] forKey:property];
            } else if ([type isEqualToString:@"@\"NSDictionary\""]) {
                [self setValue:@{} forKey:property];
            }
        }
    }

    //释放
    free(vars);
}

@end
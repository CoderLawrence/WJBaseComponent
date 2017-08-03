//
//  NSObject+Dictionary.m
//  TodayNews
//
//  Created by Lawrence on 2017/6/18.
//  Copyright © 2017年 Lawrence. All rights reserved.
//

#import "NSObject+Dictionary.h"
#import <objc/runtime.h>
#import <CoreData/CoreData.h>

static NSSet *classes;

@implementation NSObject (Dictionary)

- (NSMutableDictionary *)getParameterDictionary {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    Class c = self.class;
    
    while (c) {
        unsigned count;
        objc_property_t *properties = class_copyPropertyList([c class], &count);
        for (int i = 0; i < count; i++) {
            NSString *key = [NSString stringWithUTF8String:property_getName(properties[i])];
            dict[key] = [self valueForKey:key];
        }
        free(properties);
        
        //获得父类
        c = class_getSuperclass(c);
        
        if ([self isClassFromFoundation:c]) {
            break;
        }
    }
    return dict;
}

- (BOOL)isClassFromFoundation:(Class)c {
    if (c == [NSObject class] || c == [NSManagedObject class]) {
        return YES;
    }
    
    __block BOOL result = NO;
    [[self foundationClasses] enumerateObjectsUsingBlock:^(Class foundationClass, BOOL * _Nonnull stop) {
        if ([c isSubclassOfClass:foundationClass]) {
            result = YES;
            *stop = YES;
        }
    }];
    
    return result;
}

- (NSSet *)foundationClasses {
    if (classes == nil) {
        //集合有没有 NSObject,因为几乎所有的类都是继承自NSObject,具体是不是NSObject 需要特殊判断
        classes = [NSSet setWithObjects:
                                 [NSURL class],
                                 [NSData class],
                                 [NSValue class],
                                 [NSDate class],
                                 [NSError class],
                                 [NSArray class],
                                 [NSDictionary class],
                                 [NSString class],
                                 [NSMutableString class], nil];
    }
    
    return classes;
}

@end

//
//  UIViewController+RunDealloc.m
//  TodayNews
//
//  Created by Lawrence on 2017/6/18.
//  Copyright © 2017年 Lawrence. All rights reserved.
//

#import "UIViewController+RunDealloc.h"
#import <objc/runtime.h>

@implementation UIViewController (RunDealloc)

+ (void)load {
    [super load];
    
    Class aClass = [self class];
    SEL originalSelector = NSSelectorFromString(@"dealloc");
    SEL swizzledSelector = @selector(swizzledDealloc);
    Method originialMethod = class_getInstanceMethod(aClass, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(aClass, swizzledSelector);
    BOOL didAddMethod = class_addMethod(aClass, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(aClass, swizzledSelector, method_getImplementation(originialMethod), method_getTypeEncoding(originialMethod));
    } else {
        method_exchangeImplementations(originialMethod, swizzledMethod);
    }
}

- (void)swizzledDealloc {
    
    NSLog(@"==%@ dealloc ==", self.class);
    [self swizzledDealloc];
}

@end

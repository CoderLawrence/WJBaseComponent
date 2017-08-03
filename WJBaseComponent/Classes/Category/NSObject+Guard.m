//
//  NSObject+Guard.m
//  TodayNews
//
//  Created by Lawrence on 2017/7/14.
//  Copyright © 2017年 Lawrence. All rights reserved.
//

#import "NSObject+Guard.h"
#import <objc/runtime.h>

@interface Parasite : NSObject

@property (nonatomic, copy) void (^deallocBlock)(void);

@end

@implementation Parasite

- (void)dealloc {
    if (self.deallocBlock) {
        self.deallocBlock();
    }
}

@end

@implementation NSObject (Guard)

- (void)guard_addDeallocBlock:(void (^)(void))block {
    @synchronized (self) {
        static NSString *kAssociatedKey = nil;
        NSMutableArray *parasiteList = objc_getAssociatedObject(self, &kAssociatedKey);
        if (!parasiteList) {
            parasiteList = [NSMutableArray arrayWithCapacity:0];
            objc_setAssociatedObject(self, &kAssociatedKey, parasiteList, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            
            Parasite *parasite = [[Parasite alloc] init];
            parasite.deallocBlock = block;
            [parasiteList addObject:parasite];
        }
    }
}

@end

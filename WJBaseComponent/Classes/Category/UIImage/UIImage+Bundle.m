//
//  UIImage+Bundle.m
//  WJBaseComponent
//
//  Created by Lawrence on 2017/10/15.
//

#import "UIImage+Bundle.h"

@implementation UIImage (Bundle)

+ (UIImage *)imageWithName:(NSString *)name inBundleName:(NSString *)bundleName bundleForClass:(Class)bundleClass {
    
    if (name == nil || bundleName == nil || [bundleClass isEqual:[NSNull class]]) {
        return nil;
    }
    
    @try {
        NSBundle *bundle = [NSBundle bundleForClass:bundleClass];
        NSURL *bundleUrl = [bundle URLForResource:bundleName withExtension:@"bundle"];
        NSBundle *resourceBundle = [NSBundle bundleWithURL:bundleUrl];
        
        return [self imageNamed:name inBundle:resourceBundle compatibleWithTraitCollection:nil];
    } @catch (NSException *exception) {
        NSLog(@"%@", exception.reason);
    }
}

@end

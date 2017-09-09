//
//  NSData+Extensions.m
//  TodayNews
//
//  Created by Lawrence on 2017/6/18.
//  Copyright © 2017年 Lawrence. All rights reserved.
//

#import "NSData+Extensions.h"

@implementation NSData (Extensions)

+ (NSString *)contentTypeForImageData:(NSData *)data
{
    uint8_t c;
    [data getBytes:&c length:1];
    switch (c) {
        case 0xFF: {
            return @"jpeg";
            break;
        }
        case 0x89: {
            return @"png";
            break;
        }
        case 0x47: {
            return @"gif";
            break;
        }
        case 0x49:
        case 0x4D: {
            return @"tiff";
            break;
        }
        case 0x52: {
            if ([data length] < 12) {
                return nil;
            }
            
            NSString *testString = [[NSString alloc] initWithData:[data subdataWithRange:NSMakeRange(0, 12)] encoding:NSASCIIStringEncoding];
            if ([testString hasPrefix:@"RIFF"] && [testString hasSuffix:@"WEBP"]) {
                return @"webp";
            }
            
            return nil;
            break;
        }
            
        default: {
            return nil;
            break;
        }
    }
    
    return nil;
}

@end

//
//  NSString+SafeKit.m
//  SafeKitExample
//
//  Created by zhangyu on 14-3-15.
//  Copyright (c) 2014年 zhangyu. All rights reserved.
//

#import "NSString+SafeKit.h"
#import "NSObject+swizzle.h"

@implementation NSString (SafeKit)

- (unichar)safe_characterAtIndex:(NSUInteger)index {
    if (index >= [self length]) {
        return 0;
    }
    return [self safe_characterAtIndex:index];
}

- (NSString *)safe_substringWithRange:(NSRange)range {
    if (range.location + range.length > self.length) {
        return @"";
    }
    return [self safe_substringWithRange:range];
}

+ (void) load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self safe_swizzleMethod:@selector(safe_characterAtIndex:) tarClass:@"__NSCFString" tarSel:@selector(characterAtIndex:)];
        [self safe_swizzleMethod:@selector(safe_substringWithRange:) tarClass:@"__NSCFString" tarSel:@selector(substringWithRange:)];
    });
}

@end

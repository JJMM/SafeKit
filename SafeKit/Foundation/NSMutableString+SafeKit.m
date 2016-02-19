//
//  NSMutableString+SafeKit.m
//  SafeKitExample
//
//  Created by zhangyu on 14-3-15.
//  Copyright (c) 2014年 zhangyu. All rights reserved.
//

#import "NSMutableString+SafeKit.h"
#import "NSObject+swizzle.h"
#import "SafeKitMacro.h"

@implementation NSMutableString (SafeKit)

- (void)safe_appendString:(NSString *)aString {
    if (!aString) {
        return;
    }
    [self safe_appendString:aString];
}

- (void)safe_appendFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2) {
    if (!format) {
        return;
    }
    va_list arguments;
    va_start(arguments, format);
    NSString *formatStr = [[NSString alloc]initWithFormat:format arguments:arguments];
    formatStr = SK_AUTORELEASE(formatStr);
    [self safe_appendFormat:@"%@",formatStr];
    va_end(arguments);
}

- (void)safe_setString:(NSString *)aString {
    if (!aString) {
        return;
    }
    [self safe_setString:aString];
}

- (void)safe_insertString:(NSString *)aString atIndex:(NSUInteger)index {
    if (index > [self length]) {
        return;
    }
    if (!aString) {
        return;
    }
    
    [self safe_insertString:aString atIndex:index];
}

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self safe_swizzleMethod:@selector(safe_appendString:) tarClass:@"__NSCFConstantString" tarSel:@selector(appendString:)];
        [self safe_swizzleMethod:@selector(safe_appendFormat:) tarClass:@"__NSCFConstantString" tarSel:@selector(appendFormat:)];
        [self safe_swizzleMethod:@selector(safe_setString:) tarClass:@"__NSCFConstantString" tarSel:@selector(setString:)];
        [self safe_swizzleMethod:@selector(safe_insertString:atIndex:) tarClass:@"__NSCFConstantString" tarSel:@selector(insertString:atIndex:)];
    });
}

@end

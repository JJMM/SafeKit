//
//  NSMutableString+SafeKit.m
//  DurexKitExample
//
//  Created by zhangyu on 14-3-15.
//  Copyright (c) 2014年 zhangyu. All rights reserved.
//

#import "NSMutableString+SafeKit.h"
#import "NSObject+swizzle.h"
#import "SafeKitLog.h"

@implementation NSMutableString(SafeKit)

//- (void)deleteCharactersInRange:(NSRange)range{}
//- (void)appendFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2);

- (void)SKappendString:(NSString *)aString{
    if (!aString) {
        [[SafeKitLog shareInstance]log:@"string is nil"];
        return;
    }
    [self SKappendString:aString];
}
//- (void)SKappendFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2){
//    if (!format) {
//        return;
//    }
//    va_list arguments = NULL;
//    [self appendFormat:format,arguments];
//}
- (void)SKsetString:(NSString *)aString{
    if (!aString) {
        [[SafeKitLog shareInstance]log:@"string is nil"];
        return;
    }
    [self SKsetString:aString];
}

- (void)SKinsertString:(NSString *)aString atIndex:(NSUInteger)index{
    if (index > [self length]) {
        [[SafeKitLog shareInstance]log:@"index[%ld] > length[%ld]",(long)index ,(long)[self length]];
        return;
    }
    
    if (!aString) {
        [[SafeKitLog shareInstance]log:@"string is nil"];
        return;
    }
    [self SKinsertString:aString atIndex:index];
}

+ (void) load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleMethod:@selector(SKappendString:) tarClass:@"__NSCFConstantString" tarSel:@selector(appendString:)];
        [self swizzleMethod:@selector(SKsetString:) tarClass:@"__NSCFConstantString" tarSel:@selector(setString:)];
        [self swizzleMethod:@selector(SKinsertString:atIndex:) tarClass:@"__NSCFConstantString" tarSel:@selector(insertString:atIndex:)];
    
    });
    
    
}
@end

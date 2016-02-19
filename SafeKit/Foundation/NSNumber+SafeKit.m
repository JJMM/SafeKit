//
//  NSNumber+SafeKit.m
//  JMBFramework
//
//  Created by zhangyu on 14-6-12.
//  Copyright (c) 2014年 jion-cheer. All rights reserved.
//

#import "NSNumber+SafeKit.h"
#import "NSObject+swizzle.h"

@implementation NSNumber (SafeKit)

- (BOOL)safe_isEqualToNumber:(NSNumber *)number {
    if (!number) {
        return NO;
    }
    return [self safe_isEqualToNumber:number];
}

- (NSComparisonResult)safe_compare:(NSNumber *)number {
    if (!number) {
        return NSOrderedAscending;
    }
    return [self safe_compare:number];
}

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self safe_swizzleMethod:@selector(safe_isEqualToNumber:) tarClass:@"__NSCFNumber" tarSel:@selector(isEqualToNumber:)];
        [self safe_swizzleMethod:@selector(safe_compare:) tarClass:@"__NSCFNumber" tarSel:@selector(compare:)];
    });
}

@end

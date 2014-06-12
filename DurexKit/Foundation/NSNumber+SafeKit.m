//
//  NSNumber+SafeKit.m
//  JMBFramework
//
//  Created by zhangyu on 14-6-12.
//  Copyright (c) 2014年 jion-cheer. All rights reserved.
//

#import "NSNumber+SafeKit.h"
#import "NSObject+swizzle.h"
#import "SafeKitLog.h"
#import "NSException+SafeKit.h"

@implementation NSNumber(SafeKit)
- (BOOL)SKisEqualToNumber:(NSNumber *)number{
    if (!number) {
        [[SafeKitLog shareInstance]logWarning:@"number is nil"];
        return NO;
    }
    return [self SKisEqualToNumber:number];
}

+ (void) load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleMethod:@selector(SKisEqualToNumber:) tarClass:@"__NSCFNumber" tarSel:@selector(isEqualToNumber:)];
    });
}
@end

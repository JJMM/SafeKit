//
//  NSArray+SafeKit.m
//  SafeKitExample
//
//  Created by zhangyu on 14-2-28.
//  Copyright (c) 2014年 zhangyu. All rights reserved.
//

#import "NSArray+SafeKit.h"
#import "NSObject+swizzle.h"
#import "SafeKitLog.h"
#import "NSException+SafeKit.h"

@implementation NSArray(SafeKit)
-(id)SKobjectAtIndex:(NSUInteger)index{
    if (index >= [self count]) {
        [[SafeKitLog shareInstance]logWarning:[NSString stringWithFormat:@"index[%ld] >= count[%ld]",(long)index ,(long)[self count]]];
        return nil;
    }
    return [self SKobjectAtIndex:index];
}

+ (void) load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleMethod:@selector(SKobjectAtIndex:) tarClass:@"__NSArrayI" tarSel:@selector(objectAtIndex:)];
    });
}
@end

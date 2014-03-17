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
    SK_TRY_BODY(return [self SKobjectAtIndex:index];)
    return nil;
}
- (NSArray *)SKarrayByAddingObject:(id)anObject{
    SK_TRY_BODY(return [self SKarrayByAddingObject:anObject];)
    return nil;
}
+ (void) load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleMethod:@selector(SKobjectAtIndex:) tarClass:@"__NSArrayI" tarSel:@selector(objectAtIndex:)];
        [self swizzleMethod:@selector(SKarrayByAddingObject:) tarClass:@"__NSArrayI" tarSel:@selector(arrayByAddingObject:)];
    });

}
@end

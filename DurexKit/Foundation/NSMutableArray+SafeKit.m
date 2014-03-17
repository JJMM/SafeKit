//
//  NSMutableArray+SafeKit.m
//  DurexKitExample
//
//  Created by zhangyu on 14-3-13.
//  Copyright (c) 2014年 zhangyu. All rights reserved.
//

#import "NSMutableArray+SafeKit.h"
#import "NSObject+swizzle.h"
#import "SafeKitLog.h"
#import "NSException+SafeKit.h"
@implementation NSMutableArray(SafeKit)
-(id)SKobjectAtIndex:(NSUInteger)index{
    SK_TRY_BODY(return [self SKobjectAtIndex:index];)
    return nil;
}
- (NSArray *)SKarrayByAddingObject:(id)anObject{
    SK_TRY_BODY(return [self SKarrayByAddingObject:anObject];)
    return nil;
}

-(void)SKaddObject:(id)anObject{
    SK_TRY_BODY([self SKaddObject:anObject];)
}
- (void)SKinsertObject:(id)anObject atIndex:(NSUInteger)index{
    SK_TRY_BODY([self SKinsertObject:anObject atIndex:index];)
}

- (void)SKremoveObjectAtIndex:(NSUInteger)index{
    if (index >= [self count]) {
        [[SafeKitLog shareInstance]log:@"index[%ld] >= count[%ld]",(long)index ,(long)[self count]];
        return;
    }
    
    SK_TRY_BODY([self SKremoveObjectAtIndex:index];)
}
- (void)SKreplaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject{
    SK_TRY_BODY([self SKreplaceObjectAtIndex:index withObject:anObject];)
}

+ (void) load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleMethod:@selector(SKobjectAtIndex:) tarClass:@"__NSArrayM" tarSel:@selector(objectAtIndex:)];
        [self swizzleMethod:@selector(SKarrayByAddingObject:) tarClass:@"__NSArrayM" tarSel:@selector(arrayByAddingObject:)];
        
        [self swizzleMethod:@selector(SKaddObject:) tarClass:@"__NSArrayM" tarSel:@selector(addObject:)];
        [self swizzleMethod:@selector(SKinsertObject:atIndex:) tarClass:@"__NSArrayM" tarSel:@selector(insertObject:atIndex:)];
        [self swizzleMethod:@selector(SKremoveObjectAtIndex:) tarClass:@"__NSArrayM" tarSel:@selector(removeObjectAtIndex:)];
        [self swizzleMethod:@selector(SKreplaceObjectAtIndex:withObject:) tarClass:@"__NSArrayM" tarSel:@selector(replaceObjectAtIndex:withObject:)];
    });
}
@end

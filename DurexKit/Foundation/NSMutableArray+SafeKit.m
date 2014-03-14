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
@implementation NSMutableArray(SafeKit)
-(id)SKobjectAtIndex:(NSUInteger)index{
    if (index >= [self count]) {
        [[SafeKitLog shareInstance]log:@"index[%ld] >= count[%ld]",(long)index ,(long)[self count]];
        return nil;
    }
    return [self SKobjectAtIndex:index];
}
- (NSArray *)SKarrayByAddingObject:(id)anObject{
    if (anObject) {
        return nil;
    }
    return [self SKarrayByAddingObject:anObject];
}

-(void)SKaddObject:(id)anObject{
    if (!anObject) {
        return;
    }
    [self SKaddObject:anObject];
}
- (void)SKinsertObject:(id)anObject atIndex:(NSUInteger)index{
    if (index > [self count]) {
        [[SafeKitLog shareInstance]log:@"index[%ld] > count[%ld]",(long)index ,(long)[self count]];
        return;
    }
    if (!anObject) {
        [[SafeKitLog shareInstance]log:@"object is nil"];
        return;
    }
    [self SKinsertObject:anObject atIndex:index];
}

- (void)SKremoveObjectAtIndex:(NSUInteger)index{
    if (index >= [self count]) {
        [[SafeKitLog shareInstance]log:@"index[%ld] >= count[%ld]",(long)index ,(long)[self count]];
        return;
    }
    return [self SKremoveObjectAtIndex:index];
}
- (void)SKreplaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject{
    if (index >= [self count]) {
        [[SafeKitLog shareInstance]log:@"index[%ld] >= count[%ld]",(long)index ,(long)[self count]];
        return;
    }
    if (!anObject) {
        [[SafeKitLog shareInstance]log:@"object is nil"];
        return;
    }
    [self SKreplaceObjectAtIndex:index withObject:anObject];
}

+ (void) load{
    [self swizzleMethod:@selector(SKobjectAtIndex:) targetClass:@"__NSArrayM" target:@selector(objectAtIndex:)];
    [self swizzleMethod:@selector(SKarrayByAddingObject:) targetClass:@"__NSArrayM" target:@selector(arrayByAddingObject:)];
    
    [self swizzleMethod:@selector(SKaddObject:) targetClass:@"__NSArrayM" target:@selector(addObject:)];
    [self swizzleMethod:@selector(SKinsertObject:atIndex:) targetClass:@"__NSArrayM" target:@selector(insertObject:atIndex:)];
    [self swizzleMethod:@selector(SKremoveObjectAtIndex:) targetClass:@"__NSArrayM" target:@selector(removeObjectAtIndex:)];
    [self swizzleMethod:@selector(SKreplaceObjectAtIndex:withObject:) targetClass:@"__NSArrayM" target:@selector(replaceObjectAtIndex:withObject:)];
}
@end

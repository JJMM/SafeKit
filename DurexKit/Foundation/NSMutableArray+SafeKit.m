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
    if (index >= [self count]) {
        [[SafeKitLog shareInstance]logWarning:[NSString stringWithFormat:@"index[%ld] >= count[%ld]",(long)index ,(long)[self count]]];
        return nil;
    }
    return [self SKobjectAtIndex:index];
}
//- (NSArray *)SKarrayByAddingObject:(id)anObject{
//    if (!anObject) {
//        [[SafeKitLog shareInstance]logWarning:[NSString stringWithFormat:@"object is nil"]];
//        return nil;
//    }
//    return [self SKarrayByAddingObject:anObject];
//}

-(void)SKaddObject:(id)anObject{
    if (!anObject) {
        [[SafeKitLog shareInstance]logWarning:@"object is nil"];
        return;
    }
    [self SKaddObject:anObject];
}
- (void)SKinsertObject:(id)anObject atIndex:(NSUInteger)index{
    if (index > [self count]) {
        [[SafeKitLog shareInstance]logWarning:[NSString stringWithFormat:@"index[%ld] > count[%ld]",(long)index ,(long)[self count]]];
        return;
    }
    if (!anObject) {
        [[SafeKitLog shareInstance]logWarning:@"object is nil"];
        return;
    }
    [self SKinsertObject:anObject atIndex:index];
}

- (void)SKremoveObjectAtIndex:(NSUInteger)index{
    if (index >= [self count]) {
        [[SafeKitLog shareInstance]logWarning:[NSString stringWithFormat:@"index[%ld] >= count[%ld]",(long)index ,(long)[self count]]];
        return;
    }
    
    return [self SKremoveObjectAtIndex:index];
}
- (void)SKreplaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject{
    if (index >= [self count]) {
        [[SafeKitLog shareInstance]logWarning:[NSString stringWithFormat:@"index[%ld] >= count[%ld]",(long)index ,(long)[self count]]];
        return;
    }
    if (!anObject) {
        [[SafeKitLog shareInstance]logWarning:@"object is nil"];
        return;
    }
    [self SKreplaceObjectAtIndex:index withObject:anObject];
}

+ (void) load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleMethod:@selector(SKobjectAtIndex:) tarClass:@"__NSArrayM" tarSel:@selector(objectAtIndex:)];
        //        [self swizzleMethod:@selector(SKarrayByAddingObject:) tarClass:@"__NSArrayM" tarSel:@selector(arrayByAddingObject:)];
        
        [self swizzleMethod:@selector(SKaddObject:) tarClass:@"__NSArrayM" tarSel:@selector(addObject:)];
        [self swizzleMethod:@selector(SKinsertObject:atIndex:) tarClass:@"__NSArrayM" tarSel:@selector(insertObject:atIndex:)];
        [self swizzleMethod:@selector(SKremoveObjectAtIndex:) tarClass:@"__NSArrayM" tarSel:@selector(removeObjectAtIndex:)];
        [self swizzleMethod:@selector(SKreplaceObjectAtIndex:withObject:) tarClass:@"__NSArrayM" tarSel:@selector(replaceObjectAtIndex:withObject:)];
    });
}
@end

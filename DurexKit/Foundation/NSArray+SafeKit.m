//
//  NSArray+SafeKit.m
//  SafeKitExample
//
//  Created by zhangyu on 14-2-28.
//  Copyright (c) 2014年 zhangyu. All rights reserved.
//

#import "NSArray+SafeKit.h"
#import "NSObject+swizzle.h"

@implementation NSArray(SafeKit)
-(id)SKobjectAtIndex:(NSUInteger)index{
//    NSLog(@"===NSArray(SafeKit)===");
    if (index >= [self count]) {
        return nil;
    }
    return [self SKobjectAtIndex:index];
}
- (NSArray *)SKarrayByAddingObject:(id)anObject{
    if (anObject) {
        return [self SKarrayByAddingObject:anObject];
    }
    return nil;
}
+ (void) load{
    [self swizzleMethod:@selector(SKobjectAtIndex:) targetClass:@"__NSArrayI" target:@selector(objectAtIndex:)];
    [self swizzleMethod:@selector(SKarrayByAddingObject:) targetClass:@"__NSArrayI" target:@selector(arrayByAddingObject:)];
}
@end

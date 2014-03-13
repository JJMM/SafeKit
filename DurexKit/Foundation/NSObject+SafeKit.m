//
//  NSObject+SafeKit.m
//  SafeKitExample
//
//  Created by zhangyu on 14-2-28.
//  Copyright (c) 2014年 zhangyu. All rights reserved.
//

#import "NSObject+SafeKit.h"
#import <objc/runtime.h>
#import "NSException+SafeKit.h"
#import "NSObject+swizzle.h"

#define TRY_BODY(__target) \
@try {\
{__target}\
}\
@catch (NSException *exception) {\
[exception printStackTrace];\
}\
@finally {\
\
}

@implementation NSObject(SafeKit)
//- (id)SKperformSelector:(SEL)aSelector{
//    if ([self respondsToSelector:aSelector]) {
//        [self SKperformSelector:aSelector];
//    }
//    return nil;
//}
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
- (id)performSelectorSafe:(SEL)aSelector{
    TRY_BODY([self performSelector:aSelector];)
    return nil;
}

- (id)performSelectorSafe:(SEL)aSelector withObject:(id)object{
    id ret = nil;
    TRY_BODY([self performSelector:aSelector withObject:object];)
    return ret;
}
- (id)performSelectorSafe:(SEL)aSelector withObject:(id)object1 withObject:(id)object2{
    id ret = nil;
    TRY_BODY([self performSelector:aSelector withObject:object1 withObject:object2];)
    return ret;
}
#pragma clang diagnostic pop

//+ (void) load{
//    [self swizzleMethod:@selector(SKperformSelector:) target:@selector(performSelector:)];
//
//}
@end

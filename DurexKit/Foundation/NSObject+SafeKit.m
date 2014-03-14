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
#import "SafeKitLog.h"

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

- (id)SKperformSelector:(SEL)aSelector{
    if ([self respondsToSelector:aSelector]) {
        typedef void (*MethodType)(id, SEL);
        MethodType methodToCall = (MethodType)[self methodForSelector:aSelector];
        methodToCall(self, aSelector);
        //return [self SKperformSelector:aSelector];//EXC_BAD_ACCESS.It do not work on ARC.Who could tell me?
    }else{
        [[SafeKitLog shareInstance]log:@"[%@ %@] unrecognized selector sent to instance ",[[self class]description],NSStringFromSelector(aSelector)];
    }
    return nil;
}

-(id)SKperformSelector:(SEL)aSelector withObject:(id)object{
    if ([self respondsToSelector:aSelector]) {
        typedef void (*MethodType)(id, SEL, id);
        MethodType methodToCall = (MethodType)[self methodForSelector:aSelector];
        methodToCall(self, aSelector, object);
    }else{
        [[SafeKitLog shareInstance]log:@"[%@ %@] unrecognized selector sent to instance ",[[self class]description],NSStringFromSelector(aSelector)];
    }
    return nil;
}
-(id)SKperformSelector:(SEL)aSelector withObject:(id)object1 withObject:(id)object2{
    if ([self respondsToSelector:aSelector]) {
        typedef void (*MethodType)(id, SEL, id, id);
        MethodType methodToCall = (MethodType)[self methodForSelector:aSelector];
        methodToCall(self, aSelector, object1, object2);
    }else{
        [[SafeKitLog shareInstance]log:@"[%@ %@] unrecognized selector sent to instance ",[[self class]description],NSStringFromSelector(aSelector)];
    }
    return nil;
}

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

+ (void) load{
    [self swizzleMethod:@selector(SKperformSelector:) target:@selector(performSelector:)];
    [self swizzleMethod:@selector(SKperformSelector:withObject:) target:@selector(performSelector:withObject:)];
    [self swizzleMethod:@selector(SKperformSelector:withObject:withObject:) target:@selector(performSelector:withObject:withObject:)];
}
@end

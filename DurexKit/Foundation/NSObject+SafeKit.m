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
#import "SafeKitConfig.h"

@implementation NSObject(SafeKit_Perform)

- (id)SKperformSelector:(SEL)aSelector{
    if ([self respondsToSelector:aSelector]) {
        if (getSafeKitObjectPerformExceptionCatch() == SafeKitObjectPerformExceptionCatchOn) {
            SK_TRY_BODY(typedef void (*MethodType)(id, SEL);
                        MethodType methodToCall = (MethodType)[self methodForSelector:aSelector];
                        methodToCall(self, aSelector);)
        }else{
            //return [self SKperformSelector:aSelector];//EXC_BAD_ACCESS.It do not work on ARC.Who could tell me?
            typedef void (*MethodType)(id, SEL);
            MethodType methodToCall = (MethodType)[self methodForSelector:aSelector];
            methodToCall(self, aSelector);
        }
    }else{
        [[SafeKitLog shareInstance]logError:[NSString stringWithFormat:@"[%@ %@] unrecognized selector sent to instance ",[[self class]description],NSStringFromSelector(aSelector)]];
    }
    return nil;
}

-(id)SKperformSelector:(SEL)aSelector withObject:(id)object{
    if ([self respondsToSelector:aSelector]) {
        if (getSafeKitObjectPerformExceptionCatch() == SafeKitObjectPerformExceptionCatchOn) {
            SK_TRY_BODY(typedef void (*MethodType)(id, SEL, id);
                        MethodType methodToCall = (MethodType)[self methodForSelector:aSelector];
                        methodToCall(self, aSelector, object);)
        }else{
            typedef void (*MethodType)(id, SEL, id);
            MethodType methodToCall = (MethodType)[self methodForSelector:aSelector];
            methodToCall(self, aSelector, object);
        }
    }else{
        [[SafeKitLog shareInstance]logError:[NSString stringWithFormat:@"[%@ %@] unrecognized selector sent to instance ",[[self class]description],NSStringFromSelector(aSelector)]];
    }
    return nil;
}
-(id)SKperformSelector:(SEL)aSelector withObject:(id)object1 withObject:(id)object2{
    if ([self respondsToSelector:aSelector]) {
        if (getSafeKitObjectPerformExceptionCatch() == SafeKitObjectPerformExceptionCatchOn) {
            SK_TRY_BODY(typedef void (*MethodType)(id, SEL, id, id);
                        MethodType methodToCall = (MethodType)[self methodForSelector:aSelector];
                        methodToCall(self, aSelector, object1, object2);)
        }else{
            typedef void (*MethodType)(id, SEL, id, id);
            MethodType methodToCall = (MethodType)[self methodForSelector:aSelector];
            methodToCall(self, aSelector, object1, object2);
        }
    }else{
        [[SafeKitLog shareInstance]logError:[NSString stringWithFormat:@"[%@ %@] unrecognized selector sent to instance ",[[self class]description],NSStringFromSelector(aSelector)]];
    }
    return nil;
}

+ (void) load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleMethod:@selector(SKperformSelector:) tarSel:@selector(performSelector:)];
        [self swizzleMethod:@selector(SKperformSelector:withObject:) tarSel:@selector(performSelector:withObject:)];
        [self swizzleMethod:@selector(SKperformSelector:withObject:withObject:) tarSel:@selector(performSelector:withObject:withObject:)];
    });
    
}
@end



@implementation NSObject(SafeKit_KVO)

-(Ivar)getAllClassVariable:(Class)clazz withName:(NSString *)key{
    Ivar ivar = class_getInstanceVariable(clazz, [key cStringUsingEncoding:NSASCIIStringEncoding]);
    
    if (ivar) {
        return ivar;
    }else{
        if (clazz == [NSObject class]) {
            return ivar;
        }else{
            return [self getAllClassVariable:[clazz superclass] withName:key];
        }
    }
}
-(void)SKsetValue:(id)value forKey:(NSString *)key{
    if (!key) {
        [[SafeKitLog shareInstance]logWarning:@"key is nil"];
        return;
    }
    if (![self getAllClassVariable:[self class] withName:key]) {
        [[SafeKitLog shareInstance]logWarning:[NSString stringWithFormat:@"[%@] is UndefineKey",key]];
        return;
    }
    [self SKsetValue:value forKey:key];
}
-(void)SKsetValue:(id)value forKeyPath:(NSString *)keyPath{
    if (!keyPath) {
        [[SafeKitLog shareInstance]logWarning:@"keyPath is nil"];
        return;
    }
    if (![self getAllClassVariable:[self class] withName:keyPath]) {
        [[SafeKitLog shareInstance]logWarning:[NSString stringWithFormat:@"[%@] is UndefineKey",keyPath]];
        return;
    }
    [self SKsetValue:value forKeyPath:keyPath];
}
-(void)SKsetValue:(id)value forUndefinedKey:(NSString *)key{
    if (!key) {
        [[SafeKitLog shareInstance]logWarning:@"key is nil"];
        return;
    }
    if (![self getAllClassVariable:[self class] withName:key]) {
        [[SafeKitLog shareInstance]logWarning:[NSString stringWithFormat:@"[%@] is UndefineKey",key]];
        return;
    }
    [self SKsetValue:value forUndefinedKey:key];
}

-(id)SKvalueForKey:(NSString *)key{
    if (!key) {
        [[SafeKitLog shareInstance]logWarning:@"key is nil"];
        return nil;
    }
    if (![self getAllClassVariable:[self class] withName:key]) {
        [[SafeKitLog shareInstance]logWarning:[NSString stringWithFormat:@"[%@] is UndefineKey",key]];
        return nil;
    }
    return [self SKvalueForKey:key];
}

-(id)SKvalueForKeyPath:(NSString *)keyPath{
    if (!keyPath) {
        [[SafeKitLog shareInstance]logWarning:@"keyPath is nil"];
        return nil;
    }
    if (![self getAllClassVariable:[self class] withName:keyPath]) {
        [[SafeKitLog shareInstance]logWarning:[NSString stringWithFormat:@"[%@] is UndefineKey",keyPath]];
        return nil;
    }
    return [self SKvalueForKeyPath:keyPath];
}

-(id)SKvalueForUndefinedKey:(NSString *)key{
    if (!key) {
        [[SafeKitLog shareInstance]logWarning:@"key is nil"];
        return nil;
    }
    if (![self getAllClassVariable:[self class] withName:key]) {
        [[SafeKitLog shareInstance]logWarning:[NSString stringWithFormat:@"[%@] is UndefineKey",key]];
        return nil;
    }
    return [self SKvalueForUndefinedKey:key];
}
+ (void) load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleMethod:@selector(SKsetValue:forKey:) tarSel:@selector(setValue:forKey:)];
        [self swizzleMethod:@selector(SKsetValue:forKeyPath:) tarSel:@selector(setValue:forKeyPath:)];
        [self swizzleMethod:@selector(SKsetValue:forUndefinedKey:) tarSel:@selector(setValue:forUndefinedKey:)];
        
        [self swizzleMethod:@selector(SKvalueForKey:) tarSel:@selector(valueForKey:)];
        [self swizzleMethod:@selector(SKvalueForKeyPath:) tarSel:@selector(valueForKeyPath:)];
        [self swizzleMethod:@selector(SKvalueForUndefinedKey:) tarSel:@selector(valueForUndefinedKey:)];
    });

}
@end



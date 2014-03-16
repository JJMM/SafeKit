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


static SafeKitObjectPerformExceptionCatch  safeKitObjectPerformExceptionCatchValue =  SafeKitObjectPerformExceptionCatchOn;

void setSafeKitObjectPerformExceptionCatch(SafeKitObjectPerformExceptionCatch type){
    safeKitObjectPerformExceptionCatchValue = type;
}
SafeKitObjectPerformExceptionCatch getSafeKitObjectPerformExceptionCatch(){
    return safeKitObjectPerformExceptionCatchValue;
}

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
        [[SafeKitLog shareInstance]log:@"[%@ %@] unrecognized selector sent to instance ",[[self class]description],NSStringFromSelector(aSelector)];
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
        [[SafeKitLog shareInstance]log:@"[%@ %@] unrecognized selector sent to instance ",[[self class]description],NSStringFromSelector(aSelector)];
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
        [[SafeKitLog shareInstance]log:@"[%@ %@] unrecognized selector sent to instance ",[[self class]description],NSStringFromSelector(aSelector)];
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
    Class cls = clazz;
    Ivar ivar = class_getInstanceVariable(cls, [key UTF8String]);
    
    if (ivar) {
        return ivar;
    }else{
        if (clazz == [NSObject class]) {
            return ivar;
        }else{
            return [self getAllClassVariable:[cls superclass] withName:key];
        }
    }
}
-(void)SKsetValue:(id)value forKey:(NSString *)key{
    SK_TRY_BODY([self SKsetValue:value forKey:key];)
}
-(void)SKsetValue:(id)value forKeyPath:(NSString *)keyPath{
    SK_TRY_BODY([self SKsetValue:value forKeyPath:keyPath];)
}
-(void)SKsetValue:(id)value forUndefinedKey:(NSString *)key{
    SK_TRY_BODY([self SKsetValue:value forUndefinedKey:key];)
}
-(void)SKsetValuesForKeysWithDictionary:(NSDictionary *)keyedValues{
    SK_TRY_BODY([self SKsetValuesForKeysWithDictionary:keyedValues];)
}

-(id)SKvalueForKey:(NSString *)key{
    SK_TRY_BODY(return [self SKvalueForKey:key];)
    return nil;
}

-(id)SKvalueForKeyPath:(NSString *)keyPath{
    SK_TRY_BODY(return [self SKvalueForKeyPath:keyPath];)
    return nil;
}

-(id)SKvalueForUndefinedKey:(NSString *)key{
    SK_TRY_BODY(return [self SKvalueForUndefinedKey:key];)
    return nil;
}
+ (void) load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleMethod:@selector(SKsetValue:forKey:) tarSel:@selector(setValue:forKey:)];
        [self swizzleMethod:@selector(SKsetValue:forKeyPath:) tarSel:@selector(setValue:forKeyPath:)];
        [self swizzleMethod:@selector(SKsetValue:forUndefinedKey:) tarSel:@selector(setValue:forUndefinedKey:)];
        [self swizzleMethod:@selector(SKsetValuesForKeysWithDictionary:) tarSel:@selector(setValuesForKeysWithDictionary:)];
        
        [self swizzleMethod:@selector(SKvalueForKey:) tarSel:@selector(valueForKey:)];
        [self swizzleMethod:@selector(SKvalueForKeyPath:) tarSel:@selector(valueForKeyPath:)];
        [self swizzleMethod:@selector(SKvalueForUndefinedKey:) tarSel:@selector(valueForUndefinedKey:)];
    });
    
}
@end



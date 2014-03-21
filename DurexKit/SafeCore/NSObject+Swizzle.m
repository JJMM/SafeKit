//
//  NSObject+swizzle.m
//  SafeKitExample
//
//  Created by zhangyu on 14-3-13.
//  Copyright (c) 2014年 zhangyu. All rights reserved.
//

#import "NSObject+Swizzle.h"
#import <objc/runtime.h>
#import "NSException+SafeKit.h"
#import "SafeKitConfig.h"

@implementation NSObject(Swizzle)

+(void)swizzleMethod:(SEL)srcSel tarSel:(SEL)tarSel{
    Class clazz = [self class];
    [self swizzleMethod:clazz srcSel:srcSel tarClass:clazz tarSel:tarSel];
}
+(void)swizzleMethod:(SEL)srcSel tarClass:(NSString *)tarClassName tarSel:(SEL)tarSel{
    if (!tarClassName) {
        return;
    }
    Class srcClass = [self class];
    Class tarClass = NSClassFromString(tarClassName);
    [self swizzleMethod:srcClass srcSel:srcSel tarClass:tarClass tarSel:tarSel];
}

+(void)swizzleMethod:(Class)srcClass srcSel:(SEL)srcSel tarClass:(Class)tarClass tarSel:(SEL)tarSel{
    if (!srcClass) {
        return;
    }
    if (!srcSel) {
        return;
    }
    if (!tarClass) {
        return;
    }
    if (!tarSel) {
        return;
    }
    SK_TRY_BODY(
                Method srcMethod = class_getInstanceMethod(srcClass,srcSel);
                Method tarMethod = class_getInstanceMethod(tarClass,tarSel);
                method_exchangeImplementations(srcMethod, tarMethod);)
}

@end

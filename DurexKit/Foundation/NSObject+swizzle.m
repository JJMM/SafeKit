//
//  NSObject+swizzle.m
//  SafeKitExample
//
//  Created by zhangyu on 14-3-13.
//  Copyright (c) 2014年 zhangyu. All rights reserved.
//

#import "NSObject+swizzle.h"
#import <objc/runtime.h>
@implementation NSObject(swizzle)

+(void)swizzleMethod:(SEL)src target:(SEL)tar{
    Class clazz = [self class];
    Method srcMethod = class_getInstanceMethod(clazz,src);
    Method tarMethod = class_getInstanceMethod(clazz,tar);
    method_exchangeImplementations(srcMethod, tarMethod);
}
+(void)swizzleMethod:(SEL)src targetClass:(NSString *)tarClass target:(SEL)tar{
    Class clazz = [self class];
    Method srcMethod = class_getInstanceMethod(clazz,src);
    Method tarMethod = class_getInstanceMethod(NSClassFromString(tarClass),tar);
    method_exchangeImplementations(srcMethod, tarMethod);
}
@end

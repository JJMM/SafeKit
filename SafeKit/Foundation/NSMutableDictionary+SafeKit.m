//
//  NSMutableDictionary+SafeKit.m
//  SafeKitExample
//
//  Created by zhangyu on 14-3-13.
//  Copyright (c) 2014年 zhangyu. All rights reserved.
//

#import "NSMutableDictionary+SafeKit.h"
#import "NSObject+swizzle.h"

@implementation NSMutableDictionary (SafeKit)

- (void)safe_removeObjectForKey:(id)aKey {
    if (!aKey) {
        return;
    }
    [self safe_removeObjectForKey:aKey];
}

- (void)safe_setObject:(id)anObject forKey:(id <NSCopying>)aKey {
    if (!anObject) {
        return;
    }
    if (!aKey) {
        return;
    }
    [self safe_setObject:anObject forKey:aKey];
}

+ (void) load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self safe_swizzleMethod:@selector(safe_removeObjectForKey:) tarClass:@"__NSDictionaryM" tarSel:@selector(removeObjectForKey:)];
        [self safe_swizzleMethod:@selector(safe_setObject:forKey:) tarClass:@"__NSDictionaryM" tarSel:@selector(setObject:forKey:)];
    });
}

@end

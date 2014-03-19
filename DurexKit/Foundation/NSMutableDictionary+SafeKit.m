//
//  NSMutableDictionary+SafeKit.m
//  DurexKitExample
//
//  Created by zhangyu on 14-3-13.
//  Copyright (c) 2014年 zhangyu. All rights reserved.
//

#import "NSMutableDictionary+SafeKit.h"
#import "NSObject+swizzle.h"
#import "SafeKitLog.h"
#import "NSException+SafeKit.h"

@implementation NSMutableDictionary(SafeKit)

- (void)SKremoveObjectForKey:(id)aKey{
    if (!aKey) {
        [[SafeKitLog shareInstance]logWarning:@"key is nil"];
        return;
    }
    [self SKremoveObjectForKey:aKey];
}

- (void)SKsetObject:(id)anObject forKey:(id <NSCopying>)aKey{
    if (!anObject) {
        [[SafeKitLog shareInstance]logWarning:@"object is nil"];
        return;
    }
    if (!aKey) {
        [[SafeKitLog shareInstance]logWarning:@"key is nil"];
        return;
    }
    [self SKsetObject:anObject forKey:aKey];
}

+ (void) load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleMethod:@selector(SKremoveObjectForKey:) tarClass:@"__NSDictionaryM" tarSel:@selector(removeObjectForKey:)];
        [self swizzleMethod:@selector(SKsetObject:forKey:) tarClass:@"__NSDictionaryM" tarSel:@selector(setObject:forKey:)];
    });
}
@end

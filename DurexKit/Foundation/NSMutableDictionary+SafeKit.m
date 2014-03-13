//
//  NSMutableDictionary+SafeKit.m
//  DurexKitExample
//
//  Created by zhangyu on 14-3-13.
//  Copyright (c) 2014年 zhangyu. All rights reserved.
//

#import "NSMutableDictionary+SafeKit.h"
#import "NSObject+swizzle.h"
@implementation NSMutableDictionary(SafeKit)

- (void)SKremoveObjectForKey:(id)aKey{
    if (!aKey) {
        return;
    }
    [self SKremoveObjectForKey:aKey];
}
- (void)SKsetObject:(id)anObject forKey:(id <NSCopying>)aKey{
    if (!anObject) {
        return;
    }
    if (!aKey) {
        return;
    }
    [self SKsetObject:anObject forKey:aKey];
}


+ (void) load{
    [self swizzleMethod:@selector(SKremoveObjectForKey:) targetClass:@"__NSDictionaryM" target:@selector(removeObjectForKey:)];
    [self swizzleMethod:@selector(SKsetObject:forKey:) targetClass:@"__NSDictionaryM" target:@selector(setObject:forKey:)];

}
@end

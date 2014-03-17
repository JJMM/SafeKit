//
//  NSString+SafeKit.m
//  DurexKitExample
//
//  Created by zhangyu on 14-3-15.
//  Copyright (c) 2014年 zhangyu. All rights reserved.
//

#import "NSString+SafeKit.h"
#import "NSObject+swizzle.h"
#import "SafeKitLog.h"
#import "NSException+SafeKit.h"

@implementation NSString(SafeKit)

//-(unichar)SKcharacterAtIndex:(NSUInteger)index{
//    if (index >= [self length]) {
//        [[SafeKitLog shareInstance]log:@"index[%ld] >= length[%ld]",(long)index ,(long)[self length]];
//        return 0;
//    }
//    return [self SKcharacterAtIndex:index];
//}
//
//+ (void) load{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        [self swizzleMethod:@selector(SKcharacterAtIndex:) tarClass:@"__NSCFString" tarSel:@selector(characterAtIndex:)];
//    });
//}
@end

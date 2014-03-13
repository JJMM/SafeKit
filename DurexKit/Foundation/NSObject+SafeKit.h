//
//  NSObject+SafeKit.h
//  SafeKitExample
//
//  Created by zhangyu on 14-2-28.
//  Copyright (c) 2014年 zhangyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject(SafeKit)
- (id)performSelectorSafe:(SEL)aSelector;
- (id)performSelectorSafe:(SEL)aSelector withObject:(id)object;
- (id)performSelectorSafe:(SEL)aSelector withObject:(id)object1 withObject:(id)object2;
@end

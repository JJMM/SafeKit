//
//  NSObject+swizzle.h
//  SafeKitExample
//
//  Created by zhangyu on 14-3-13.
//  Copyright (c) 2014年 zhangyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject(swizzle)
+(void)swizzleMethod:(SEL)src target:(SEL)tar;
+(void)swizzleMethod:(SEL)src targetClass:(NSString *)tarClass target:(SEL)tar;

-(void)sssss;
@end

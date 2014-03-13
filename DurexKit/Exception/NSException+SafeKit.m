//
//  NSException+SafeKit.m
//  DurexKitExample
//
//  Created by zhangyu on 14-3-13.
//  Copyright (c) 2014年 zhangyu. All rights reserved.
//

#import "NSException+SafeKit.h"

@implementation NSException(SafeKit)
-(void)printStackTrace{
    NSString *exceptionStr = [NSException formatExceptionToString:self];
    NSLog(@"%@",exceptionStr);
}

+(NSString *)formatExceptionToString:(NSException *)exception {
    NSArray *arr = [exception callStackSymbols];
    NSString *reason = [exception reason];
    NSString *name = [exception name];
    
    NSString *header = @"\n=============Crash exception report=============\n";
    NSString *description = [NSString stringWithFormat:@"%@name:%@\ntime:%@\nreason:\n%@",header,name,[NSDate date],reason];
    
    NSString *exceptionStr = [NSString stringWithFormat:@"%@\ncallStackSymbols:\n%@",description,[arr componentsJoinedByString:@"\n"]];
    
    return exceptionStr;
}
@end

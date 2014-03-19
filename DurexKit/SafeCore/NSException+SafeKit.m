//
//  NSException+SafeKit.m
//  DurexKitExample
//
//  Created by zhangyu on 14-3-13.
//  Copyright (c) 2014年 zhangyu. All rights reserved.
//

#import "NSException+SafeKit.h"
#import "SafeKitLog.h"

@implementation NSException(SafeKit)
-(void)printStackTrace{
    NSString *exceptionStr = [NSException formatExceptionToString:self withReason:nil];
    [[SafeKitLog shareInstance]log:exceptionStr];
}

-(void)printStackTrace:(NSString *)reasonStr{
    NSString *exceptionStr = [NSException formatExceptionToString:self withReason:reasonStr];
    [[SafeKitLog shareInstance]log:exceptionStr];
}

+(NSString *)formatExceptionToString:(NSException *)exception withReason:(NSString *)reasonStr{
    NSArray *arr = [exception callStackSymbols];
    NSString *reasonText = nil;
    if (reasonStr) {
        reasonText = reasonStr;
    }else{
        reasonText = [exception reason];
    }
    NSString *name = [exception name];
    
    NSString *header = @"\n=============SafeKit Exception Report=============\n";
    NSString *description = [NSString stringWithFormat:@"%@name:%@\ntime:%@\nreason:%@",header,name,[NSDate date],reasonText];
    
    NSString *exceptionStr = [NSString stringWithFormat:@"%@\ncallStackSymbols:\n%@",description,[arr componentsJoinedByString:@"\n"]];
    
    return exceptionStr;
}
@end

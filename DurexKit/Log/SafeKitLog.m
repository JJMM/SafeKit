//
//  SafeKitLog.m
//  DurexKitExample
//
//  Created by zhangyu on 14-3-14.
//  Copyright (c) 2014年 zhangyu. All rights reserved.
//

#import "SafeKitLog.h"

static BOOL SafeKitLogStatus = YES;
SafeKitLog *SafeKitLogInstance;


@interface SafeKitConsolePrinter : SafeKitPrinter

@end

@implementation SafeKitLog
@synthesize printer = _printer;

- (id)init
{
    self = [super init];
    if (self) {
        self.printer = [[SafeKitConsolePrinter alloc]init];
    }
    return self;
}
- (id)initWithPrinter:(SafeKitPrinter *)printer
{
    self = [super init];
    if (self) {
        self.printer = printer;
    }
    return self;
}
+(SafeKitLog *)shareInstance{
    if (!SafeKitLogInstance) {
        SafeKitLogInstance = [[SafeKitLog alloc]init];
    }
    return SafeKitLogInstance;
}
-(void)log:(NSString *)format, ...{
    if (![SafeKitLog iSLogOn]) {
        return;
    }
    if (format) {
        va_list arguments;
        va_start(arguments, format);
        va_end(arguments);
        [self.printer printv:format withArgs:arguments];
    }
}

+(BOOL)iSLogOn{
    return SafeKitLogStatus;
}

+(void)logOn{
    SafeKitLogStatus = YES;
}
+(void)logOff{
    SafeKitLogStatus = NO;
}
@end

@implementation SafeKitPrinter
-(void)printv:(NSString *)format withArgs:(va_list)args{

}
@end


@implementation SafeKitConsolePrinter
-(void)printv:(NSString *)format withArgs:(va_list)args{
    NSLogv(format, args);
}
@end


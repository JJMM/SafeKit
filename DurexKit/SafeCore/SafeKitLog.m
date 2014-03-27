//
//  SafeKitLog.m
//  DurexKitExample
//
//  Created by zhangyu on 14-3-14.
//  Copyright (c) 2014年 zhangyu. All rights reserved.
//

#import "SafeKitLog.h"
#import "NSException+SafeKit.h"
#import "SafeKitConfig.h"

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

-(void)log:(NSString *)aString{
    [self.printer print:aString];
}

-(void)logInfo:(NSString *)aString{
    if ((getSafeKitLogType() & SafeKitLogTypeInfo) != 0) {
        [self log:aString];
    }
}

-(void)logWarning:(NSString *)aString{
    if ((getSafeKitLogType() & SafeKitLogTypeWarning) != 0) {
        [self log:aString];
        
        //show stack trace
        @try {
            NSException *e = [NSException exceptionWithName:@"SafeKit" reason:@"WarningStackTrace" userInfo:nil];
            @throw e;
        }
        @catch (NSException *exception) {
            [exception printStackTrace];
        }
    }
}

-(void)logError:(NSString *)aString{
    if ((getSafeKitLogType() & SafeKitLogTypeError) != 0) {
        [self log:aString];
        
        //show stack trace
        @try {
            NSException *e = [NSException exceptionWithName:@"SafeKit" reason:@"ErrorStackTrace" userInfo:nil];
            @throw e;
        }
        @catch (NSException *exception) {
            [exception printStackTrace];
        }
    }
}
@end

@implementation SafeKitPrinter
-(void)print:(NSString *)aString{

}
@end


@implementation SafeKitConsolePrinter
-(void)print:(NSString *)aString{
    if (!aString) {
        return;
    }
    NSLog(@"%@",aString);
}
@end
//
//  SafeKitLog.m
//  DurexKitExample
//
//  Created by zhangyu on 14-3-14.
//  Copyright (c) 2014年 zhangyu. All rights reserved.
//

#import "SafeKitLog.h"
#import "NSException+SafeKit.h"


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
    if (getSafeKitLogType() == SafeKitLogTypeNone) {
        return;
    }
    if (format) {
        va_list arguments;
        va_start(arguments, format);
        va_end(arguments);
        
        [self.printer printv:[NSString stringWithFormat:@"SafeKit:%@",format] withArgs:arguments];
    }
    
    if (getSafeKitLogType() == SafeKitLogTypeDebugger) {
        @try {
            NSException *e = [NSException exceptionWithName:@"SafeKit" reason:@"StackTrace" userInfo:nil];
            @throw e;
        }
        @catch (NSException *exception) {
            [exception printStackTrace];
        }
        @finally {
            
        }
    }
}
-(void)logExc:(NSString *)format, ...{
    if (getSafeKitLogType() == SafeKitLogTypeNone) {
        return;
    }
    if (format) {
        va_list arguments;
        va_start(arguments, format);
        va_end(arguments);
        [self.printer printv:format withArgs:arguments];
    }
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

static SafeKitLogType SafeKitLogTypeValue = SafeKitLogTypeDebugger;
void setSafeKitLogType(SafeKitLogType logType){
    SafeKitLogTypeValue = logType;
}
SafeKitLogType getSafeKitLogType(){
    return SafeKitLogTypeValue;
}

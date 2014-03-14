//
//  SafeKitLog.h
//  DurexKitExample
//
//  Created by zhangyu on 14-3-14.
//  Copyright (c) 2014年 zhangyu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum{
    SafeKitLogTypeNone,
    SafeKitLogTypeInfo,
    SafeKitLogTypeDebugger,
    SafeKitLogTypeError//unimplementate
} SafeKitLogType;

@interface SafeKitPrinter : NSObject
-(void)printv:(NSString *)format withArgs:(va_list)args;
@end


@interface SafeKitLog : NSObject
@property (nonatomic, strong) SafeKitPrinter *printer;
- (id)initWithPrinter:(SafeKitPrinter *)printer;

+(SafeKitLog *)shareInstance;
-(void)log:(NSString *)format, ...NS_FORMAT_FUNCTION(1,2);
-(void)logExc:(NSString *)format, ...NS_FORMAT_FUNCTION(1,2);
+(SafeKitLogType)getLogType;
+(void)setLogType:(SafeKitLogType)logType;//Default is SafeKitLogTypeInfo
@end



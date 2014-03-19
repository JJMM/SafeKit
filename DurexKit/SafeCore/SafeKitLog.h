//
//  SafeKitLog.h
//  DurexKitExample
//
//  Created by zhangyu on 14-3-14.
//  Copyright (c) 2014年 zhangyu. All rights reserved.
//

#import <Foundation/Foundation.h>


//typedef enum{
//    SafeKitLogTypeNone,//don't print anything
//    SafeKitLogTypeInfo,//print summary info
//    SafeKitLogTypeDebugger//print stack trace
//} SafeKitLogType;
//
////
//void setSafeKitLogType(SafeKitLogType logType);
//SafeKitLogType getSafeKitLogType();
@interface SafeKitPrinter : NSObject
-(void)print:(NSString *)aString;
@end


@interface SafeKitLog : NSObject
@property (nonatomic, strong) SafeKitPrinter *printer;
- (id)initWithPrinter:(SafeKitPrinter *)printer;
-(void)log:(NSString *)aString;
-(void)logInfo:(NSString *)aString;
-(void)logWarning:(NSString *)aString;
-(void)logError:(NSString *)aString;

+(SafeKitLog *)shareInstance;
@end




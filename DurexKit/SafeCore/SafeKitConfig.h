//
//  SafeKitConfig.h
//  DurexKitExample
//
//  Created by zhangyu on 14-3-19.
//  Copyright (c) 2014年 zhangyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#define SafeKitLogTypeNone 0     //Don't print any log
#define SafeKitLogTypeInfo 1     //print log info
#define SafeKitLogTypeWarning 2  //print log warning
#define SafeKitLogTypeError 4    //print log error

/*
 * You could use "|" join the diffrent type.
 * eg:setSafeKitLogType(SafeKitLogTypeInfo | SafeKitLogTypeWarning | SafeKitLogTypeError);
 */
void setSafeKitLogType(NSInteger type);

/*
 * To get SafeKitLog type
 * eg: if ((getSafeKitLogType() & SafeKitLogTypeError) != 0) { ... }
 */
NSInteger getSafeKitLogType();


typedef enum{
    SafeKitObjectPerformExceptionCatchOn,//When Object invoke the method named performSelector,it will add try .. catch
    SafeKitObjectPerformExceptionCatchOff
} SafeKitObjectPerformExceptionCatch;

/*
 * Set method
 */
void setSafeKitObjectPerformExceptionCatch(SafeKitObjectPerformExceptionCatch type);

/*
 * Get method
 */
SafeKitObjectPerformExceptionCatch getSafeKitObjectPerformExceptionCatch();

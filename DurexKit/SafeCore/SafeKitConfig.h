//
//  SafeKitConfig.h
//  DurexKitExample
//
//  Created by zhangyu on 14-3-19.
//  Copyright (c) 2014年 zhangyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#define SafeKitLogTypeNone 0
#define SafeKitLogTypeInfo 1
#define SafeKitLogTypeWarning 2
#define SafeKitLogTypeError 4

//SafeKitLogTypeInfo | SafeKitLogTypeWarning | SafeKitLogTypeError
void setSafeKitLogType(NSInteger type);

//use it such as: if ((getSafeKitLogType() & SafeKitLogTypeError) != 0) { ... }
NSInteger getSafeKitLogType();

typedef enum{
    SafeKitObjectPerformExceptionCatchOn,
    SafeKitObjectPerformExceptionCatchOff
} SafeKitObjectPerformExceptionCatch;

void setSafeKitObjectPerformExceptionCatch(SafeKitObjectPerformExceptionCatch type);
SafeKitObjectPerformExceptionCatch getSafeKitObjectPerformExceptionCatch();


typedef enum{
    SafeKitPowerOn,
    SafeKitPowerOff
} SafeKitPower;

// enable swizzle method
void setSafeKitPower(SafeKitPower power);
SafeKitPower getSafeKitPower();

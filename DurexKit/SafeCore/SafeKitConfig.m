//
//  SafeKitConfig.m
//  DurexKitExample
//
//  Created by zhangyu on 14-3-19.
//  Copyright (c) 2014年 zhangyu. All rights reserved.
//

#import "SafeKitConfig.h"

static NSInteger SafeKitLogTypeValue = SafeKitLogTypeError;
static SafeKitObjectPerformExceptionCatch safeKitObjectPerformExceptionCatchValue =  SafeKitObjectPerformExceptionCatchOn;
static SafeKitPower SafeKitPowerValue = SafeKitPowerOn;


////////   Log   ////////
void setSafeKitLogType(NSInteger logType){
    SafeKitLogTypeValue = logType;
}
NSInteger getSafeKitLogType(){
    return SafeKitLogTypeValue;
}


////////   catch   ////////
void setSafeKitObjectPerformExceptionCatch(SafeKitObjectPerformExceptionCatch type){
    safeKitObjectPerformExceptionCatchValue = type;
}
SafeKitObjectPerformExceptionCatch getSafeKitObjectPerformExceptionCatch(){
    return safeKitObjectPerformExceptionCatchValue;
}

////////   power   ////////
void setSafeKitPower(SafeKitPower power){
    SafeKitPowerValue = power;
}
SafeKitPower getSafeKitPower(){
    return SafeKitPowerValue;
}

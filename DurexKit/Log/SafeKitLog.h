//
//  SafeKitLog.h
//  DurexKitExample
//
//  Created by zhangyu on 14-3-14.
//  Copyright (c) 2014年 zhangyu. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface SafeKitPrinter : NSObject
-(void)printv:(NSString *)format withArgs:(va_list)args;
@end


@interface SafeKitLog : NSObject
@property (nonatomic, strong) SafeKitPrinter *printer;
- (id)initWithPrinter:(SafeKitPrinter *)printer;

+(SafeKitLog *)shareInstance;
-(void)log:(NSString *)format, ...NS_FORMAT_FUNCTION(1,2);

+(BOOL)iSLogOn;
+(void)logOn;
+(void)logOff;
@end



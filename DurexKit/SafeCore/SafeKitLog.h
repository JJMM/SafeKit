//
//  SafeKitLog.h
//  DurexKitExample
//
//  Created by zhangyu on 14-3-14.
//  Copyright (c) 2014年 zhangyu. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 * This is an interface for printer.
 * This default implementation printer will invoke NSLog to print log on console.
 * You could define yourself way to record log.
 * Just need to implement another.
 */
@interface SafeKitPrinter : NSObject

/*
 * When the SafeKitLog invoke the method named log,this method will be invode also.
 * @param aString log string.
 */
-(void)print:(NSString *)aString;
@end

/*
 * Log manager.
 * Please use [SafeKitLog shareInstance] to get the instance of SafeKitLog.
 */
@interface SafeKitLog : NSObject

/*
 * Replace printer by your SafeKitPrinter.
 */
@property (nonatomic, strong) SafeKitPrinter *printer;

/*
 * When you want to implement another log manager,you could use it.
 * @param printer SafeKitPrinter.
 */
- (id)initWithPrinter:(SafeKitPrinter *)printer;

/*
 * log.
 * @param aString log string.
 */
-(void)log:(NSString *)aString;

/*
 * log.
 * @param aString log info string.
 */
-(void)logInfo:(NSString *)aString;

/*
 * log.
 * @param aString log warning string.
 */
-(void)logWarning:(NSString *)aString;

/*
 * log.
 * @param aString log error string.
 */
-(void)logError:(NSString *)aString;

/*
 * To get the instance of SafeKitLog.
 */
+(SafeKitLog *)shareInstance;
@end




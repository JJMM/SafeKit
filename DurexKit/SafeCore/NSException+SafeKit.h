//
//  NSException+SafeKit.h
//  DurexKitExample
//
//  Created by zhangyu on 14-3-13.
//  Copyright (c) 2014年 zhangyu. All rights reserved.
//

#import <Foundation/Foundation.h>

#define SK_TRY_BODY(__target) \
@try {\
{__target}\
}\
@catch (NSException *exception) {\
[exception printStackTrace];\
}\
@finally {\
\
}
/*
 * This category adds methods to the NSException.
 */
@interface NSException(SafeKit)

/*
 * To print stack trace.
 */
-(void)printStackTrace;

/*
 * To print stack trace.
 * @param reasonStr the reason of exception trace
 */
-(void)printStackTrace:(NSString *)reasonStr;
@end

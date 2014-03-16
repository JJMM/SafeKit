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

@interface NSException(SafeKit)
-(void)printStackTrace;
-(void)printStackTrace:(NSString *)reasonStr;
@end

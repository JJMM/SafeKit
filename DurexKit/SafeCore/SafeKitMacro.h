//
//  SafeKitMacro.h
//  DurexKitExample
//
//  Created by zhangyu on 14-3-24.
//  Copyright (c) 2014年 zhangyu. All rights reserved.
//

#if __has_feature(objc_arc)
#define SK_AUTORELEASE(exp) exp
#define SK_RELEASE(exp) exp
#define SK_RETAIN(exp) exp
#else
#define SK_AUTORELEASE(exp) [exp autorelease]
#define SK_RELEASE(exp) [exp release]
#define SK_RETAIN(exp) [exp retain]
#endif
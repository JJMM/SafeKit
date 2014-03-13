DurexKit
========

A SafeKit for iOS.Never crash in NSArray,NSDictionary...

![image](https://github.com/JJMM/CUSResources/raw/master/DurexKitIntr.gif)

###How to Start?
1.Copy the folder of "DurexKit" to your project.
2.#import "DurexKit.h"
3.You don't change any codes to use it.Very easy.


###theory
We exchange the method in NSArray,NSDictionary

+ (void) load{
    [self swizzleMethod:@selector(SKobjectAtIndex:) targetClass:@"__NSArrayI" target:@selector(objectAtIndex:)];
    [self swizzleMethod:@selector(SKarrayByAddingObject:) targetClass:@"__NSArrayI" target:@selector(arrayByAddingObject:)];
}

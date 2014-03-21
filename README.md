DurexKit
========

An open source SafeKit for iOS.<br>
Our goal is no crash.<br>
![image](https://github.com/JJMM/CUSResources/raw/master/DurexKitIntr.png)

## How To Get Started
1.Copy the folder of "DurexKit" to your project.<br>
2.#import "DurexKit.h"<br>
3.You don't change any codes to use it.Very easy.<br>


## exchange the method in NSArray,NSDictionary…
```objective-c
+ (void) load{
    [self swizzleMethod:@selector(SKobjectAtIndex:) targetClass:@"__NSArrayI" target:@selector(objectAtIndex:)];
    [self swizzleMethod:@selector(SKarrayByAddingObject:) targetClass:@"__NSArrayI" target:@selector(arrayByAddingObject:)];
}

```

## Log
```objective-c
#define SafeKitLogTypeNone 0
#define SafeKitLogTypeInfo 1
#define SafeKitLogTypeWarning 2
#define SafeKitLogTypeError 4

setSafeKitLogType(SafeKitLogTypeNone);
setSafeKitLogType(SafeKitLogTypeInfo | SafeKitLogTypeWarning | SafeKitLogTypeError);

[[SafeKitLog shareInstance]log:@“info“];
The method will invoke NSLog to print  “info” on console.Also,you could use yourself way to record log.You just need to implement the interface of ”SafeKitPrinter”.

This is default implementation.
```objective-c
@interface SafeKitConsolePrinter : SafeKitPrinter

@end

[[SafeKitLog shareInstance]setPrinter:printer];
```
```

## Method perform
```objective-c
typedef enum{
    SafeKitObjectPerformExceptionCatchOn,//default
    SafeKitObjectPerformExceptionCatchOff
} SafeKitObjectPerformExceptionCatch;

setSafeKitObjectPerformExceptionCatch(SafeKitObjectPerformExceptionCatchOn);
setSafeKitObjectPerformExceptionCatch(SafeKitObjectPerformExceptionCatchOff);

```

## License

DurexKit is licensed under the terms of the [Apache License, version 2.0](http://www.apache.org/licenses/LICENSE-2.0.html). Please see the [LICENSE](LICENSE) file for full details.

## Contributions

Contributions are totally welcome. We'll review all pull requests and if you send us a good one/are interested we're happy to give you push access to the repo. Or, you know, you could just come work with us.<br>

Please pay attention to add Star, your support is my greatest motivation, thank you.
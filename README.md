DurexKit could greatly reduce the probability of crash.<br>
It’s very easy to use without modifying any code.<br>
![image](https://github.com/JJMM/CUSResources/raw/master/DurexKitIntr.jpg)

## How To Get Started
###Use static library
- 1.Open your existing project (or create a new one)
- 2.Drag and drop the DurexKitExample.xcodeproj file downloaded from github previously from Finder to your project (either root or under Frameworks)

- 3.In YOUR project configuration:<br>
in the Build Phases, Add DurexKit (the lib, not the example app) as a Target Dependency<br>
in the Link Binary With Libraries section, add the libDurexKit.a library<br>
- 4.In YOUR Prefix.pch file, add:

    \#import \<DurexKit/DurexKit.h\>

- 5.In YOUR project configuration, on the “Build Settings” tab

- locate the “User Header Search Paths” setting, and set the Release value to "${PROJECT_DIR}/DurexKit" (including quotes!) and check the “Recursive” check box.
- The Debug value should already be set, but if it’s not, change that as well.
- Also locate the “Always Search User Paths” value and set it to YES.
- Finally, find the “Other Linker Flags” option, and add the value -ObjC (no quotes).

### Use source directly

1. Copy the folder named DurexKit to your project
2. in the Compile Sources section, find the NSException+SafeKit.m, and add the value -fno-objc-arc

We do not recommend using like this.

## Exchange the method in NSArray,NSDictionary…
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
```
The method will invoke NSLog to print  “info” on console.Also,you could use yourself way to record log.You just need to implement the interface of ”SafeKitPrinter”.

This is default implementation.
```objective-c
@interface SafeKitConsolePrinter : SafeKitPrinter

@end

[[SafeKitLog shareInstance]setPrinter:printer];
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
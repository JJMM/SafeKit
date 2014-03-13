DurexKit
========

A SafeKit for iOS.
We aim is Never crash.

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
## License

RestKit is licensed under the terms of the [Apache License, version 2.0](http://www.apache.org/licenses/LICENSE-2.0.html). Please see the [LICENSE](LICENSE) file for full details.

## Contributions

Contributions are totally welcome. We'll review all pull requests and if you send us a good one/are interested we're happy to give you push access to the repo. Or, you know, you could just come work with us.<br>

Please pay attention to add Star, your support is my greatest motivation, thank you.
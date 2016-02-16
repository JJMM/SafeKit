SafeKit could greatly reduce the probability of crash.<br>
It’s very easy to use without modifying any code.<br>
![image](https://github.com/JJMM/CUSResources/raw/master/DurexKitIntr.jpg)

## How To Get Started
### Installation with CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries like CUSLayout in your projects. See the ["Getting Started" guide for more information](https://github.com/JJMM/CUSLayout/wiki/Getting-Started-with-CUSLayout).

#### Podfile

```
pod "SafeKit"
```
------------------------------------

## Exchange the method in NSArray,NSDictionary…
```

+ (void) load{
    [self safe_swizzleMethod:@selector(safe_objectAtIndex:) tarClass:@"__NSArrayI" tarSel:@selector(objectAtIndex:)];
        [self safe_swizzleMethod:@selector(safe_arrayByAddingObject:) tarClass:@"__NSArrayI" tarSel:@selector(arrayByAddingObject:)];
}

```

## Unit Test
```
@interface NSArrayTests : XCTestCase

@property (strong, nonatomic) NSArray *array;

@end

@implementation NSArrayTests

- (void)setUp {
    [super setUp];
    self.array = @[@"0", @"1", @"2"];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testObjectAtIndex {
    id value = [self.array objectAtIndex:10];
    XCTAssert(value == nil);
    value = self.array[10];
    XCTAssert(value == nil);
}

- (void)testArrayByAddingObject {
    id value = nil;
    [self.array arrayByAddingObject:value];
}

@end

```
Test success!

## License

SafeKit is licensed under the terms of the [Apache License, version 2.0](http://www.apache.org/licenses/LICENSE-2.0.html). Please see the [LICENSE](LICENSE) file for full details.

## Contributions

Contributions are totally welcome. We'll review all pull requests and if you send us a good one/are interested we're happy to give you push access to the repo. Or, you know, you could just come work with us.<br>

Please pay attention to add Star, your support is my greatest motivation, thank you.
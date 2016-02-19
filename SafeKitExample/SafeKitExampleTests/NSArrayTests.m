//
//  NSArrayTests.m
//  SafeKitExample
//
//  Created by 张宇 on 16/2/5.
//  Copyright © 2016年 zhangyu. All rights reserved.
//

#import <XCTest/XCTest.h>

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

- (void)testLiterals {
    id value = nil;
    self.array = @[@"0", @"1", @"2", value ,@"4"];
}

@end

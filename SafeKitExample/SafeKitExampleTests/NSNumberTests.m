//
//  NSNumberTests.m
//  SafeKitExample
//
//  Created by 张宇 on 16/2/5.
//  Copyright © 2016年 zhangyu. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface NSNumberTests : XCTestCase

@property (strong, nonatomic) NSNumber *number;

@end

@implementation NSNumberTests

- (void)setUp {
    [super setUp];
    self.number = [NSNumber numberWithInt:10];
}

- (void)testIsEqualToNumber {
    id value = nil;
    [self.number isEqualToNumber:value];
}

- (void)testCompare {
    id value = nil;
    [self.number compare:value];
}

@end

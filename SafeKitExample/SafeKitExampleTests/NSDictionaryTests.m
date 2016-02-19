//
//  NSDictionaryTests.m
//  SafeKitExample
//
//  Created by 张宇 on 16/2/19.
//  Copyright © 2016年 zhangyu. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface NSDictionaryTests : XCTestCase

@property (strong, nonatomic) NSDictionary *dictionary;

@end

@implementation NSDictionaryTests

- (void)setUp {
    [super setUp];
}

- (void)testLiterals {
    id value = nil;
    self.dictionary = @{@"key0":@"value0", @"key1":value, @"key2":@"value2"};
}

@end


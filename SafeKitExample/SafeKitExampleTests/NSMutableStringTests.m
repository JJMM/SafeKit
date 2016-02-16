//
//  NSMutableStringTests.m
//  SafeKitExample
//
//  Created by 张宇 on 16/2/5.
//  Copyright © 2016年 zhangyu. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface NSMutableStringTests : XCTestCase

@property (strong, nonatomic) NSMutableString *string;

@end

@implementation NSMutableStringTests

- (void)setUp {
    [super setUp];
    self.string = [NSMutableString stringWithString:@"abc"];
}

- (void)testAppendString {
    id value = nil;
    [self.string appendString:value];
}

- (void)testAppendFormat {
    id value = nil;
    [self.string appendFormat:value, nil];
}

- (void)testSetString {
    id value = nil;
    [self.string setString:value];
}

- (void)testInsertString {
    id value = nil;
    [self.string insertString:value atIndex:20];
}

@end

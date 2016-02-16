//
//  NSStringTests.m
//  SafeKitExample
//
//  Created by 张宇 on 16/2/5.
//  Copyright © 2016年 zhangyu. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface NSStringTests : XCTestCase

@property (strong, nonatomic) NSString *string;

@end

@implementation NSStringTests

- (void)setUp {
    [super setUp];
    self.string = @"abc";
}

- (void)testCharacterAtIndex {
    [self.string characterAtIndex:10];
}

@end

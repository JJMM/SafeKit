//
//  NSStringTests.m
//  DurexKitExample
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

- (void)testE {
    [self.string characterAtIndex:10];
    
    [self.string isEqualToString:nil];
    [self.string hasPrefix:nil];
    [self.string stringByAppendingString:nil];
}

@end

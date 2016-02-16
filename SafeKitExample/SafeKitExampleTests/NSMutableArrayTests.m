//
//  NSMutableArrayTests.m
//  SafeKitExample
//
//  Created by 张宇 on 16/2/5.
//  Copyright © 2016年 zhangyu. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface NSMutableArrayTests : XCTestCase

@property (strong, nonatomic) NSMutableArray *array;

@end

@implementation NSMutableArrayTests

- (void)setUp {
    [super setUp];
    self.array = [NSMutableArray arrayWithObjects:@"0", @"1", @"2", nil];
}

- (void)testObjectAtIndex {
    id value = [self.array objectAtIndex:10];
    XCTAssert(value == nil);
    value = self.array[10];
    XCTAssert(value == nil);
}

- (void)testAddObject {
    id value = nil;
    [self.array addObject:value];
}

- (void)testInsertObject {
    id value = nil;
    [self.array insertObject:value atIndex:10];
}

- (void)testRemoveObjectAtIndex {
    [self.array removeObjectAtIndex:10];
}

- (void)testReplaceObjectAtIndex {
    id value = nil;
    [self.array replaceObjectAtIndex:10 withObject:value];
}

- (void)testArrayByAddingObject {
    id value = nil;
    [self.array arrayByAddingObject:value];
}

@end

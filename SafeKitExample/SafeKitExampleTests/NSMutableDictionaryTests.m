//
//  NSMutableDictionaryTests.m
//  SafeKitExample
//
//  Created by 张宇 on 16/2/5.
//  Copyright © 2016年 zhangyu. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface NSMutableDictionaryTests : XCTestCase

@property (strong, nonatomic) NSMutableDictionary *dictionary;

@end

@implementation NSMutableDictionaryTests

- (void)setUp {
    [super setUp];
    self.dictionary = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"valu0", @"key0", @"valu1", @"key1", nil];
}

- (void)testRemoveObjectForKey {
    id key = nil;
    [self.dictionary removeObjectForKey:key];
}

- (void)testSetObject {
    id key = nil;
    id value = nil;
    [self.dictionary setObject:value forKey:key];
    self.dictionary[key] = value;
}

@end

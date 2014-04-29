//
//  NSArray_TDTNullNormalization_Tests.m
//  TDTChocolateTests
//
//  Created by Ayush on 29/04/14.
//  Copyright (c) 2014 Talk.to. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <TDTChocolate/TDTFoundationAdditions.h>
#import <TDTChocolate/TDTTestingAdditions.h>

@interface NSArray_TDTNullNormalization_Tests : XCTestCase

@end

@implementation NSArray_TDTNullNormalization_Tests

- (void)testItDoesNotChangeArrayWithNoNulls {
  NSArray *array = @[[NSString tdt_randomString],
                     [NSString tdt_randomString]];
  NSArray *normalizedArray = [array tdt_arrayByRemovingNulls];
  XCTAssertEqualObjects(array, normalizedArray);
}

- (void)testSingleNullIsRemoved {
  NSArray *array = @[[NSString tdt_randomString]];
  NSArray *arrayWithNull = [array arrayByAddingObject:[NSNull null]];
  NSArray *normalizedArray = [arrayWithNull tdt_arrayByRemovingNulls];
  XCTAssertEqualObjects(normalizedArray, array);
}

- (void)testMultipleNullsAreRemoved {
  NSArray *array = @[[NSString tdt_randomString],
                     [NSString tdt_randomString]];
  NSMutableArray *arrayWithNulls = [NSMutableArray arrayWithArray:array];
  [arrayWithNulls addObject:[NSNull null]];
  [arrayWithNulls addObject:[NSNull null]];
  NSArray *normalizedArray = [arrayWithNulls tdt_arrayByRemovingNulls];
  XCTAssertEqualObjects(normalizedArray, array);
}

@end

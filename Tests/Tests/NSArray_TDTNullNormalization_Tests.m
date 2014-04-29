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

- (void)testSingleNullIsRemoved {
  NSArray *array = @[[NSString tdt_randomString]];
  NSArray *arrayWithNull = [array arrayByAddingObject:[NSNull null]];
  NSArray *normalizedArray = [arrayWithNull tdt_arrayByRemovingNulls];
  XCTAssertEqualObjects(normalizedArray, array);
}
@end

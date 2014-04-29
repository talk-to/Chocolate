//
//  NSDictionary_TDTNullNormalization_Tests.m
//  TDTChocolateTests
//
//  Created by Ayush on 29/04/14.
//  Copyright (c) 2014 Talk.to. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <TDTChocolate/TDTFoundationAdditions.h>
#import <TDTChocolate/TDTTestingAdditions.h>

@interface NSDictionary_TDTNullNormalization_Tests : XCTestCase

@end

@implementation NSDictionary_TDTNullNormalization_Tests

- (void)testItDoesNotChangeDictionaryWithNoNulls {
  NSDictionary *dictionary = @{[NSString tdt_randomString] : [NSString tdt_randomString],
                               [NSString tdt_randomString] : [NSString tdt_randomString]};
  NSDictionary *normalizedDictionary = [dictionary tdt_dictionaryByRemovingNulls];
  XCTAssertEqualObjects(dictionary, normalizedDictionary);
}

- (void)testSingleNullIsRemoved {
  NSDictionary *dictionary = @{[NSString tdt_randomString] : [NSString tdt_randomString]};
  NSMutableDictionary *dictionaryWithNull = [NSMutableDictionary dictionaryWithDictionary:dictionary];
  dictionaryWithNull[[NSString tdt_randomString]] = [NSNull null];
  NSDictionary *normalizedDictionary = [dictionaryWithNull tdt_dictionaryByRemovingNulls];
  XCTAssertEqualObjects(dictionary, normalizedDictionary);
}

- (void)testMultipleNullsAreRemoved {
  NSDictionary *dictionary = @{[NSString tdt_randomString] : [NSString tdt_randomString],
                               [NSString tdt_randomString] : [NSString tdt_randomString]};
  NSMutableDictionary *dictionaryWithNulls = [NSMutableDictionary dictionaryWithDictionary:dictionary];
  dictionaryWithNulls[[NSString tdt_randomString]] = [NSNull null];
  dictionaryWithNulls[[NSString tdt_randomString]] = [NSNull null];
  NSDictionary *normalizedDictionary = [dictionaryWithNulls tdt_dictionaryByRemovingNulls];
  XCTAssertEqualObjects(dictionary, normalizedDictionary);
}

@end

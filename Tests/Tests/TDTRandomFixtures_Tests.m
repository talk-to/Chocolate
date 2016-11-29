//
//  TDTRandomFixturesTests.m
//  TDTChocolateTests
//
//  Created by Yatin on 11/29/16.
//  Copyright © 2016 Talk.to. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <TDTChocolate/TDTTestingAdditions.h>

@interface TDTRandomFixtures_Tests : XCTestCase

@end

@implementation TDTRandomFixtures_Tests

- (void)testItGeneratesRandomNumberWithinInterval {
  NSNumber *lowerBound = [NSNumber tdt_randomNumber];
  NSNumber *upperBound = [NSNumber tdt_randomNumber];
  while ([upperBound longValue] < [lowerBound longValue]) {
    upperBound = [NSNumber tdt_randomNumber];
  }
  NSNumber *result = [NSNumber tdt_randomNumberBetweenMin:lowerBound max:upperBound];
  XCTAssertTrue(([result longValue] >= [lowerBound longValue])
                && ([result longValue] < [upperBound longValue]));
}

- (void)testItDoesNotGenerateRandomNumberWithSameMinAndMax {
  NSNumber *lowerBound = [NSNumber tdt_randomNumber];
  NSNumber *upperBound = lowerBound;
  NSNumber *result = [NSNumber tdt_randomNumberBetweenMin:lowerBound max:upperBound];
  XCTAssertNil(result);
}

- (void)testItDoesNotGenerateRandomNumberForIncorrectIntervals {
  NSNumber *lowerBound = [NSNumber tdt_randomNumber];
  NSNumber *upperBound = [NSNumber tdt_randomNumber];
  while ([upperBound longValue] >= [lowerBound longValue]) {
    upperBound = [NSNumber tdt_randomNumber];
  }
  NSNumber *result = [NSNumber tdt_randomNumberBetweenMin:lowerBound max:upperBound];
  XCTAssertNil(result);
}

@end

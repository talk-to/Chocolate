#import <XCTest/XCTest.h>
#import <TDTChocolate/TDTTestingAdditions.h>

@interface XCTAssert_TDTAdditions_Tests : XCTestCase

@end

@implementation XCTAssert_TDTAdditions_Tests

- (void)testArrayContainmentAssert {
  NSArray *receiver = @[@"x", @"y", @"z"];
  TDTXCTAssertContains(receiver, @"y");
}

- (void)testStringContainmentAssert {
  TDTXCTAssertContainsString(@"abc", @"b");
}

- (void)testDateEarlierThanOrEqualToAssert {
  NSDate *date = [NSDate date];
  TDTXCTAssertEarlierThanOrEqualToDate(date, [NSDate date]);
}

@end

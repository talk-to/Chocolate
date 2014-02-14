#import <XCTest/XCTest.h>
#import <TDTChocolate/FoundationAdditions/NSDate+TDTComparisons.h>

@interface NSDate_TDTComparisons_Tests : XCTestCase

@end

@implementation NSDate_TDTComparisons_Tests

- (void)testIsEarlierDateComparisons {
  NSDate *past = [NSDate distantPast];
  NSDate *present = [NSDate date];
  NSDate *future = [NSDate distantFuture];
  XCTAssertTrue([past tdt_isEarlierThanDate:present]);
  XCTAssertFalse([past tdt_isEarlierThanDate:past]);
  XCTAssertFalse([future tdt_isEarlierThanDate:present]);
}

- (void)testIsEarlierThanOrEqualToDateComparisons {
  NSDate *past = [NSDate distantPast];
  NSDate *present = [NSDate date];
  NSDate *future = [NSDate distantFuture];
  XCTAssertTrue([past tdt_isEarlierThanOrEqualToDate:present]);
  XCTAssertTrue([past tdt_isEarlierThanOrEqualToDate:past]);
  XCTAssertFalse([future tdt_isEarlierThanOrEqualToDate:present]);
}

@end

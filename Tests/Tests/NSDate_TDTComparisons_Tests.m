#import <XCTest/XCTest.h>
#import <TDTHotChocolate/FoundationAdditions/NSDate+TDTComparisons.h>

@interface NSDate_TDTComparisons_Tests : XCTestCase

@end

@implementation NSDate_TDTComparisons_Tests

- (void)testIsEarlierDateComparisons {
  NSDate *past = [NSDate distantPast];
  NSDate *present = [NSDate date];
  NSDate *future = [NSDate distantFuture];
  XCTAssertTrue([past isEarlierThanDate:present]);
  XCTAssertFalse([past isEarlierThanDate:past]);
  XCTAssertFalse([future isEarlierThanDate:present]);
}

- (void)testIsEarlierThanOrEqualToDateComparisons {
  NSDate *past = [NSDate distantPast];
  NSDate *present = [NSDate date];
  NSDate *future = [NSDate distantFuture];
  XCTAssertTrue([past isEarlierThanOrEqualToDate:present]);
  XCTAssertTrue([past isEarlierThanOrEqualToDate:past]);
  XCTAssertFalse([future isEarlierThanOrEqualToDate:present]);
}

@end

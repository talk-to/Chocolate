#import <XCTest/XCTest.h>
#import <TDTChocolate/TDTTestingAdditions.h>
#import <TDTChocolate/FoundationAdditions/NSArray+TDTRangeAdditions.h>

@interface NSArray_TDTRangeAdditions_Tests : XCTestCase

@end

@implementation NSArray_TDTRangeAdditions_Tests

- (void)testRangeTo {
  NSArray *array = [NSArray randomArrayOfLength:3];
  NSUInteger index = 2;
  NSRange rangeTo = [array rangeToIndex:index];
  XCTAssertEqual(rangeTo.location, (NSUInteger)0);
  XCTAssertEqual(rangeTo.length, index);
}

- (void)testRangeFrom {
  NSUInteger length = 5;
  NSArray *array = [NSArray randomArrayOfLength:length];
  NSUInteger index = 2;
  NSRange rangeTo = [array rangeFromIndex:index];
  XCTAssertEqual(rangeTo.location, index);
  XCTAssertEqual(rangeTo.length, length - index);
}

@end

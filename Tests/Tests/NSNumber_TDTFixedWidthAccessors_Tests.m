#import <XCTest/XCTest.h>
#import <TDTChocolate/TDTFoundationAdditions.h>

@interface NSNumber_TDTFixedWidthAccessors_Tests : XCTestCase

@end

@implementation NSNumber_TDTFixedWidthAccessors_Tests

- (void)test32BitInts {
  int32_t original = INT32_MAX;
  NSNumber *it = @(original);
  int32_t res = [it tdt_int32Value];
  XCTAssertEqual(res, original);
}

- (void)test64BitInts {
  int64_t original = INT64_MAX;
  NSNumber *it = @(original);
  int64_t res = [it tdt_int64Value];
  XCTAssertEqual(res, original);
}

@end

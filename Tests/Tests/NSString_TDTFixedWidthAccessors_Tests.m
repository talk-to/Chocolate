#import <XCTest/XCTest.h>
#import <TDTChocolate/TDTFoundationAdditions.h>

@interface NSString_TDTFixedWidthAccessors_Tests : XCTestCase

@end

@implementation NSString_TDTFixedWidthAccessors_Tests

- (void)test32BitInts {
  int32_t original = INT32_MAX;
  NSString *it = [NSString stringWithFormat:@"%@", @(original)];
  int32_t res = [it tdt_int32Value];
  XCTAssertEqual(res, original);
}

- (void)test64BitInts {
  int64_t original = INT64_MAX;
  NSString *it = [NSString stringWithFormat:@"%@", @(original)];
  int64_t res = [it tdt_int64Value];
  XCTAssertEqual(res, original);
}

@end

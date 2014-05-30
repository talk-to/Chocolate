#import <XCTest/XCTest.h>
#import <TDTChocolate/TDTFoundationAdditions.h>
#import <TDTChocolate/TDTTestingAdditions.h>

@interface NSDictionary_TDTMerging_Tests : XCTestCase

@end

@implementation NSDictionary_TDTMerging_Tests

- (void)testItRetainsOriginalEntries {
  NSString *key = [NSString tdt_randomString];
  NSString *value = [NSString tdt_randomString];
  NSDictionary *original = @{key: value};
  NSDictionary *arg = [NSDictionary tdt_randomDictionary];
  NSDictionary *res = [original tdt_dictionaryByMergingDictionary:arg];

  XCTAssertEqual(value, res[key]);
}

- (void)testItAddsEntries {
  NSString *key = [NSString tdt_randomString];
  NSString *value = [NSString tdt_randomString];
  NSDictionary *original = [NSDictionary tdt_randomDictionary];
  NSDictionary *arg = @{key: value};
  NSDictionary *res = [original tdt_dictionaryByMergingDictionary:arg];

  XCTAssertEqual(value, res[key]);
}

@end

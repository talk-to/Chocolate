#import <XCTest/XCTest.h>
#import <TDTChocolate/TDTFoundationAdditions.h>
#import <TDTChocolate/TDTTestingAdditions.h>

@interface NSDictionary_TDTAdditions_Tests : XCTestCase

@end

@implementation NSDictionary_TDTAdditions_Tests

- (void)testItRetainsOriginalEntries {
  NSString *key = [NSString tdt_randomString];
  NSString *value = [NSString tdt_randomString];
  NSDictionary *receiver = @{key: value};
  NSDictionary *arg = [NSDictionary tdt_randomDictionary];
  NSDictionary *res = [receiver tdt_dictionaryByMergingDictionary:arg];

  XCTAssertEqual(value, res[key]);
}

- (void)testItAddsEntries {
  NSString *key = [NSString tdt_randomString];
  NSString *value = [NSString tdt_randomString];
  NSDictionary *receiver = [NSDictionary tdt_randomDictionary];
  NSDictionary *arg = @{key: value};
  NSDictionary *res = [receiver tdt_dictionaryByMergingDictionary:arg];

  XCTAssertEqual(value, res[key]);
}

- (void)testForSameKeyItUsesValueFromTheArgumentDictionary {
  NSString *key = [NSString tdt_randomString];
  NSString *value = [NSString tdt_randomString];
  NSDictionary *receiver = @{key: [NSString tdt_randomString]};
  NSDictionary *arg = @{key: value};
  NSDictionary *res = [receiver tdt_dictionaryByMergingDictionary:arg];

  XCTAssertEqual(value, res[key]);
}

- (void)testItRemovesExistingKey {
  NSDictionary *dict = @{ @"key": @"value" };
  NSDictionary *result = [dict tdt_dictionaryByRemovingEntryForKey:@"key"];
  XCTAssertEqualObjects(@{}, result);
}

- (void)testDictionaryNotChangedIfKeyDoesNotExist {
  NSDictionary *dict = @{ @"key": @"value" };
  NSDictionary *result = [dict tdt_dictionaryByRemovingEntryForKey:@"not-key"];
  XCTAssertEqualObjects(dict, result);
}

@end

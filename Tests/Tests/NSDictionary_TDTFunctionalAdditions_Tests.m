#import <XCTest/XCTest.h>
#import <TDTChocolate/TDTFoundationAdditions.h>
#import <TDTChocolate/TDTTestingAdditions.h>

static TDTMapBlock identity = ^id(id value) {
  return value;
};

@interface NSDictionary_TDTFunctionalAdditions_Tests : XCTestCase

@end

@implementation NSDictionary_TDTFunctionalAdditions_Tests

- (void)testValueMapOfEmptyDictionary {
  NSDictionary *receiver = @{};
  NSDictionary *result = [receiver tdt_dictionaryByMappingValuesWithBlock:identity];
  XCTAssertEqualObjects(receiver, result);
}

- (void)testValueMapWithIdentity {
  NSDictionary *receiver = [NSDictionary tdt_randomDictionary];
  NSDictionary *result = [receiver tdt_dictionaryByMappingValuesWithBlock:identity];
  XCTAssertEqualObjects(receiver, result);
}

- (void)testValueMapWithTransformation {
  NSString *key = [NSString tdt_randomString];
  NSDictionary *receiver = @{ key: @(10) };
  NSDictionary *result = [receiver tdt_dictionaryByMappingValuesWithBlock:^id(id value) {
    return @([value intValue] + 1);
  }];
  XCTAssertEqualObjects(@(11), result[key]);
}

- (void)testEntryMapWithTransformation {
  NSDictionary *receiver = @{ @(1): @(2), @(2): @(3) };
  NSArray *result = [receiver tdt_arrayByMappingEntriesWithBlock:^id(NSNumber *key, NSNumber *value) {
    return @([key unsignedIntegerValue] + [value unsignedIntegerValue]);
  }];
  TDTXCTAssertContains(result, @(3));
  TDTXCTAssertContains(result, @(5));
}

@end
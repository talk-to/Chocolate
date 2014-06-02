#import <XCTest/XCTest.h>
#import <TDTChocolate/TDTFoundationAdditions.h>
#import <TDTChocolate/TDTTestingAdditions.h>

static TDTMapBlock identity = ^id(id value) {
  return value;
};

@interface NSDictionary_TDTFunctionalAdditions_Tests : XCTestCase

@end

@implementation NSDictionary_TDTFunctionalAdditions_Tests

- (void)testMapOfEmptyDictionary {
  NSDictionary *receiver = @{};
  NSDictionary *result = [receiver tdt_dictionaryByMappingValuesWithBlock:identity];
  XCTAssertEqualObjects(receiver, result);
}

- (void)testMapWithIdentity {
  NSDictionary *receiver = [NSDictionary tdt_randomDictionary];
  NSDictionary *result = [receiver tdt_dictionaryByMappingValuesWithBlock:identity];
  XCTAssertEqualObjects(receiver, result);
}

- (void)testMapWithTransformation {
  NSString *key = [NSString tdt_randomString];
  NSDictionary *receiver = @{ key: @(10) };
  NSDictionary *result = [receiver tdt_dictionaryByMappingValuesWithBlock:^id(id value) {
    return @([value intValue] + 1);
  }];
  XCTAssertEqualObjects(@(11), result[key]);
}

@end
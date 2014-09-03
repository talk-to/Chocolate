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

- (void)testWritesInBinaryFormat {
  // A suitable candidate to test that the file was indeed written in the
  // binary format is to use an NSDate value, because the fractional part of
  // dates are truncated in the XML format.
  NSDate *date = [NSDate dateWithTimeIntervalSince1970:1.25];
  NSDictionary *dict = @{@"date": date};

  [[NSFileManager defaultManager] tdt_withTemporaryPath:^(NSString *path) {
    [dict tdt_writeInBinaryFormatToFile:path atomically:YES];
    NSDictionary *result = [NSDictionary dictionaryWithContentsOfFile:path];
    XCTAssertEqualWithAccuracy(1.25, [result[@"date"] timeIntervalSince1970], 0.01);
  }];
}

@end

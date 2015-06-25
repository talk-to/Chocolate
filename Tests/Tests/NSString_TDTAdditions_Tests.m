#import <XCTest/XCTest.h>
#import <TDTChocolate/TDTTestingAdditions.h>
#import <TDTChocolate/FoundationAdditions/NSString+TDTAdditions.h>
#import <TDTChocolate/FoundationAdditions/NSDate+TDTAdditions.h>

@interface NSString_TDTAdditions_Tests : XCTestCase

@end

@implementation NSString_TDTAdditions_Tests

- (void)testRandomUUIDIsNotEmpty {
  NSString *UUID = [NSString tdt_randomUUID];
  XCTAssertTrue(UUID.length > 0);
}

- (void)testNewUUIDIsGeneratedForEachCall {
  XCTAssertNotEqualObjects([NSString tdt_randomUUID], [NSString tdt_randomUUID]);
}

- (void)testStringFromUnsignedIntegerConstruction {
  XCTAssertEqualObjects([NSString tdt_stringWithUnsignedInteger:0], @"0");
  XCTAssertEqualObjects([NSString tdt_stringWithUnsignedInteger:42], @"42");
  XCTAssertEqualObjects([NSString tdt_stringWithUnsignedInteger:100000], @"100000",
                        @"UInt -> String is using localized formatting?");
}

- (void)testStringFromIntegerConstruction {
  XCTAssertEqualObjects([NSString tdt_stringWithInteger:0], @"0");
  XCTAssertEqualObjects([NSString tdt_stringWithInteger:1], @"1");
  XCTAssertEqualObjects([NSString tdt_stringWithInteger:-1], @"-1");

  XCTAssertEqualObjects([NSString tdt_stringWithInteger:100000], @"100000",
                        @"UInt -> String is using localized formatting?");
}

- (void)testStringFromBOOLConstruction {
  XCTAssertEqualObjects([NSString tdt_stringWithBOOL:NO], @"NO");
  XCTAssertEqualObjects([NSString tdt_stringWithBOOL:YES], @"YES");
}

- (void)testSHA1SumIsCorrectlyCalculated {
  NSString *testString = @"interesting";
  // $ shasum <(echo -n "interesting")
  NSString *SHA1Digest = @"68f55551796668375c528bd96b0d0fbc847bd123";
  XCTAssertEqualObjects([testString tdt_SHA1Digest], SHA1Digest);
}

- (void)testSHA1SumForUnicodeCharacters {
  NSString *receiver = @"🐶";
  // $ shasum <(echo -n "🐶")
  NSString *expected = @"e00b00d657dfa936551432f4c4563ea4d08b2cbb";
  XCTAssertEqualObjects(expected, [receiver tdt_SHA1Digest]);
}

- (void)testStringByTrimmingWhitespaceAndNewline {
  NSString *empty = @"";
  XCTAssertEqualObjects([empty tdt_stringByTrimmingWhitespaceAndNewlines], empty);
  XCTAssertEqualObjects([@" prefix" tdt_stringByTrimmingWhitespaceAndNewlines], @"prefix");
  XCTAssertEqualObjects([@" suffix" tdt_stringByTrimmingWhitespaceAndNewlines], @"suffix");
  XCTAssertEqualObjects([@" both  " tdt_stringByTrimmingWhitespaceAndNewlines], @"both");
  XCTAssertEqualObjects([@"\n newlinesANDspaces\n\n  " tdt_stringByTrimmingWhitespaceAndNewlines], @"newlinesANDspaces");
}

- (void)testStringByTrimmingNonAlphaNumericCharacters {
  XCTAssertEqualObjects(@"HOME",
                        [@"#@HOME#@" tdt_stringByTrimmingNonAlphaNumericCharacters]);
  XCTAssertEqualObjects(@"iPhone",
                        [@"--iPhone--" tdt_stringByTrimmingNonAlphaNumericCharacters]);
  XCTAssertEqualObjects(@"WORK",
                        [@"+__WORK!!__" tdt_stringByTrimmingNonAlphaNumericCharacters]);
}

- (void)testBlanksShouldBeNilled {
  XCTAssertNil([@"" tdt_stringByNillingBlanks]);
}

- (void)testNonBlanksShouldBePassedUnchanged {
  NSString *nonBlankString = [NSString tdt_randomString];
  XCTAssertEqualObjects([nonBlankString tdt_stringByNillingBlanks], nonBlankString);
}

- (void)testContainsString {
  NSString *s = [NSString tdt_randomString];
  XCTAssertFalse(NO);
  XCTAssertTrue([s tdt_containsString:s]);
  NSString *wrapper = [NSString stringWithFormat:@"--%@--", s];
  XCTAssertTrue([wrapper tdt_containsString:s]);
  NSString *empty = @"";
  XCTAssertFalse([empty tdt_containsString:s]);
}

- (void)testDataWithUTF8Encoding {
  NSString *s = [NSString tdt_randomString];
  XCTAssertEqualObjects([s tdt_dataUsingUTF8Encoding], [s dataUsingEncoding:NSUTF8StringEncoding]);
}

- (void)testIsNonEmpty {
  XCTAssertTrue([[NSString tdt_randomString] tdt_isNonEmpty]);
  XCTAssertFalse([@"" tdt_isNonEmpty]);
}

- (void)testNumbersAreConverted {
  NSNumber *randomNumber = [NSNumber tdt_randomNumber];
  NSUInteger value = [randomNumber unsignedIntegerValue];
  NSString *s = [NSString tdt_stringWithUnsignedInteger:value];
  XCTAssertEqual([s tdt_unsignedIntegerValue], value);
}

- (void)testBiggestNumberIsConverted {
  NSString *bigNumberString = [NSString tdt_stringWithUnsignedInteger:NSUIntegerMax];
  XCTAssertEqual([bigNumberString tdt_unsignedIntegerValue], (NSUInteger)NSUIntegerMax);
}

- (void)testOutOfRangeNumbersAreClamped {
  // This value is derived from `NSUIntegerMax` for 64-bit systems.
  NSString *outOfRangeNumberString = @"20000000000000000000";
  XCTAssertEqual([outOfRangeNumberString tdt_unsignedIntegerValue], (NSUInteger)NSUIntegerMax);
}

- (void)testRemovalOfCharactersInSet {
  NSString *receiver = @"...a.b.c.d....";
  NSCharacterSet *characters = [NSCharacterSet characterSetWithCharactersInString:@"."];
  NSString *result = [receiver tdt_stringByRemovingCharacters:characters];
  XCTAssertEqualObjects(@"abcd", result);
}

- (void)testStringsWithoutRemovalCharacterAreKeptIntact {
  NSString *receiver = @"x";
  NSCharacterSet *characters = [NSCharacterSet whitespaceAndNewlineCharacterSet];
  NSString *result = [receiver tdt_stringByRemovingCharacters:characters];
  XCTAssertEqualObjects(receiver, result);
}

- (void)testIsValidEmail {
  XCTAssertTrue([@"abc@def.com" tdt_isEmail]);
  XCTAssertTrue([@"abc@def..com" tdt_isEmail]);
  XCTAssertTrue([@"abcDef@ghi.com" tdt_isEmail]);
}

- (void)testIsInvalidEmail {
  XCTAssertFalse([@"abc" tdt_isEmail]);
  XCTAssertFalse([@"abc.com" tdt_isEmail]);
  XCTAssertFalse([@"abc@" tdt_isEmail]);
  XCTAssertFalse([@"abc@def." tdt_isEmail]);
}

- (void)testIsBlank {
  XCTAssertTrue([@" \n\t" tdt_isBlankAfterTrimmingWhitespaces]);
  XCTAssertFalse([@" non blank string" tdt_isBlankAfterTrimmingWhitespaces]);
}

@end

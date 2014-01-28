#import <XCTest/XCTest.h>
#import <TDTChocolate/TDTTestingAdditions.h>
#import <TDTChocolate/FoundationAdditions/NSString+TDTAdditions.h>

@interface NSString_TDTAdditions_Tests : XCTestCase

@end

@implementation NSString_TDTAdditions_Tests

- (void)testRandomUUIDIsNotEmpty {
  NSString *UUID = [NSString randomUUID];
  XCTAssertTrue(UUID.length > 0);
}

- (void)testNewUUIDIsGeneratedForEachCall {
  XCTAssertNotEqualObjects([NSString randomUUID], [NSString randomUUID]);
}

- (void)testStringFromUIntegerConstruction {
  XCTAssertEqualObjects([NSString stringWithUnsignedInteger:0], @"0");
  XCTAssertEqualObjects([NSString stringWithUnsignedInteger:42], @"42");
  XCTAssertEqualObjects([NSString stringWithUnsignedInteger:100000], @"100000",
                        @"UInt -> String is using localized formatting?");
}

- (void)testStringFromBOOLConstruction {
  XCTAssertEqualObjects([NSString stringWithBOOL:NO], @"NO");
  XCTAssertEqualObjects([NSString stringWithBOOL:YES], @"YES");
}

- (void)testSHA1SumIsCorrectlyCalculated {
  NSString *testString = @"interesting";
  // $ shasum <(echo -n "interesting")
  NSString *SHA1Digest = @"68f55551796668375c528bd96b0d0fbc847bd123";
  XCTAssertEqualObjects([testString SHA1Digest], SHA1Digest);
}

- (void)testStringByTrimmingWhitespaceAndNewline {
  NSString *empty = @"";
  XCTAssertEqualObjects([empty stringByTrimmingWhitespaceAndNewlines], empty);
  XCTAssertEqualObjects([@" prefix" stringByTrimmingWhitespaceAndNewlines], @"prefix");
  XCTAssertEqualObjects([@" suffix" stringByTrimmingWhitespaceAndNewlines], @"suffix");
  XCTAssertEqualObjects([@" both  " stringByTrimmingWhitespaceAndNewlines], @"both");
  XCTAssertEqualObjects([@"\n newlinesANDspaces\n\n  " stringByTrimmingWhitespaceAndNewlines], @"newlinesANDspaces");
}

- (void)testStringByTrimmingNonAlphaNumericCharacters {
  XCTAssertEqualObjects(@"HOME",
                        [@"#@HOME#@" stringByTrimmingNonAlphaNumericCharacters]);
  XCTAssertEqualObjects(@"iPhone",
                        [@"--iPhone--" stringByTrimmingNonAlphaNumericCharacters]);
  XCTAssertEqualObjects(@"WORK",
                        [@"+__WORK!!__" stringByTrimmingNonAlphaNumericCharacters]);
}

- (void)testBlanksShouldBeNilled {
  XCTAssertNil([@"" stringByNillingBlanks]);
}

- (void)testNonBlanksShouldBePassedUnchanged {
  NSString *nonBlankString = [NSString randomString];
  XCTAssertEqualObjects([nonBlankString stringByNillingBlanks], nonBlankString);
}

- (void)testContainsString {
  NSString *s = [NSString randomString];
  XCTAssertFalse(NO);
  XCTAssertTrue([s containsString:s]);
  NSString *wrapper = [NSString stringWithFormat:@"--%@--", s];
  XCTAssertTrue([wrapper containsString:s]);
  NSString *empty = @"";
  XCTAssertFalse([empty containsString:s]);
}

- (void)testDataWithUTF8Encoding {
  NSString *s = [NSString randomString];
  XCTAssertEqualObjects([s dataUsingUTF8Encoding], [s dataUsingEncoding:NSUTF8StringEncoding]);
}

- (void)testIsNonEmpty {
  XCTAssertTrue([[NSString randomString] isNonEmpty]);
  XCTAssertFalse([@"" isNonEmpty]);
}

- (void)testNumbersAreConverted {
  NSNumber *randomNumber = [NSNumber randomNumber];
  NSUInteger value = [randomNumber unsignedIntegerValue];
  NSString *s = [NSString stringWithUnsignedInteger:value];
  XCTAssertEqual([s unsignedIntegerValue], value);
}

- (void)testBiggestNumberIsConverted {
  NSString *bigNumberString = [NSString stringWithUnsignedInteger:NSUIntegerMax];
  STAssertEquals([bigNumberString unsignedIntegerValue], (NSUInteger)NSUIntegerMax, nil);
}

- (void)testOutOfRangeNumbersAreClamped {
  NSString *outOfRangeNumberString = @"5000000000";
  STAssertEquals([outOfRangeNumberString unsignedIntegerValue], (NSUInteger)NSUIntegerMax, nil);
}

@end

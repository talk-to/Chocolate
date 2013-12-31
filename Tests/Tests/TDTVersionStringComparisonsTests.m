#import <XCTest/XCTest.h>
#import <TDTChocolate/FoundationAdditions/TDTVersionStringComparisons.h>

@interface TDTVersionStringComparisonsTests : XCTestCase

@end

@implementation TDTVersionStringComparisonsTests

- (void)testCompareWithEqualVersion {
  XCTAssertEqual(TDTCompareVersionStrings(@"1.0.0.2", @"1.0.0.2"), NSOrderedSame);
}

- (void)testCompareWithLesserVersion {
  XCTAssertEqual(TDTCompareVersionStrings(@"1.0.0.2", @"1.0.0.1"), NSOrderedDescending);
  XCTAssertEqual(TDTCompareVersionStrings(@"2.10.0.6", @"2.9.1.32"), NSOrderedDescending);
}

- (void)testCompareWithLesserIncompleteVersion {
  XCTAssertEqual(TDTCompareVersionStrings(@"1.0.0.2", @"1.0.0"), NSOrderedDescending);
}

- (void)testCompareWithGreaterVersion {
  XCTAssertEqual(TDTCompareVersionStrings(@"1.0.0.2", @"1.0.3.1"), NSOrderedAscending);
}

- (void)testCompareWithGreaterIncompleteVersion {
  XCTAssertEqual(TDTCompareVersionStrings(@"1.0.1.2", @"1.0.2"), NSOrderedAscending);
}

- (void)testCompareWithEqualVersionUsingIgnorableSeparator {
  XCTAssertEqual(TDTCompareVersionStrings(@"1.0.1", @"1.0.1_foo"), NSOrderedSame);
  XCTAssertEqual(TDTCompareVersionStrings(@"1.0.1", @"1.0.1-foo"), NSOrderedSame);
  XCTAssertEqual(TDTCompareVersionStrings(@"1.0.1", @"1.0.1-foo_bar"), NSOrderedSame);
}

- (void)testCompareWithLesserVersionUsingIgnorableSeparator {
  XCTAssertEqual(TDTCompareVersionStrings(@"1.0.2", @"1.0.1_foo"), NSOrderedDescending);
  XCTAssertEqual(TDTCompareVersionStrings(@"1.0.2", @"1.0.1-foo"), NSOrderedDescending);
  XCTAssertEqual(TDTCompareVersionStrings(@"1.0.2", @"1.0.1-foo_bar"), NSOrderedDescending);
}

- (void)testCompareWithGreaterVersionUsingIgnorableSeparator {
  XCTAssertEqual(TDTCompareVersionStrings(@"1.0.2", @"1.0.3_foo"), NSOrderedAscending);
  XCTAssertEqual(TDTCompareVersionStrings(@"1.0.2", @"1.0.3-foo"), NSOrderedAscending);
  XCTAssertEqual(TDTCompareVersionStrings(@"1.0.2", @"1.0.3-foo_bar"), NSOrderedAscending);
}

@end

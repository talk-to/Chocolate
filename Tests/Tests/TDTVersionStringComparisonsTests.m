#import <XCTest/XCTest.h>
#import <TDTChocolate/FoundationAdditions/NSString+TDTVersionComparison.h>

@interface TDTVersionStringComparisonsTests : XCTestCase

@end

@implementation TDTVersionStringComparisonsTests

- (void)testCompareWithEqualVersion {
  XCTAssertEqual([@"1.0.0.2" versionCompare:@"1.0.0.2"], NSOrderedSame);
}

- (void)testCompareWithLesserVersion {
  XCTAssertEqual([@"1.0.0.2" versionCompare:@"1.0.0.1"], NSOrderedDescending);
  XCTAssertEqual([@"2.10.0.6" versionCompare:@"2.9.1.32"], NSOrderedDescending);
}

- (void)testCompareWithLesserIncompleteVersion {
  XCTAssertEqual([@"1.0.0.2" versionCompare:@"1.0.0"], NSOrderedDescending);
}

- (void)testCompareWithGreaterVersion {
  XCTAssertEqual([@"1.0.0.2" versionCompare:@"1.0.3.1"], NSOrderedAscending);
}

- (void)testCompareWithGreaterIncompleteVersion {
  XCTAssertEqual([@"1.0.1.2" versionCompare:@"1.0.2"], NSOrderedAscending);
}

- (void)testCompareWithEqualVersionUsingIgnorableSeparator {
  XCTAssertEqual([@"1.0.1" versionCompare:@"1.0.1_foo"], NSOrderedSame);
  XCTAssertEqual([@"1.0.1" versionCompare:@"1.0.1-foo"], NSOrderedSame);
  XCTAssertEqual([@"1.0.1" versionCompare:@"1.0.1-foo_bar"], NSOrderedSame);
}

- (void)testCompareWithLesserVersionUsingIgnorableSeparator {
  XCTAssertEqual([@"1.0.2" versionCompare:@"1.0.1_foo"], NSOrderedDescending);
  XCTAssertEqual([@"1.0.2" versionCompare:@"1.0.1-foo"], NSOrderedDescending);
  XCTAssertEqual([@"1.0.2" versionCompare:@"1.0.1-foo_bar"], NSOrderedDescending);
}

- (void)testCompareWithGreaterVersionUsingIgnorableSeparator {
  XCTAssertEqual([@"1.0.2" versionCompare:@"1.0.3_foo"], NSOrderedAscending);
  XCTAssertEqual([@"1.0.2" versionCompare:@"1.0.3-foo"], NSOrderedAscending);
  XCTAssertEqual([@"1.0.2" versionCompare:@"1.0.3-foo_bar"], NSOrderedAscending);
}

@end

#import <XCTest/XCTest.h>
#import <TDTChocolate/FoundationAdditions/TDTNSStringExtendedComparison.h>
#import <TDTChocolate/TDTTestingAdditions.h>

@interface TDTNSStringExtendedComparisonTests : XCTestCase
@property (nonatomic, copy) NSString *empty;
@property (nonatomic, copy) NSString *whitespaceAndNewlineOnly;
@end

@implementation TDTNSStringExtendedComparisonTests

- (void)setUp {
  [super setUp];
  self.empty = @"";
  self.whitespaceAndNewlineOnly = @"   \n       ";
}

- (void)tearDown {
  self.whitespaceAndNewlineOnly = nil;
  self.empty = nil;
  [super tearDown];
}

- (void)testNilMatchesNil {
  XCTAssertTrue(TDTNSStringEqualToStringExtended(self.empty, nil));
  XCTAssertTrue(TDTNSStringEqualToStringExtended(nil, self.empty));
}

- (void)testEmptyMatchesNil {
  XCTAssertTrue(TDTNSStringEqualToStringExtended(self.empty, nil));
  XCTAssertTrue(TDTNSStringEqualToStringExtended(nil, self.empty));
}

- (void)testWhitespaceIsIgnored {
  XCTAssertTrue(TDTNSStringEqualToStringExtended(self.empty,
                                                 self.whitespaceAndNewlineOnly));
  XCTAssertTrue(TDTNSStringEqualToStringExtended(self.whitespaceAndNewlineOnly,
                                                 self.empty));
}

- (void)testWhitespaceIsIgnoredWhenMatchingNil {
  XCTAssertTrue(TDTNSStringEqualToStringExtended(self.whitespaceAndNewlineOnly,
                                                 nil));
  XCTAssertTrue(TDTNSStringEqualToStringExtended(nil,
                                                 self.whitespaceAndNewlineOnly));
}

- (void)testNormalEqualityRemainsUnchanged {
  NSString *x = [NSString tdt_randomString];
  NSString *y = [NSString tdt_randomString];
  XCTAssertTrue(TDTNSStringEqualToStringExtended(x, x));
  XCTAssertFalse(TDTNSStringEqualToStringExtended(x, y));
}

@end

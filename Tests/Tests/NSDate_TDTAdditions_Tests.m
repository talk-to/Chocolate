#import <XCTest/XCTest.h>
#import <TDTChocolate/FoundationAdditions/NSDate+TDTAdditions.h>

@interface NSDate_TDTAdditions_Tests : XCTestCase

@end

@implementation NSDate_TDTAdditions_Tests

- (void)testMillisecondsSinceEpochAreZeroForEpoch {
  XCTAssertEqual([[NSDate dateWithTimeIntervalSince1970:0] tdt_millisecondsSinceEpoch],
                 (int64_t)0);
}

- (void)testMillisecondsSinceEpochAreSameAsTimeIntervalInSeconds {
  int64_t seconds = 100;
  XCTAssertEqual([[NSDate dateWithTimeIntervalSince1970:seconds] tdt_millisecondsSinceEpoch],
                 (int64_t)(seconds * 1000));
}

@end

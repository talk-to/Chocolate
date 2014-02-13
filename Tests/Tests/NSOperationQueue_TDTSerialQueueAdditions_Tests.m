#import <XCTest/XCTest.h>
#import <TDTChocolate/FoundationAdditions/NSOperationQueue+TDTSerialQueueAdditions.h>

@interface NSOperationQueue_TDTSerialQueueAdditions_Tests : XCTestCase

@end

@implementation NSOperationQueue_TDTSerialQueueAdditions_Tests

- (void)testSerialQueueAdditionsAreInternallyConsistent {
  XCTAssertTrue([[NSOperationQueue tdt_serialOperationQueue] tdt_isSerial]);
}

@end

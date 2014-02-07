#import <XCTest/XCTest.h>
#import <TDTChocolate/FoundationAdditions/NSOperationQueue+TDTScheduling.h>
#import <TDTChocolate/TDTTestingAdditions.h>

static NSTimeInterval VeryShortTimeInterval = 1e-4;

@interface NSOperationQueue_TDTScheduling_Tests : XCTestCase

@end

@implementation NSOperationQueue_TDTScheduling_Tests

- (void)testItRunsScheduledOperationAfterSpecifiedDelay {
  NSOperationQueue *it = [NSOperationQueue mainQueue];
  __block BOOL operationCompleted = NO;
  [it scheduleAfterDelay:VeryShortTimeInterval
               operation:[NSBlockOperation blockOperationWithBlock:^{
    operationCompleted = YES;
  }]];
  XCTAssertFalse(operationCompleted);
  [[NSRunLoop currentRunLoop] runUntilCompletionIndicator:&operationCompleted];
  XCTAssertTrue(operationCompleted);
}

- (void)testItIsNotRetainedByAScheduledOperation {
  NSOperationQueue *it = [[NSOperationQueue alloc] init];
  [it scheduleAfterDelay:TDTNSTimeIntervalInfinity
               operation:[NSBlockOperation blockOperationWithBlock:^{
    XCTFail();
  }]];
  __weak typeof (it) weakIt = it;
  it = nil;
  XCTAssertNil(weakIt);
}

@end

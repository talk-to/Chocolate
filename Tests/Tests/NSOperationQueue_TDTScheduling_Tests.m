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
  NSOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
    operationCompleted = YES;
  }];
  [it tdt_addOperation:operation
            afterDelay:VeryShortTimeInterval];
  [[NSRunLoop currentRunLoop] runUntilTimeout:(VeryShortTimeInterval/2)];
  XCTAssertFalse(operationCompleted);
  [[NSRunLoop currentRunLoop] runUntilCompletionIndicator:&operationCompleted];
  XCTAssertTrue(operationCompleted);
}

- (void)testItIsNotRetainedByAScheduledOperation {
  NSOperationQueue *it = [[NSOperationQueue alloc] init];
  NSOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
    XCTFail();
  }];
  [it tdt_addOperation:operation afterDelay:TDTNSTimeIntervalInfinity];
  __weak typeof (it) weakIt = it;
  it = nil;
  XCTAssertNil(weakIt);
}

@end

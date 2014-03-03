#import <XCTest/XCTest.h>
#import <TDTChocolate/TestingAdditions/NSRunLoop+TDTAsyncVerification.h>
#import <TDTChocolate/TDTFoundationAdditions.h>

@interface NSRunLoop_TDTAsyncVerification_Tests : XCTestCase

@end

@implementation NSRunLoop_TDTAsyncVerification_Tests

- (void)testRunloopExitsImmediatelyAfterConditionIsSatisfied {
  NSTimeInterval delay = 0.001;
  NSTimeInterval timeout = 1.0;

  __block BOOL condition = NO;
  TDTRunAfterDelay(delay, ^{
    condition = YES;
  });

  NSDate *startDate = [NSDate date];
  [[NSRunLoop currentRunLoop] tdt_runUntilCompletionIndicator:&condition
                                                      timeout:timeout];

  XCTAssertTrue(condition);

  NSTimeInterval elapsedTime = -[startDate timeIntervalSinceNow];
  XCTAssert(elapsedTime > delay);
  XCTAssert(elapsedTime < timeout);
}

@end

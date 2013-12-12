#import <XCTest/XCTest.h>
#import <TDTHotChocolate/TDTTestingAdditions.h>
#import <TDTHotChocolate/FoundationAdditions/TDTBlockAdditions.h>

@interface TDTBlockAdditionsTests : XCTestCase

@end

@implementation TDTBlockAdditionsTests

- (void)testRunOnThreadWithoutWait {
  __block BOOL wasRun = NO;
  TDTRunOnThread([NSThread currentThread], NO, ^{
    wasRun = YES;
  });
  [[NSRunLoop currentRunLoop] runUntilCompletionIndicator:&wasRun];
  XCTAssertTrue(wasRun);
}

- (void)testRunAfterDelay {
  __block BOOL wasRun = NO;
  TDTRunAfterDelay(0.001, ^{
    wasRun = YES;
  });
  [[NSRunLoop currentRunLoop] runUntilCompletionIndicator:&wasRun];
  XCTAssertTrue(wasRun);
}

@end

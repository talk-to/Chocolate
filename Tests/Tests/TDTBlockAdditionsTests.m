#import <XCTest/XCTest.h>
#import <TDTHotChocolate/TDTTestingAdditions.h>
#import <TDTHotChocolate/FoundationAdditions/TDTBlockAdditions.h>

@interface TDTBlockAdditionsTests : XCTestCase

@end

@implementation TDTBlockAdditionsTests

- (void)testExample {
  __block BOOL wasRun = NO;
  TDTRunOnThread([NSThread currentThread], NO, ^{
    wasRun = YES;
  });
  [[NSRunLoop currentRunLoop] runUntilCompletionIndicator:&wasRun];
}

@end

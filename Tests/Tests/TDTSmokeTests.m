
// Certain side effects are hard to verify automatically. For example, logging.
// This class bunches together such tests. The programmer can uncomment the
// #define below to enable them during development to manually observe certain
// changes, but they are disabled in the normal course of things so as to not
// convey a false impression of test coverage when there is none.

//#define SMOKE_TEST

#ifdef SMOKE_TEST

#import <XCTest/XCTest.h>
#import <TDTChocolate/FoundationAdditions/TDTLog.h>
#import <TDTChocolate/FoundationAdditions/NSProcessInfo+TDTTEnvironmentDetection.h>

@interface TDTSmokeTests : XCTestCase

@end

@implementation TDTSmokeTests

- (void)testLogging {
  TDTLogInfo("Why so serious?");
}

- (void)testEnvironmentDetection {
  // One would think that this should return YES when run here -- but this
  // works only when called inside the main application bundle.
  // So we just make sure it does not crash.
  [[NSProcessInfo processInfo] isRunningTests];
}

@end

#endif

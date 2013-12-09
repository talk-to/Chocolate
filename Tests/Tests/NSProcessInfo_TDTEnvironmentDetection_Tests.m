#import <XCTest/XCTest.h>
#import <TDTHotChocolate/RuntimeAdditions/NSProcessInfo+TDTTEnvironmentDetection.h>

@interface NSProcessInfo_TDTEnvironmentDetection_Tests : XCTestCase

@end

@implementation NSProcessInfo_TDTEnvironmentDetection_Tests

- (void)testItDoesNotCrash {
  [[NSProcessInfo processInfo] isRunningTests];
}

@end

#import <XCTest/XCTest.h>
#import <TDTHotChocolate/TDTLog.h>

@interface TDTLogTests : XCTestCase

@end

@implementation TDTLogTests

- (void)testItDoesNotCrash {
  TDTLogInfo("Why so serious?");
}

@end

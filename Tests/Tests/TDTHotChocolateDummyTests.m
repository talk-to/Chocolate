#import <XCTest/XCTest.h>
#import <TDTHotChocolate/TDTHotChocolateDummy.h>

@interface TDTHotChocolateDummyTests : XCTestCase

@end

@implementation TDTHotChocolateDummyTests

- (void)testExample {
  TDTHotChocolateDummy *dummy = [[TDTHotChocolateDummy alloc] init];
  XCTAssertTrue([dummy isYummy], @"");
}

@end

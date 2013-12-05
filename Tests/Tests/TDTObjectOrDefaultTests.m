#import <XCTest/XCTest.h>
#import <TDTHotChocolate/FoundationAdditions/TDTObjectOrDefault.h>

@interface TDTObjectOrDefaultTests : XCTestCase

@end

@implementation TDTObjectOrDefaultTests

- (void)testNilIsReplacedByDefault {
  id defaultValue = @(43);
  XCTAssertEqualObjects(TDTObjectOrDefault(nil, defaultValue), defaultValue);
}

- (void)testNonNilIsUnchanged {
  id object = @(43);
  id defaultValue = @(1);
  XCTAssertEqualObjects(TDTObjectOrDefault(object, defaultValue), object);
}

@end

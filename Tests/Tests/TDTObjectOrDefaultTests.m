#import <XCTest/XCTest.h>
#import <TDTHotChocolate/TDTTestingAdditions.h>
#import <TDTHotChocolate/FoundationAdditions/TDTObjectOrDefault.h>

@interface TDTObjectOrDefaultTests : XCTestCase

@end

@implementation TDTObjectOrDefaultTests

- (void)testNilIsReplacedByDefault {
  id defaultValue = [NSNumber randomNumber];
  XCTAssertEqualObjects(TDTObjectOrDefault(nil, defaultValue), defaultValue);
}

- (void)testNonNilIsUnchanged {
  id object = [NSNumber randomNumber];
  id defaultValue = [NSNumber randomNumber];
  XCTAssertEqualObjects(TDTObjectOrDefault(object, defaultValue), object);
}

@end

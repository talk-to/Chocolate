#import <XCTest/XCTest.h>
#import <TDTChocolate/TDTTestingAdditions.h>
#import <TDTChocolate/FoundationAdditions/TDTObjectOrDefault.h>

@interface TDTObjectOrDefaultTests : XCTestCase

@end

@implementation TDTObjectOrDefaultTests

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

- (void)testNilIsReplacedByDefault {
  id defaultValue = [NSNumber tdt_randomNumber];
  XCTAssertEqualObjects(TDTObjectOrDefault(nil, defaultValue), defaultValue);
}

- (void)testNonNilIsUnchanged {
  id object = [NSNumber tdt_randomNumber];
  id defaultValue = [NSNumber tdt_randomNumber];
  XCTAssertEqualObjects(TDTObjectOrDefault(object, defaultValue), object);
}

#pragma clang diagnostic pop

@end

#import <XCTest/XCTest.h>
#import <TDTChocolate/FoundationAdditions/TDTRandom.h>

@interface TDTRandomTests : XCTestCase

@end

@implementation TDTRandomTests

- (void)testResultOfDefaultGeneratorIsInExpectedRange {
  double result = TDTRandomDouble();
  XCTAssertTrue(result >= 0);
  XCTAssertTrue(result < 1);
}

- (void)testResultOfDefaultGeneratorIsNotAlwaysTheSame {
  double firstResult = TDTRandomDouble();
  double secondResult = TDTRandomDouble();
  XCTAssertNotEqual(firstResult, secondResult);
}

- (void)testResultOfIntervalGeneratorIsInExpectedRange {
  double lowerBound = 10;
  double upperBound = 11;
  double result = TDTRandomDoubleInInterval(lowerBound, upperBound);
  XCTAssertTrue(result >= lowerBound);
  XCTAssertTrue(result < upperBound);
}

@end

#import <XCTest/XCTest.h>
#import <TDTChocolate/FoundationAdditions/NSSet+TDTFunctionalAdditions.h>

@interface NSSet_FunctionalUtils_Tests : XCTestCase

@end

@implementation NSSet_FunctionalUtils_Tests

- (void)testNothingSatisfiesPredicateInEmptySet {
  NSSet *emptySet = [NSSet set];
  TDTPredicateBlock tautology = ^(id obj) { return YES; };
  XCTAssertFalse([emptySet tdt_anyWithBlock:tautology]);
}

- (void)testItReturnsTrueIfAnyElementSatisfiesPredicate {
  NSSet *set = [NSSet setWithArray:@[@34, @3, @4]];
  TDTPredicateBlock predicateMatchingOneElement = ^BOOL (id obj) {
    return ([obj integerValue] == 3);
  };
  TDTPredicateBlock predicateMatchingMultipleElements = ^BOOL (id obj) {
    return ([obj integerValue] > 3);
  };
  TDTPredicateBlock predicateMatchingAllElements = ^BOOL (id obj) {
    return ([obj integerValue] >= 3);
  };
  XCTAssertTrue([set tdt_anyWithBlock:predicateMatchingOneElement]);
  XCTAssertTrue([set tdt_anyWithBlock:predicateMatchingMultipleElements]);
  XCTAssertTrue([set tdt_anyWithBlock:predicateMatchingAllElements]);
}

- (void)testItReturnsFalseIfNoElementSatisfiesPredicate {
  NSSet *set = [NSSet setWithArray:@[@34, @3, @4]];
  TDTPredicateBlock predicateMatchingNoElement = ^BOOL (id obj) {
    return ([obj integerValue] == 44);
  };
  XCTAssertFalse([set tdt_anyWithBlock:predicateMatchingNoElement]);
}

@end

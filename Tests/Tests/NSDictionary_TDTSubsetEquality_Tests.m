#import <XCTest/XCTest.h>
#import <TDTChocolate/TDTFoundationAdditions.h>

#define TDTXCTAssertIsSubset(a, b) \
XCTAssertTrue([(a) tdt_isSubsetOf:(b)], @"Expected %@ to be a subset of %@", (a), (b))

#define TDTXCTAssertIsNotSubset(a, b) \
XCTAssertFalse([(a) tdt_isSubsetOf:(b)], @"Expected %@ to not be a subset of %@", (a), (b))

@interface NSDictionary_TDTPartialStructureEquality_Tests : XCTestCase

@end

@implementation NSDictionary_TDTPartialStructureEquality_Tests

- (void)testOnlyKeysInReceiverAreConsidered {
  NSDictionary *receiver = @{ @"a": @"x" };
  NSDictionary *argument = @{ @"a": @"x", @"b": @"x" };
  TDTXCTAssertIsSubset(receiver, argument);
}

- (void)testKeysInReceiverAreConsidered {
  NSDictionary *receiver = @{ @"a": @"x" };
  NSDictionary *argument = @{ @"a": @"y" };
  TDTXCTAssertIsNotSubset(receiver, argument);
}

- (void)testDictionariesAreRecursivelyConsidered {
  NSDictionary *receiver = @{ @"outer": @{ @"a": @"x" } };
  NSDictionary *argument = @{ @"outer": @{ @"a": @"x", @"b": @"x" } };
  TDTXCTAssertIsSubset(receiver, argument);
}

- (void)testNonDictionaryArraysMustExactlyMatch {
  NSDictionary *receiver = @{ @"a": @[ @(1), @(2) ] };
  NSDictionary *match    = @{ @"a": @[ @(1), @(2) ],       @"b": @[@(3)] };
  NSDictionary *mismatch = @{ @"a": @[ @(1), @(2), @(3) ], @"b": @[@(3)] };
  TDTXCTAssertIsSubset(receiver, match);
  TDTXCTAssertIsNotSubset(receiver, mismatch);
}

- (void)testArraysWithDictionariesAreRecursivelyDescendedByIndex {
  NSDictionary *receiver = @{ @"outer": @[ @{ @"a": @"x" },
                                           @{ @"c": @"y" } ] };
  NSDictionary *argument = @{ @"outer": @[ @{ @"a": @"x", @"b": @"x" },
                                           @{ @"c": @"y", @"d": @"z" } ] };
  TDTXCTAssertIsSubset(receiver, argument);
}

- (void)testLargeNestingIsFollowed {
  NSDictionary *receiver = @{ @"1" : @[ @[ @{ @"2" : @[ @{ @"3": @"go" } ] } ] ] };
  NSDictionary *match    = @{ @"1" : @[ @[ @{ @"2" : @[ @{ @"3": @"go", @"4": @"og" } ] } ] ] };
  NSDictionary *mismatch = @{ @"1" : @[ @[ @{ @"2" : @[ @{ @"3": @"og", @"4": @"og" } ] } ] ] };
  TDTXCTAssertIsSubset(receiver, match);
  TDTXCTAssertIsNotSubset(receiver, mismatch);
}

@end

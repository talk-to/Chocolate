#import <XCTest/XCTest.h>
#import <TDTChocolate/TDTTestingAdditions.h>
#import <TDTChocolate/FoundationAdditions/NSArray+TDTAdditions.h>

@interface NSArray_TDTAdditions_Tests : XCTestCase

@end

@implementation NSArray_TDTAdditions_Tests

- (void)testFlatteningAnEmptyArrayIsEmpty {
  XCTAssertEqualObjects([@[] tdt_flatten], @[]);
}

- (void)testFlatteningAnArrayCreatesANewArrayConsistingOfElementsOfTheNestedArrays {
  NSArray *arrayWithSubarrays = @[@[@"string"], @[@{ @"dict": @(34) }], @[@(23)]];
  NSArray *concatentedSubarrays = @[@"string", @{ @"dict": @(34) }, @(23)];
  XCTAssertEqualObjects([arrayWithSubarrays tdt_flatten], concatentedSubarrays);
}

- (void)testArrayWithNestedDictionariesIsFlattened {
  // This particular test case owes it's existence to an implementation gotcha
  // @unionOfArray.self doesn't work, we need @unionOfArray.@self
  // http://stackoverflow.com/questions/4559427/using-nspredicate-in-2d-arrays/4571917#4571917
  NSDictionary *dict = @{ @"dict": @(34) };
  NSArray *arrayWithDictionary = @[ dict ];
  NSArray *nestedArray = @[ arrayWithDictionary ];
  XCTAssertEqualObjects([nestedArray tdt_flatten], arrayWithDictionary);
}

- (void)testFlatteningIgnoresEmptyArray {
  NSArray *array = @[ @[], @[ @1 ], @[], @[], @[ @2 ], @[] ];
  NSArray *result = @[ @(1), @(2) ];
  XCTAssertEqualObjects([array tdt_flatten], result);
}

- (void)testFlatteningDoesNotWorksRecursively {
  NSArray *array = @[ [NSString tdt_randomString], [NSNumber tdt_randomNumber] ];
  NSArray *nestedArray = @[ array ];
  NSArray *doublyNestedArray = @[ nestedArray ];
  XCTAssertEqualObjects([doublyNestedArray tdt_flatten], nestedArray);
}

- (void)testIsNonEmpty {
  XCTAssertTrue([[NSArray tdt_randomArrayOfLength:1] tdt_isNonEmpty]);
  XCTAssertFalse([@[] tdt_isNonEmpty]);
}

- (void)testOnlyObjectOrNilReturnsNilIfReceiverIsEmpty {
  XCTAssertNil([@[] tdt_onlyObjectOrNil]);
}

- (void)testOnlyObjectOrNilReturnsObjectIfReceiverHasOnlyOneObject {
  id object = [NSString tdt_randomString];
  XCTAssertEqualObjects(object, [@[object] tdt_onlyObjectOrNil]);
}

- (void)testOnlyObjectOrNilReturnsNilIfReceiverHasMoreThanOneObject {
  NSArray *receiver = @[ [NSString tdt_randomString], [NSString tdt_randomString] ];
  XCTAssertNil([receiver tdt_onlyObjectOrNil]);
}

@end

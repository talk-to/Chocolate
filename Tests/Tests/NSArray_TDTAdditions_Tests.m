#import <XCTest/XCTest.h>
#import <TDTHotChocolate/TDTTestingAdditions.h>
#import <TDTHotChocolate/FoundationAdditions/NSArray+TDTAdditions.h>

@interface NSArray_TDTAdditions_Tests : XCTestCase

@end

@implementation NSArray_TDTAdditions_Tests

- (void)testFlatteningAnEmptyArrayIsEmpty {
  XCTAssertEqualObjects([@[] flatten], @[]);
}

- (void)testFlatteningAnArrayCreatesANewArrayConsistingOfElementsOfTheNestedArrays {
  NSArray *arrayWithSubarrays = @[@[@"string"], @[@{ @"dict": @(34) }], @[@(23)]];
  NSArray *concatentedSubarrays = @[@"string", @{ @"dict": @(34) }, @(23)];
  XCTAssertEqualObjects([arrayWithSubarrays flatten], concatentedSubarrays);
}

- (void)testArrayWithNestedDictionariesIsFlattened {
  // This particular test case owes it's existence to an implementation gotcha
  // @unionOfArray.self doesn't work, we need @unionOfArray.@self
  // http://stackoverflow.com/questions/4559427/using-nspredicate-in-2d-arrays/4571917#4571917
  NSDictionary *dict = @{ @"dict": @(34) };
  NSArray *arrayWithDictionary = @[ dict ];
  NSArray *nestedArray = @[ arrayWithDictionary ];
  XCTAssertEqualObjects([nestedArray flatten], arrayWithDictionary);
}

- (void)testFlatteningIgnoresEmptyArray {
  NSArray *array = @[ @[], @[ @1 ], @[], @[], @[ @2 ], @[] ];
  NSArray *result = @[ @(1), @(2) ];
  XCTAssertEqualObjects([array flatten], result);
}

- (void)testFlatteningDoesNotWorksRecursively {
  NSArray *array = @[ [NSString randomString], [NSNumber randomNumber] ];
  NSArray *nestedArray = @[ array ];
  NSArray *doublyNestedArray = @[ nestedArray ];
  XCTAssertEqualObjects([doublyNestedArray flatten], nestedArray);
}

@end

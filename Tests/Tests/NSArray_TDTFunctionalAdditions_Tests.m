#import <XCTest/XCTest.h>
#import <TDTChocolate/TDTTestingAdditions.h>
#import <TDTChocolate/FoundationAdditions/NSArray+TDTFunctionalAdditions.h>

@interface NSArray_TDTFunctionalAdditions_Tests : XCTestCase
@property (nonatomic) SEL identitySelector;
@property (nonatomic, copy) TDTMapBlock identityBlock;
@property (nonatomic) NSArray *emptyArray;
@property (nonatomic) NSArray *nonEmptyArray;
@property (nonatomic, copy) TDTPredicateBlock tautology;
@property (nonatomic, copy) TDTPredicateBlock contradiction;
@end

@implementation NSArray_TDTFunctionalAdditions_Tests

- (void)setUp {
  [super setUp];
  self.identitySelector = @selector(self);
  self.identityBlock = ^(id obj) { return obj; };
  self.emptyArray = @[];
  self.nonEmptyArray = [NSArray tdt_randomArrayOfLength:4];
  self.tautology = ^(id obj) { return YES; };
  self.contradiction = ^(id obj) { return NO; };
}

- (void)tearDown {
  self.contradiction = nil;
  self.tautology = nil;
  self.nonEmptyArray = nil;
  self.emptyArray = nil;
  self.identitySelector = nil;
  self.identityBlock = nil;
  [super tearDown];
}

- (void)testMapOfEmptyArray {
  XCTAssertEqualObjects([self.emptyArray tdt_arrayByMappingWithSelector:self.identitySelector],
                        self.emptyArray);
  XCTAssertEqualObjects([self.emptyArray tdt_arrayByMappingWithBlock:self.identityBlock],
                        self.emptyArray);
}

- (void)testMapOfNonEmptyArray {
  XCTAssertEqualObjects([self.nonEmptyArray tdt_arrayByMappingWithSelector:self.identitySelector],
                        self.nonEmptyArray);
  XCTAssertEqualObjects([self.nonEmptyArray tdt_arrayByMappingWithBlock:self.identityBlock],
                        self.nonEmptyArray);
}

- (void)testMappingTransformsTheArray {
  NSArray *array = @[@"a", @"b"];
  NSArray *expectedResult = @[@"A", @"B"];
  XCTAssertEqualObjects([array tdt_arrayByMappingWithBlock:^id(id obj) {
    return [obj capitalizedString];
  }], expectedResult);
  XCTAssertEqualObjects([array tdt_arrayByMappingWithSelector:@selector(capitalizedString)],
                        expectedResult);
}

- (void)testFirstObjectPassingTestOfEmptyArray {
  id result = [@[] tdt_firstObjectPassingTest:self.tautology];
  XCTAssertNil(result);
}

- (void)testFirstObjectPassingTestOfContradition {
  id result = [@[@1, @2] tdt_firstObjectPassingTest:self.contradiction];
  XCTAssertNil(result);
}

- (void)testFirstObjectPassingTestDoesNotInvokeTestAfterFindingObject {
  __block NSUInteger count = 0;
  [@[@1, @2, @3] tdt_firstObjectPassingTest:^BOOL(id object) {
    count++;
    return YES;
  }];
  XCTAssertEqual(1, count);
}

- (void)testFirstObjectPassingTest {
  id result = [@[@1, @2, @3] tdt_firstObjectPassingTest:^BOOL(id object) {
    return [object integerValue] >= 2;
  }];
  XCTAssertEqualObjects(@2, result);
}

- (void)testSplitOfEmptyArray {
  NSArray *partition = [self.emptyArray tdt_partitionUsingBlock:self.tautology];
  XCTAssertEqual(partition.count, (NSUInteger)2);
  XCTAssertEqualObjects(partition[0], self.emptyArray);
  XCTAssertEqualObjects(partition[1], self.emptyArray);
}

- (void)testOneSidedSplits {
  NSArray *partition;

  partition = [self.nonEmptyArray tdt_partitionUsingBlock:self.tautology];
  XCTAssertEqual(partition.count, (NSUInteger)2);
  XCTAssertEqualObjects(partition[0], self.nonEmptyArray);
  XCTAssertEqualObjects(partition[1], self.emptyArray);

  partition = [self.nonEmptyArray tdt_partitionUsingBlock:self.contradiction];
  XCTAssertEqual(partition.count, (NSUInteger)2);
  XCTAssertEqualObjects(partition[0], self.emptyArray);
  XCTAssertEqualObjects(partition[1], self.nonEmptyArray);
}

- (void)testNormalSplits {
  NSArray *array = @[@"hob", @"nob"];
  NSArray *partition = [array tdt_partitionUsingBlock:^(NSString *obj) {
    return [obj hasPrefix:@"h"];
  }];
  XCTAssertEqual(partition.count, (NSUInteger)2);
  XCTAssertEqualObjects(partition[0], @[@"hob"]);
  XCTAssertEqualObjects(partition[1], @[@"nob"]);
}

- (void)testNothingSatisfiesPredicateInEmptyList {
  XCTAssertFalse([self.emptyArray tdt_anyWithBlock:self.tautology]);
}

- (void)testItReturnsTrueIfAnyElementSatisfiesPredicate {
  NSArray *array = @[@34, @3, @4];
  TDTPredicateBlock predicateMatchingOneElement = ^BOOL (id obj) {
    return ([obj integerValue] == 3);
  };
  TDTPredicateBlock predicateMatchingMultipleElements = ^BOOL (id obj) {
    return ([obj integerValue] > 3);
  };
  TDTPredicateBlock predicateMatchingAllElements = ^BOOL (id obj) {
    return ([obj integerValue] >= 3);
  };
  XCTAssertTrue([array tdt_anyWithBlock:predicateMatchingOneElement]);
  XCTAssertTrue([array tdt_anyWithBlock:predicateMatchingMultipleElements]);
  XCTAssertTrue([array tdt_anyWithBlock:predicateMatchingAllElements]);
}

- (void)testAllWithPredicateSuccess {
  NSArray *receiver = @[@(1), @(2), @(3)];
  BOOL result = [receiver tdt_allWithBlock:^BOOL(NSNumber *number) {
    return ([number unsignedIntegerValue] <= 3);
  }];
  XCTAssertTrue(result);
}

- (void)testAllWithPredicateFailure {
  NSArray *receiver = @[@(1), @(2), @(3)];
  BOOL result = [receiver tdt_allWithBlock:^BOOL(NSNumber *number) {
    return ([number unsignedIntegerValue] < 3);
  }];
  XCTAssertFalse(result);
}

- (void)testItReturnsFalseIfNoElementSatisfiesPredicate {
  NSArray *array = @[@34, @3, @4];
  TDTPredicateBlock predicateMatchingNoElement = ^BOOL (id obj) {
    return ([obj integerValue] == 44);
  };
  XCTAssertFalse([array tdt_anyWithBlock:predicateMatchingNoElement]);
}

- (void)testDictionaryConstructionFromKeyValuePairs {
  NSString *keyOne = [NSString tdt_randomString];
  NSString *valueOne = [NSString tdt_randomString];
  NSString *keyTwo = [NSString tdt_randomString];
  NSString *valueTwo = [NSString tdt_randomString];

  NSArray *receiver = @[@[keyOne, valueOne], @[keyTwo, valueTwo]];
  NSDictionary *result = [receiver tdt_dictionaryFromPairs];

  XCTAssertEqualObjects(valueOne, result[keyOne]);
  XCTAssertEqualObjects(valueTwo, result[keyTwo]);
}

- (void)testCombinedDictionaryConstructionFromKeyValuePairs {
  // [(k1, v1), (k2, v2), (k1, v3)] => [k1: [v1, v3], k2: [v2]]
  NSArray *receiver = @[@[@"k1", @"v1"], @[@"k2", @"v2"], @[@"k1", @"v3"]];
  NSDictionary *expected = @{ @"k1": @[@"v1", @"v3"], @"k2": @[@"v2"] };
  XCTAssertEqualObjects(expected, [receiver tdt_dictionaryFromCombinedPairs]);
}

@end

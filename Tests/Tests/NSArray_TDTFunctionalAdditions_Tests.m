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
  self.nonEmptyArray = [NSArray randomArrayOfLength:4];
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
  XCTAssertEqualObjects([self.emptyArray arrayByMappingWithSelector:self.identitySelector],
                       self.emptyArray);
  XCTAssertEqualObjects([self.emptyArray arrayByMappingWithBlock:self.identityBlock],
                       self.emptyArray);
}

- (void)testMapOfNonEmptyArray {
  XCTAssertEqualObjects([self.nonEmptyArray arrayByMappingWithSelector:self.identitySelector],
                       self.nonEmptyArray);
  XCTAssertEqualObjects([self.nonEmptyArray arrayByMappingWithBlock:self.identityBlock],
                       self.nonEmptyArray);
}

- (void)testMappingTransformsTheArray {
  NSArray *array = @[@"a", @"b"];
  NSArray *expectedResult = @[@"A", @"B"];
  XCTAssertEqualObjects([array arrayByMappingWithBlock:^id(id obj) {
    return [obj capitalizedString];
  }], expectedResult);
  XCTAssertEqualObjects([array arrayByMappingWithSelector:@selector(capitalizedString)],
                       expectedResult);
}

- (void)testSplitOfEmptyArray {
  NSArray *partition = [self.emptyArray partitionUsingBlock:self.tautology];
  XCTAssertEqual(partition.count, (NSUInteger)2);
  XCTAssertEqualObjects(partition[0], self.emptyArray);
  XCTAssertEqualObjects(partition[1], self.emptyArray);
}

- (void)testOneSidedSplits {
  NSArray *partition;

  partition = [self.nonEmptyArray partitionUsingBlock:self.tautology];
  XCTAssertEqual(partition.count, (NSUInteger)2);
  XCTAssertEqualObjects(partition[0], self.nonEmptyArray);
  XCTAssertEqualObjects(partition[1], self.emptyArray);

  partition = [self.nonEmptyArray partitionUsingBlock:self.contradiction];
  XCTAssertEqual(partition.count, (NSUInteger)2);
  XCTAssertEqualObjects(partition[0], self.emptyArray);
  XCTAssertEqualObjects(partition[1], self.nonEmptyArray);
}

- (void)testNormalSplits {
  NSArray *array = @[@"hob", @"nob"];
  NSArray *partition = [array partitionUsingBlock:^(NSString *obj) {
    return [obj hasPrefix:@"h"];
  }];
  XCTAssertEqual(partition.count, (NSUInteger)2);
  XCTAssertEqualObjects(partition[0], @[@"hob"]);
  XCTAssertEqualObjects(partition[1], @[@"nob"]);
}

- (void)testNothingSatisfiesPredicateInEmptyList {
  XCTAssertFalse([self.emptyArray anyWithBlock:self.tautology]);
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
  XCTAssertTrue([array anyWithBlock:predicateMatchingOneElement]);
  XCTAssertTrue([array anyWithBlock:predicateMatchingMultipleElements]);
  XCTAssertTrue([array anyWithBlock:predicateMatchingAllElements]);
}

- (void)testItReturnsFalseIfNoElementSatisfiesPredicate {
  NSArray *array = @[@34, @3, @4];
  TDTPredicateBlock predicateMatchingNoElement = ^BOOL (id obj) {
    return ([obj integerValue] == 44);
  };
  XCTAssertFalse([array anyWithBlock:predicateMatchingNoElement]);
}

@end

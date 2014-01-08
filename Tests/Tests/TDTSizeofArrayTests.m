#import <XCTest/XCTest.h>
#import <TDTChocolate/FoundationAdditions/TDTSizeofArray.h>

@interface TDTSizeofArrayTests : XCTestCase

@end

@implementation TDTSizeofArrayTests

- (void)testItReportsCorrectSizeOfANonEmptyArrayInScope {
  char CArray[] = { 'a', 'b', 'c' };
  size_t size = TDT_SIZEOF_ARRAY(CArray);
  XCTAssertEqual(size, (size_t)3);
}

- (void)testItReportsCorrectSizeOfAnEmptyArrayInScope {
  char CArray[] = { };
  size_t size = TDT_SIZEOF_ARRAY(CArray);
  XCTAssertEqual(size, (size_t)0);
}

@end

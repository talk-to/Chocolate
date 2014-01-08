#import <XCTest/XCTest.h>
#import <TDTChocolate/FoundationAdditions/NSArray+TDTAdditions.h>
#import <TDTChocolate/FoundationAdditions/NSMutableArray+TDTQueueing.h>
#import <TDTChocolate/TDTTestingAdditions.h>

@interface NSMutableArray_TDTQueueing_Tests : XCTestCase

@end

@implementation NSMutableArray_TDTQueueing_Tests

- (void)testEnqueingAndDequeingAreDuals {
  NSMutableArray *array = [[NSMutableArray alloc] init];
  id object = [NSString randomString];
  [array enqueueObject:object];
  XCTAssertEqual([array dequeueObject], object);
  XCTAssertFalse([array isNonEmpty]);
}

@end

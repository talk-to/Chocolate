#import "NSArray+TDTRangeAdditions.h"
#import "TDTAssert.h"

@implementation NSArray (TDTRangeAdditions)

- (NSRange)tdt_rangeToIndex:(NSUInteger)index {
  TDTAssert(index < self.count);
  return NSMakeRange(0, index);
}

- (NSRange)tdt_rangeFromIndex:(NSUInteger)index {
  TDTAssert(index < self.count);
  return NSMakeRange(index, self.count - index);
}

@end

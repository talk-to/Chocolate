#import "NSArray+TDTRangeAdditions.h"
#import "TDTAssert.h"

@implementation NSArray (TDTRangeAdditions)

- (NSRange)rangeToIndex:(NSUInteger)index {
  TDTAssert(index < self.count, nil);
  return NSMakeRange(0, index);
}

- (NSRange)rangeFromIndex:(NSUInteger)index {
  TDTAssert(index < self.count, nil);
  return NSMakeRange(index, self.count - index);
}

@end

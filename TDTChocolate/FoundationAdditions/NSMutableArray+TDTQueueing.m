#import "NSMutableArray+TDTQueueing.h"
#import "NSArray+TDTAdditions.h"
#import "TDTAssert.h"

@implementation NSMutableArray (TDTQueueing)

- (void)tdt_enqueueObject:(id)object {
  TDTParameterAssert(object);
  [self addObject:object];
}

- (id)tdt_dequeueObject {
  TDTParameterAssert([self tdt_isNonEmpty]);
  id object = [self firstObject];
  [self removeObjectAtIndex:0];
  return object;
}

@end

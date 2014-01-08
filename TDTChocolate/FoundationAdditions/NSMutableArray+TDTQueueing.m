#import "NSMutableArray+TDTQueueing.h"
#import "NSArray+TDTAdditions.h"
#import "TDTAssert.h"

@implementation NSMutableArray (TDTQueueing)

- (void)enqueueObject:(id)object {
  TDTParameterAssert(object);
  [self addObject:object];
}

- (id)dequeueObject {
  TDTParameterAssert([self isNonEmpty]);
  id object = [self firstObject];
  [self removeObjectAtIndex:0];
  return object;
}

@end

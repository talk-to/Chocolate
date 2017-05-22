#import "NSArray+TDTAdditions.h"

@implementation NSArray (TDTAdditions)

- (instancetype)tdt_flatten {
  return [self valueForKeyPath:@"@unionOfArrays.@self"];
}

- (BOOL)tdt_isNonEmpty {
  return (self.count > 0);
}

- (id)tdt_onlyObjectOrNil {
  return (self.count == 1) ? [self firstObject] : nil;
}

- (NSArray *)tdt_reversedArray {
  return [[self reverseObjectEnumerator] allObjects];
}

- (NSArray *)tdt_shuffledArray {
  NSMutableArray *mutableArray = [NSMutableArray arrayWithArray:self];
  srandom((unsigned)time(NULL));
  NSUInteger count = mutableArray.count;
  for (NSUInteger i = 0; i < count; ++i) {
    NSUInteger nElements = count - i;
    NSUInteger n = ((NSUInteger)arc4random() % nElements) + i;
    [mutableArray exchangeObjectAtIndex:i withObjectAtIndex:n];
  }
  return mutableArray;
}

@end

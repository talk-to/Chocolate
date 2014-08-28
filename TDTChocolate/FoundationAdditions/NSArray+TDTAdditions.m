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

@end

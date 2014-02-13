#import "NSArray+TDTAdditions.h"

@implementation NSArray (TDTAdditions)

- (instancetype)tdt_flatten {
  return [self valueForKeyPath:@"@unionOfArrays.@self"];
}

- (BOOL)tdt_isNonEmpty {
  return (self.count > 0);
}

@end

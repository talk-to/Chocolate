#import "NSArray+TDTAdditions.h"

@implementation NSArray (TDTAdditions)

- (instancetype)flatten {
  return [self valueForKeyPath:@"@unionOfArrays.@self"];
}

- (BOOL)isNonEmpty {
  return (self.count > 0);
}

@end

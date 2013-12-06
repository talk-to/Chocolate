#import "NSArray+TDTAdditions.h"

@implementation NSArray (TDTAdditions)

- (instancetype)flatten {
  return [self valueForKeyPath:@"@unionOfArrays.@self"];
}

@end

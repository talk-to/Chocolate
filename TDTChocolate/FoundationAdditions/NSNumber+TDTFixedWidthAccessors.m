#import "NSNumber+TDTFixedWidthAccessors.h"

@implementation NSNumber (TDTFixedWidthAccessors)

- (int32_t)tdt_int32Value {
  return [self intValue];
}

- (int64_t)tdt_int64Value {
  return [self longLongValue];
}

@end

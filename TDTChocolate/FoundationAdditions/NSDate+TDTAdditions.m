#import "NSDate+TDTAdditions.h"

@implementation NSDate (TDTAdditions)

- (int64_t)tdt_millisecondsSinceEpoch {
  return (int64_t)floor(self.timeIntervalSince1970 * 1000);
}

@end

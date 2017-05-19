#import "NSDate+TDTAdditions.h"

@implementation NSDate (TDTAdditions)

- (int64_t)tdt_millisecondsSinceEpoch {
  return (int64_t)floor(self.timeIntervalSince1970 * 1000);
}

+ (NSDate *)tdt_dateFromMillisecondsSinceUnixEpoch:(int64_t)millisecondsSinceUnixEpoch {
  NSTimeInterval secondsSinceEpoch = millisecondsSinceUnixEpoch * 1e-3;
  return [NSDate dateWithTimeIntervalSince1970:secondsSinceEpoch];
}

@end

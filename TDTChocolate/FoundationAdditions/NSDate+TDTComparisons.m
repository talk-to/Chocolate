#import "NSDate+TDTComparisons.h"

@implementation NSDate (TDTComparisons)

- (BOOL)tdt_isEarlierThanDate:(NSDate *)date {
  NSParameterAssert(date);
  return ([self compare:date] == NSOrderedAscending);
}

- (BOOL)tdt_isEarlierThanOrEqualToDate:(NSDate *)date {
  NSParameterAssert(date);
  return ([self compare:date] != NSOrderedDescending);
}

@end

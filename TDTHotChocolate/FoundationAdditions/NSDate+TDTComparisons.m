#import "NSDate+TDTComparisons.h"

@implementation NSDate (TDTComparisons)

- (BOOL)isEarlierThanDate:(NSDate *)date {
  NSParameterAssert(date);
  return ([self compare:date] == NSOrderedAscending);
}

- (BOOL)isEarlierThanOrEqualToDate:(NSDate *)date {
  NSParameterAssert(date);
  return ([self compare:date] != NSOrderedDescending);
}

@end

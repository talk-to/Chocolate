#import "NSCalendar+TDTComponents.h"
#import "TDTAssert.h"

@implementation NSCalendar (TDTComponents)

- (NSInteger)tdt_hoursSinceDate:(NSDate *)date {
  TDTParameterAssert(date);
  NSDateComponents *dateComponents = [self components:NSCalendarUnitHour
                                             fromDate:date
                                               toDate:[NSDate date]
                                              options:0];
  return [dateComponents hour];
}

- (NSInteger)tdt_daysSinceDate:(NSDate *)date {
  TDTParameterAssert(date);
  NSDateComponents *dateComponents = [self components:NSCalendarUnitDay
                                             fromDate:date
                                               toDate:[NSDate date]
                                              options:0];
  return [dateComponents day];
}

@end

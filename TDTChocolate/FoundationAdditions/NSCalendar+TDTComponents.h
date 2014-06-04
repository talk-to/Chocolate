#import <Foundation/Foundation.h>

@interface NSCalendar (TDTComponents)

/**
 @return The number of hours that have passed since `date`.
 */
- (NSInteger)tdt_hoursSinceDate:(NSDate *)date;

/**
 @return The number of days that have passed since `date`.
 */
- (NSInteger)tdt_daysSinceDate:(NSDate *)date;

@end

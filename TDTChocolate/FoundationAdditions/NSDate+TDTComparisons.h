#import <Foundation/Foundation.h>

/**
 Wrappers over `[NSDate compare:]` to make comparisons more readable.
 */

@interface NSDate (TDTComparisons)

- (BOOL)tdt_isEarlierThanDate:(NSDate *)date;

- (BOOL)tdt_isEarlierThanOrEqualToDate:(NSDate *)date;

@end

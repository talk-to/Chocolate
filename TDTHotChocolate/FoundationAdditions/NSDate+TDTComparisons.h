#import <Foundation/Foundation.h>

/**
 Simple wrappers over `[NSDate compare:]` to make comparisons more readable.
 */

@interface NSDate (TDTComparisons)

- (BOOL)isEarlierThanDate:(NSDate *)date;

- (BOOL)isEarlierThanOrEqualToDate:(NSDate *)date;

@end

#import <Foundation/Foundation.h>

@interface NSDateFormatter (TDTISO8601Formatting)

/**
 Date Formatter for handling ISO 8601 representation of dates
 (e.g. 2008-01-01T16:20:20.12345Z)

 @return A shared instance of the formatter for ISO 8601 dates
 */
+ (instancetype)tdt_ISO8601Formatter;

@end

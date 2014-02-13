#import "NSDateFormatter+TDTISO8601Formatting.h"

static NSString *const ISO8601DateFormat = @"yyyy'-'MM'-'dd'T'HH':'mm':'ss'.'SSS'Z'";

@implementation NSDateFormatter (TDTISO8601Formatting)

+ (instancetype)tdt_ISO8601Formatter {
  NSDateFormatter *formatter = [[self alloc] init];
  formatter.dateFormat = ISO8601DateFormat;
  formatter.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];
  formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
  return formatter;
}

@end

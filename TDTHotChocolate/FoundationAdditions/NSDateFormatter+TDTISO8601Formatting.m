#import "NSDateFormatter+TDTISO8601Formatting.h"

#define ISO_DATE_FORMAT @"yyyy'-'MM'-'dd'T'HH':'mm':'ss'.'SSS'Z'"

@implementation NSDateFormatter (TDTISO8601Formatting)

+ (instancetype)ISO8601Formatter {
  static dispatch_once_t onceToken;
  static NSDateFormatter *formatter;
  dispatch_once(&onceToken, ^{
    formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = ISO_DATE_FORMAT;
    formatter.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];
    formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
  });
  return formatter;
}

@end

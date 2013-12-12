#import "TDTLog.h"
#import "../FoundationAdditions/NSDateFormatter+TDTISO8601Formatting.h"

void TDTLog(NSString *fmt, ...) {
  va_list args;
  va_start(args, fmt);
  NSString *outStr = [[NSString alloc] initWithFormat:fmt arguments:args];
  NSDate *date = [NSDate date];
  NSDateFormatter *formatter = [NSDateFormatter sharedISO8601Formatter];
  NSString *dateString;
  @synchronized(formatter) {
    dateString = [formatter stringFromDate:date];
  }
  if (fprintf(stderr, "%s %s\n", [dateString UTF8String], [outStr UTF8String]) < 0) {
    NSString *errorString = @(strerror(errno));
    NSLog(@"Couldn't print (%@) to stderr because: %@", outStr, errorString);
  }
  va_end(args);
}

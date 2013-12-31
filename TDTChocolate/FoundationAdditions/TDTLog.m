#import "TDTLog.h"
#import "../FoundationAdditions/NSDateFormatter+TDTISO8601Formatting.h"

TDTLogErrorWarningHookFunction TDTLogErrorWarningHook;

void __TDTLog(BOOL shouldInvokeErrorWarningHook, NSString *format, ...) {
  va_list args;
  va_start(args, format);
  NSString *message = [[NSString alloc] initWithFormat:format arguments:args];
  NSDate *date = [NSDate date];
  NSDateFormatter *formatter = [NSDateFormatter sharedISO8601Formatter];
  NSString *dateString;
  @synchronized(formatter) {
    dateString = [formatter stringFromDate:date];
  }
  if (fprintf(stderr, "%s %s\n", [dateString UTF8String], [message UTF8String]) < 0) {
    NSString *errorString = @(strerror(errno));
    NSLog(@"Couldn't print (%@) to stderr because: %@", message, errorString);
  }
  if (shouldInvokeErrorWarningHook && TDTLogErrorWarningHook != NULL) {
    TDTLogErrorWarningHook(message);
  }
  va_end(args);
}

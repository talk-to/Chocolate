#import "TDTLog.h"
#import "../FoundationAdditions/NSDateFormatter+TDTISO8601Formatting.h"

TDTLogErrorWarningHookFunction TDTLogErrorWarningHook;

static NSString *TDTLogRepresentationOfDate(NSDate *date) {
  static NSDateFormatter *formatter;
  NSString *dateString;
  NSLock *lock = [[NSLock alloc] init];
  [lock lock];
  if (formatter == nil) {
    formatter = [NSDateFormatter ISO8601Formatter];
  }
  dateString = [formatter stringFromDate:date];
  [lock unlock];
  return dateString;
}

// When TDTLog is invoked, it prints the current date in ISO 8601
// format first thing on the line, followed by a single space, followed
// by the formatted string provided by the user, followed by newline.
//
// TDTLog uses a static date formatter to print the date string. Since it
// doesn't rely on creating a fresh instance of NSCalendar everytime (I
// don't even know why NSLog needs it), its performance is much better
// than that of NSLog. e.g. Here's how much time it takes to print "Hello
// World" a 1000 times on an iPhone 4S:
//
// NSLog: ~1.7s
// TDTLog: ~0.1s
// Plain fprintf (without any date string): ~0.01s

void TDTLog(NSString *format, ...) {
  va_list args;
  va_start(args, format);
  NSString *message = [[NSString alloc] initWithFormat:format arguments:args];
  NSDate *date = [NSDate date];
  NSString *dateString = TDTLogRepresentationOfDate(date);
  if (fprintf(stderr, "%s %s\n", [dateString UTF8String], [message UTF8String]) < 0) {
    NSString *errorString = @(strerror(errno));
    NSLog(@"Couldn't print (%@) to stderr because: %@", message, errorString);
  }
  va_end(args);
}

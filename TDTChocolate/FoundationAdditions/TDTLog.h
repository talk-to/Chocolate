#import <Foundation/Foundation.h>

void TDTLog(NSString *fmt, ...);

#ifndef DEBUG_LEVEL
#define DEBUG_LEVEL 4
#endif

#define DEBUG_ERROR   (DEBUG_LEVEL >= 1)
#define DEBUG_WARN    (DEBUG_LEVEL >= 2)
#define DEBUG_INFO    (DEBUG_LEVEL >= 3)
#define DEBUG_VERBOSE (DEBUG_LEVEL >= 4)

/**
 Logging macros. 
 
 Make sure that 'format' is a literal Objective-C string. We need it to be a
 literal since we are relying on string literal contatenation here.

 Prepends log type, __PRETTY_FUNCTION__, and line number to the formatted log message.
 */

#define TDTLogError(format, ...) \
  do { \
    if (DEBUG_ERROR) {\
      TDTLog((@"ERROR %s #%d " format), __PRETTY_FUNCTION__, __LINE__, ## __VA_ARGS__); \
    } \
  } while (0)

#define TDTLogWarn(format, ...) \
  do { \
   if (DEBUG_WARN) { \
     TDTLog((@"WARN %s #%d " format), __PRETTY_FUNCTION__, __LINE__, ## __VA_ARGS__); \
   } \
  } while (0)

#define TDTLogInfo(format, ...) \
  do { \
    if (DEBUG_INFO) { \
      TDTLog((@"INFO %s #%d " format), __PRETTY_FUNCTION__, __LINE__, ## __VA_ARGS__); \
    } \
  } while (0)

#define TDTLogVerbose(format, ...) \
  do { \
    if (DEBUG_VERBOSE) { \
      TDTLog((@"VERBOSE %s #%d " format), __PRETTY_FUNCTION__, __LINE__, ## __VA_ARGS__); \
    } \
  } while (0)

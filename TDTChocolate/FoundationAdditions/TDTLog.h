#import <Foundation/Foundation.h>

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

 Clients can set the `TDTLogErrorWarningHook` function pointer to point to
 a function which will then be invoked with the formatted log message whenever
 a log message with ERROR or WARN level is emitted.
 */

typedef void (*TDTLogErrorWarningHookFunction)(NSString *message);
extern TDTLogErrorWarningHookFunction TDTLogErrorWarningHook;

#define TDTLogError(format, ...) \
  do { \
    if (DEBUG_ERROR) {\
      __TDTLog(YES, (@"ERROR %s #%d " format), __PRETTY_FUNCTION__, __LINE__, ## __VA_ARGS__); \
    } \
  } while (0)

#define TDTLogWarn(format, ...) \
  do { \
   if (DEBUG_WARN) { \
     __TDTLog(YES, (@"WARN %s #%d " format), __PRETTY_FUNCTION__, __LINE__, ## __VA_ARGS__); \
   } \
  } while (0)

#define TDTLogInfo(format, ...) \
  do { \
    if (DEBUG_INFO) { \
      __TDTLog(NO, (@"INFO %s #%d " format), __PRETTY_FUNCTION__, __LINE__, ## __VA_ARGS__); \
    } \
  } while (0)

#define TDTLogVerbose(format, ...) \
  do { \
    if (DEBUG_VERBOSE) { \
      __TDTLog(NO, (@"VERBOSE %s #%d " format), __PRETTY_FUNCTION__, __LINE__, ## __VA_ARGS__); \
    } \
  } while (0)


/**
 @note Clients should not directly invoke this function, and should instead
       use one of the predefined logging macros defined above.
 */
void __TDTLog(BOOL shouldInvokeErrorWarningHook, NSString *format, ...);

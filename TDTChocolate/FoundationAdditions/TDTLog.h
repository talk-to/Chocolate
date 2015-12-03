#import <Foundation/Foundation.h>

#ifndef DEBUG_LEVEL
#define DEBUG_LEVEL 4
#endif

#define DEBUG_ERROR   (DEBUG_LEVEL >= 1)
#define DEBUG_WARN    (DEBUG_LEVEL >= 2)
#define DEBUG_INFO    (DEBUG_LEVEL >= 3)
#define DEBUG_VERBOSE (DEBUG_LEVEL >= 4)

/**
 Enhanced Logging Macros.

 Prepend log type, __PRETTY_FUNCTION__, and line number to the formatted log message.

 @note Make sure that 'format' is a literal Objective-C string. We need it to
 be a literal since we are relying on string literal contatenation here.

 Clients can set the `TDTLogErrorWarningHook` function pointer to point to
 a function which will then be invoked with the formatted log message whenever
 a log message with ERROR or WARN level is emitted.
 */

typedef void (*TDTLogErrorWarningHookFunction)(NSString *message) DEPRECATED_MSG_ATTRIBUTE("Use @p TDTLoggingHookFunction instead. @p TDTLogErrorWarningHookFunction will be removed in next major release.");
typedef void (*TDTLoggingHookFunction)(NSString *message);

extern TDTLoggingHookFunction TDTLogErrorWarningHook;

/**
 Clients can set the `TDTLoggingHook` function pointer to point to a function
 which will then be invoked with the formatted log message whenever a log
 message is emitted.
 */
extern TDTLoggingHookFunction TDTLoggingHook;

#define TDTLogError(format, ...) \
do { \
if (DEBUG_ERROR) {\
NSString *__msg00 = [[NSString alloc] initWithFormat:(@"ERROR %s #%d " format), __PRETTY_FUNCTION__, __LINE__, ## __VA_ARGS__]; \
TDTLog(@"%@", __msg00); \
if (TDTLogErrorWarningHook != NULL) { \
TDTLogErrorWarningHook(__msg00); \
} \
if (TDTLoggingHook != NULL) { \
TDTLoggingHook(__msg00); \
} \
} \
} while (0)

#define TDTLogWarn(format, ...) \
do { \
if (DEBUG_WARN) { \
NSString *__msg00 = [[NSString alloc] initWithFormat:(@"WARN %s #%d " format), __PRETTY_FUNCTION__, __LINE__, ## __VA_ARGS__]; \
TDTLog(@"%@", __msg00); \
if (TDTLogErrorWarningHook != NULL) { \
TDTLogErrorWarningHook(__msg00); \
} \
if (TDTLoggingHook != NULL) { \
TDTLoggingHook(__msg00); \
} \
} \
} while (0)

#define TDTLogInfo(format, ...) \
do { \
if (DEBUG_INFO) { \
NSString *__msg = [[NSString alloc] initWithFormat:(@"INFO %s #%d " format), __PRETTY_FUNCTION__, __LINE__, ## __VA_ARGS__]; \
TDTLog(@"%@", __msg); \
if (TDTLoggingHook != NULL) { \
TDTLoggingHook(__msg); \
} \
} \
} while (0)

#define TDTLogVerbose(format, ...) \
do { \
if (DEBUG_VERBOSE) { \
NSString *__msg = [[NSString alloc] initWithFormat:(@"VERBOSE %s #%d " format), __PRETTY_FUNCTION__, __LINE__, ## __VA_ARGS__]; \
TDTLog(@"%@", __msg); \
if (TDTLoggingHook != NULL) { \
TDTLoggingHook(__msg); \
} \
} \
} while (0)


/**
 Plain (but more performant) replacement for `NSLog`.
 */
void TDTLog(NSString *format, ...) NS_FORMAT_FUNCTION(1, 2);

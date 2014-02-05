#import <Foundation/Foundation.h>

/**
 Unconditional variants of the `NSAssert` family that are enabled in both
 Debug and Release builds.
 */

#ifndef __PRAGMA_PUSH_NO_EXTRA_ARG_WARNINGS
#if __clang__
#define __PRAGMA_PUSH_NO_EXTRA_ARG_WARNINGS _Pragma("clang diagnostic push") _Pragma("clang diagnostic ignored \"-Wformat-extra-args\"")
#define __PRAGMA_POP_NO_EXTRA_ARG_WARNINGS _Pragma("clang diagnostic pop")
#else
#define __PRAGMA_PUSH_NO_EXTRA_ARG_WARNINGS
#define __PRAGMA_POP_NO_EXTRA_ARG_WARNINGS
#endif
#endif

#pragma mark - TDTAssert

#define TDTAssert(condition, format...)	\
  do {				\
  __PRAGMA_PUSH_NO_EXTRA_ARG_WARNINGS \
    if (!(condition)) {		\
      [[NSAssertionHandler currentHandler] handleFailureInMethod:_cmd \
                                                          object:self \
                                                            file:[NSString stringWithUTF8String:__FILE__] \
                                                      lineNumber:__LINE__ \
                                                     description:@"" format]; \
     __builtin_unreachable(); \
     }				\
  __PRAGMA_POP_NO_EXTRA_ARG_WARNINGS \
  } while(0)

#define TDTParameterAssert(condition) TDTAssert((condition), @"Invalid parameter not satisfying: %s", #condition)

#pragma mark - TDTCAssert

#define TDTCAssert(condition, format...) \
  do {				\
  __PRAGMA_PUSH_NO_EXTRA_ARG_WARNINGS \
    if (!(condition)) {		\
    [[NSAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:__PRETTY_FUNCTION__] \
                                                            file:[NSString stringWithUTF8String:__FILE__] \
                                                      lineNumber:__LINE__ \
                                                     description:@"" format]; \
    __builtin_unreachable(); \
    }				\
  __PRAGMA_POP_NO_EXTRA_ARG_WARNINGS \
  } while(0)

#define TDTCParameterAssert(condition) TDTCAssert((condition), @"Invalid parameter not satisfying: %s", #condition)

#pragma mark - Convenience Assertions

/**
 Signal an assertion failure if either one of `a1` and `a2` is nil, or if they
 do not compare equal under `isEqual:`.

 The arguments are evaluated only once.
 */
#define TDTAssertEqualObjects(a1, a2, format...) \
  ({ \
    id __TDT_v1 = (a1); \
    id __TDT_v2 = (a2); \
    TDTAssert((__TDT_v1 == __TDT_v2) || [__TDT_v1 isEqual:__TDT_v2], ## format); \
  })

/// Signal an assertion failure if `expr` is NO.
#define TDTAssertTrue(expr, format...) TDTAssert(expr, ## format)

/// Signal an assertion failure if `expr` is YES.
#define TDTAssertFalse(expr, format...) TDTAssert(expr == NO, ## format)

/// Signal an assertion failure if `expr` is nil.
#define TDTAssertNotNil(expr, format...) TDTAssert((expr) != nil, ## format);

/// Signal an assertion failure if `expr` is not nil.
#define TDTAssertNil(expr, format...) TDTAssert((expr) == nil, ## format);

/// Signal an unconditional assertion failure
#define TDTAssertFailure(format...) TDTAssert(NO, ## format)

/// Ensure that the current line is not executed on the main thread
#define TDTAssertIsNotMainThread() \
  TDTAssert(![NSThread isMainThread], \
            @"attempt to run background thread method from main thread. stack trace: %@",\
            [NSThread callStackSymbols])

/// Ensure that the current line is executed on the main thread
#define TDTAssertIsMainThread() \
  TDTAssert([NSThread isMainThread], \
            @"attempt to run background thread method from main thread. stack trace: %@",\
            [NSThread callStackSymbols])

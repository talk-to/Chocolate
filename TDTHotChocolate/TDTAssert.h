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

#define TDTAssert(condition, desc, ...)	\
  do {				\
  __PRAGMA_PUSH_NO_EXTRA_ARG_WARNINGS \
    if (!(condition)) {		\
      [[NSAssertionHandler currentHandler] handleFailureInMethod:_cmd \
                                                          object:self \
                                                            file:[NSString stringWithUTF8String:__FILE__] \
                                                      lineNumber:__LINE__ \
                                                     description:(desc), ##__VA_ARGS__]; \
     }				\
  __PRAGMA_POP_NO_EXTRA_ARG_WARNINGS \
  } while(0)

#define TDTAssert1(condition, desc, arg1) TDTAssert((condition), (desc), (arg1))
#define TDTAssert2(condition, desc, arg1, arg2) TDTAssert((condition), (desc), (arg1), (arg2))
#define TDTAssert3(condition, desc, arg1, arg2, arg3) TDTAssert((condition), (desc), (arg1), (arg2), (arg3))
#define TDTAssert4(condition, desc, arg1, arg2, arg3, arg4) TDTAssert((condition), (desc), (arg1), (arg2), (arg3), (arg4))
#define TDTAssert5(condition, desc, arg1, arg2, arg3, arg4, arg5) TDTAssert((condition), (desc), (arg1), (arg2), (arg3), (arg4), (arg5))
#define TDTParameterAssert(condition) TDTAssert((condition), @"Invalid parameter not satisfying: %s", #condition)

#pragma mark - TDTCAssert

#define TDTCAssert(condition, desc, ...) \
  do {				\
  __PRAGMA_PUSH_NO_EXTRA_ARG_WARNINGS \
    if (!(condition)) {		\
    [[NSAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:__PRETTY_FUNCTION__] \
                                                            file:[NSString stringWithUTF8String:__FILE__] \
                                                      lineNumber:__LINE__ \
                                                     description:(desc), ##__VA_ARGS__]; \
    }				\
  __PRAGMA_POP_NO_EXTRA_ARG_WARNINGS \
  } while(0)

#define TDTCAssert1(condition, desc, arg1) TDTCAssert((condition), (desc), (arg1))
#define TDTCAssert2(condition, desc, arg1, arg2) TDTCAssert((condition), (desc), (arg1), (arg2))
#define TDTCAssert3(condition, desc, arg1, arg2, arg3) TDTCAssert((condition), (desc), (arg1), (arg2), (arg3))
#define TDTCAssert4(condition, desc, arg1, arg2, arg3, arg4) TDTCAssert((condition), (desc), (arg1), (arg2), (arg3), (arg4))
#define TDTCAssert5(condition, desc, arg1, arg2, arg3, arg4, arg5) TDTCAssert((condition), (desc), (arg1), (arg2), (arg3), (arg4), (arg5))
#define TDTCParameterAssert(condition) TDTCAssert((condition), @"Invalid parameter not satisfying: %s", #condition)

#pragma mark - Convenience Assertions

/// Signal an unconditional assertion failure
#define TDTAssertFailure(desc) TDTAssert(NO, desc)

/// Signal an unconditional assertion failure -- this corresponds to NSAssert1
#define TDTAssertFailure1(desc, arg1) TDTAssert1(NO, desc, arg1)

/// Signal an assertion failure if `expr` is nil.
#define TDTAssertNonNil(expr) TDTAssert((expr) != nil, @"NonNilAssertionFailure");

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

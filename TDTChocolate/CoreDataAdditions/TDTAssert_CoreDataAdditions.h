#import <Foundation/Foundation.h>

/**
 This is an verbatim copy of ../FoundationAdditions/TDTAssert.h
 By copying it, we save ourselves the trouble of definining an intermediate
 "core" subspec that provides this functionality and is a dependency of
 both FoundationAdditions and CoreDataAdditions.
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

#define TDTAssert_CD(condition, format...)	\
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


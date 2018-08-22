#import <Foundation/Foundation.h>

/**
 Methods to verify the effects of asynchronous methods.

 For example, a common pattern in for a view controller to invoke a method
 that performs some computations on a background thread, which then informs
 the view controller of completion by scheduling a block back on the
 main run loop. A test case for such a method can use one of these methods to
 keep spinning the run loop until it has verified that the callbacks have been
 invoked, or bail if timeout occurs.
 */

extern const NSTimeInterval TDTAsyncVerificationTimeoutDefault;

typedef BOOL (^TDTAsyncVerificationCompletionTest)(void);

@interface NSRunLoop (TDTAsyncVerification)

/**
 Keep spinning until either
 - the object pointed to by `object` becomes non NULL
 - or `timeout` occurs.
 @param object Pointer to the object. It should not be NULL.
 */
- (void)tdt_runUntilObjectIsInitialized:(id __strong *)object
                                timeout:(NSTimeInterval)timeout;

/**
 Keep spinning until either
 - the BOOL pointed to by `completionIndicator` becomes YES
 - or `timeout` occurs.
 @param completionIndicator Pointer to the BOOL to watch. It should not be NULL.
 */
- (void)tdt_runUntilCompletionIndicator:(BOOL *)completionIndicator
                                timeout:(NSTimeInterval)timeout;

/**
 Convenience wrappers that forward the invocation with the `timeout`
 argument set to `TDTAsyncVerificationTimeoutDefault`.
 */
- (void)tdt_runUntilObjectIsInitialized:(id __strong *)object;
- (void)tdt_runUntilCompletionIndicator:(BOOL *)completionIndicator;

/**
 Keep spinning in `NSDefaultRunLoopMode` (for at the most
 `TDTAsyncVerificationTimeoutDefault` seconds)
 until `completionTest` returns YES.
 */
- (void)tdt_runUntilCompletionTest:(TDTAsyncVerificationCompletionTest)completionTest;

/**
 Keep spinning in `NSDefaultRunLoopMode` until either
 `completionTest` returns YES or `timeout` occurs.
 */
- (void)tdt_runUntilCompletionTest:(TDTAsyncVerificationCompletionTest)completionTest
                           timeout:(NSTimeInterval)timeout;

/**
 Keep spinning in `mode` until either
 `completionTest` returns YES or `timeout` occurs.
 */
- (void)tdt_runUntilCompletionTest:(TDTAsyncVerificationCompletionTest)completionTest
                           timeout:(NSTimeInterval)timeout
                              mode:(NSString *)mode;

/**
 Keep spinning until `timeout`.
 This is useful for ensuring that a given asynchronous method is NOT called.
 */
- (void)tdt_runUntilTimeout:(NSTimeInterval)timeout;

/**
 Convenience wrapper over `runUntilTimeout` with an empirically determined
 timeouts that should generally be enough for a few context switches to happen.

 @note As is the case with `performSelector:afterDelay:0`, it is easy to misuse
 this function and end up with a fragile test suite.
 */
- (void)tdt_runLongEnoughForSomeThreadSwitches;

@end

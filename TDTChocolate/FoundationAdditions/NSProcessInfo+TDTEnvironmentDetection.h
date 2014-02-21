#import <Foundation/Foundation.h>

@interface NSProcessInfo (TDTEnvironmentDetection)

/**
 Determine if the current process is running inside a unit test context.

 Use case:
 When running unit tests on iOS, it is not necessary to fully initialize the
 application. The following check can be used to return early in the application
 launch process:
 \code
 - (BOOL)application:(UIApplication *)app didFinishLaunchingWithOptions:(id)options {
 #ifdef DEBUG
 if ([[NSProcessInfo processInfo] isRunningTests]) return YES;
 #endif
 ...
 return YES;
 }
 \endcode

 @return YES if the process has been invoked to run the XCTest bundle.
 */
@property (nonatomic, readonly) BOOL tdt_isRunningTests;

/**
 Determine if a debugger is attached to the current process.

 This can help decide, for example, whether to redirect standard error
 (and hence, everything logged by @p TDTLog) to a file. Usually, when
 a process is attached to a debugger, you do not want to redirect
 standard error.

 Source: Technical Q&A QA1361 "Detecting the Debugger"

 @note This method relies on a public but unstable Apple API. It
 should not be used in a release build.
 */
- (BOOL) tdt_isDebugged;

@end

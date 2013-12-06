
/**
 Determine if the current application is running inside a unit test context.

 When running unit tests, it is not necessary to fully initialize the 
 application. The following check can be used to return early in the application
 launch process:
 \code
   - (BOOL)application:(UIApplication *)app didFinishLaunchingWithOptions:(id)options {
     #ifdef DEBUG
     if (TDTIsApplicationRunningTests()) return YES;
     #endif
     ...
     return YES;
   }
 \endcode

 @return YES if the Application has been invoked to run the XCTest bundle.
*/
BOOL TDTIsApplicationRunningTests(void) __attribute__((const));


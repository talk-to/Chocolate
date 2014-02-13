#import "NSRunLoop+TDTAsyncVerification.h"

const NSTimeInterval TDTAsyncVerificationTimeoutDefault = 0.1;

@implementation NSRunLoop (TDTAsyncVerification)

- (void)tdt_runUntilObjectIsInitialized:(__strong id *)object
                            timeout:(NSTimeInterval)timeout {
  NSParameterAssert(object);
  // http://stackoverflow.com/a/7829769/141220
  NSDate *loopUntil = [NSDate dateWithTimeIntervalSinceNow:timeout];
  while (*object == nil && [loopUntil timeIntervalSinceNow] > 0) {
    [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
                             beforeDate:loopUntil];
  }
}

- (void)tdt_runUntilObjectIsInitialized:(__strong id *)object {
  [self tdt_runUntilObjectIsInitialized:object
                            timeout:TDTAsyncVerificationTimeoutDefault];
}

- (void)tdt_runUntilCompletionIndicator:(BOOL *)completionIndicator
                            timeout:(NSTimeInterval)timeout {
  NSParameterAssert(completionIndicator);
  NSDate *loopUntil = [NSDate dateWithTimeIntervalSinceNow:timeout];
  while (*completionIndicator == NO && [loopUntil timeIntervalSinceNow] > 0) {
    [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
                             beforeDate:loopUntil];
  }
}

- (void)tdt_runUntilCompletionIndicator:(BOOL *)completionIndicator {
  [self tdt_runUntilCompletionIndicator:completionIndicator
                            timeout:TDTAsyncVerificationTimeoutDefault];
}

- (void)tdt_runUntilCompletionTest:(TDTAsyncVerificationCompletionTest)completionTest {
  [self tdt_runUntilCompletionTest:completionTest
                       timeout:TDTAsyncVerificationTimeoutDefault];
}

- (void)tdt_runUntilCompletionTest:(TDTAsyncVerificationCompletionTest)completionTest
                       timeout:(NSTimeInterval)timeout {
  [self tdt_runUntilCompletionTest:completionTest
                       timeout:timeout
                          mode:NSDefaultRunLoopMode];
}

- (void)tdt_runUntilCompletionTest:(TDTAsyncVerificationCompletionTest)completionTest
                       timeout:(NSTimeInterval)timeout
                          mode:(NSString *)mode {
  NSParameterAssert(completionTest);
  NSDate *loopUntil = [NSDate dateWithTimeIntervalSinceNow:timeout];
  while (completionTest() == NO && [loopUntil timeIntervalSinceNow] > 0) {
    [[NSRunLoop currentRunLoop] runMode:mode
                             beforeDate:loopUntil];
  }
}

- (void)tdt_runUntilTimeout:(NSTimeInterval)timeout {
  NSDate *loopUntil = [NSDate dateWithTimeIntervalSinceNow:timeout];
  while ([loopUntil timeIntervalSinceNow] > 0) {
    [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
                             beforeDate:loopUntil];
  }
}

- (void)tdt_runLongEnoughForSomeThreadSwitches {
  [self tdt_runUntilTimeout:0.1];
}

@end

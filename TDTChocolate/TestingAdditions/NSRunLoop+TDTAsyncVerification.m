#import "NSRunLoop+TDTAsyncVerification.h"

const NSTimeInterval TDTAsyncVerificationTimeoutDefault = 0.1;

@implementation NSRunLoop (TDTAsyncVerification)

- (void)runUntilObjectIsInitialized:(__strong id *)object
                            timeout:(NSTimeInterval)timeout {
  NSParameterAssert(object);
  // http://stackoverflow.com/a/7829769/141220
  NSDate *loopUntil = [NSDate dateWithTimeIntervalSinceNow:timeout];
  while (*object == nil && [loopUntil timeIntervalSinceNow] > 0) {
    [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
                             beforeDate:loopUntil];
  }
}

- (void)runUntilObjectIsInitialized:(__strong id *)object {
  [self runUntilObjectIsInitialized:object
                            timeout:TDTAsyncVerificationTimeoutDefault];
}

- (void)runUntilCompletionIndicator:(BOOL *)completionIndicator
                            timeout:(NSTimeInterval)timeout {
  NSParameterAssert(completionIndicator);
  NSDate *loopUntil = [NSDate dateWithTimeIntervalSinceNow:timeout];
  while (*completionIndicator == NO && [loopUntil timeIntervalSinceNow] > 0) {
    [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
                             beforeDate:loopUntil];
  }
}

- (void)runUntilCompletionIndicator:(BOOL *)completionIndicator {
  [self runUntilCompletionIndicator:completionIndicator
                            timeout:TDTAsyncVerificationTimeoutDefault];
}

- (void)runUntilCompletionTest:(TDTAsyncVerificationCompletionTest)completionTest {
  [self runUntilCompletionTest:completionTest
                       timeout:TDTAsyncVerificationTimeoutDefault];
}

- (void)runUntilCompletionTest:(TDTAsyncVerificationCompletionTest)completionTest
                       timeout:(NSTimeInterval)timeout {
  [self runUntilCompletionTest:completionTest
                       timeout:timeout
                          mode:NSDefaultRunLoopMode];
}

- (void)runUntilCompletionTest:(TDTAsyncVerificationCompletionTest)completionTest
                       timeout:(NSTimeInterval)timeout
                          mode:(NSString *)mode {
  NSParameterAssert(completionTest);
  NSDate *loopUntil = [NSDate dateWithTimeIntervalSinceNow:timeout];
  while (completionTest() == NO && [loopUntil timeIntervalSinceNow] > 0) {
    [[NSRunLoop currentRunLoop] runMode:mode
                             beforeDate:loopUntil];
  }
}

- (void)runUntilTimeout:(NSTimeInterval)timeout {
  NSDate *loopUntil = [NSDate dateWithTimeIntervalSinceNow:timeout];
  while ([loopUntil timeIntervalSinceNow] > 0) {
    [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
                             beforeDate:loopUntil];
  }
}

- (void)runLongEnoughForSomeThreadSwitches {
  [self runUntilTimeout:0.1];
}

@end

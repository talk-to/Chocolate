#import "NSOperationQueue+TDTScheduling.h"
#import "TDTAssert.h"

@implementation NSOperationQueue (TDTScheduling)

- (void)tdt_addOperation:(NSOperation *)operation
              afterDelay:(NSTimeInterval)delay {
  TDTParameterAssert(operation);
  TDTAssert(delay > 0);

  __weak typeof(self) weakSelf = self;
  double delayInSeconds = delay;
  dispatch_queue_t arbitraryQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
  dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
  dispatch_after(popTime, arbitraryQueue, ^{
    [weakSelf addOperation:operation];
  });
}

@end

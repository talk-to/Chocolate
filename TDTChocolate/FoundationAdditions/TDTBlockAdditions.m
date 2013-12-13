#import "TDTBlockAdditions.h"

@implementation NSObject (TDTBlocksAdditions)

- (void)my_callBlock {
  TDTSimpleBlock block = (id)self;
  block();
}

@end

void TDTRunInBackground(TDTSimpleBlock block) {
  [NSThread detachNewThreadSelector:@selector(my_callBlock)
                           toTarget:[block copy]
                         withObject:nil];
}

void TDTRunOnMainThread(BOOL wait, TDTSimpleBlock block) {
  [[block copy] performSelectorOnMainThread:@selector(my_callBlock)
                                 withObject:nil
                              waitUntilDone:wait];
}

void TDTRunOnThread(NSThread *thread, BOOL wait, TDTSimpleBlock block) {
  [[block copy] performSelector:@selector(my_callBlock)
                       onThread:thread
                     withObject:nil
                  waitUntilDone:wait];
}

void TDTRunAfterDelay(NSTimeInterval delay, TDTSimpleBlock block) {
  [[block copy] performSelector:@selector(my_callBlock)
                     withObject:nil
                     afterDelay:delay];
}

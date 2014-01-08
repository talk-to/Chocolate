#import "NSOperationQueue+TDTSerialQueueAdditions.h"

@implementation NSOperationQueue (TDTSerialQueueAdditions)

+ (instancetype)serialOperationQueue {
  NSOperationQueue *queue = [[self alloc] init];
  [queue setMaxConcurrentOperationCount:1];
  return queue;
}

- (BOOL)isSerial {
  return (self.maxConcurrentOperationCount == 1);
}

@end

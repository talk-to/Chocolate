#import "NSOperationQueue+TDTSerialQueueAdditions.h"

@implementation NSOperationQueue (TDTSerialQueueAdditions)

+ (instancetype)tdt_serialOperationQueue {
  NSOperationQueue *queue = [[self alloc] init];
  [queue setMaxConcurrentOperationCount:1];
  return queue;
}

- (BOOL)tdt_isSerial {
  return (self.maxConcurrentOperationCount == 1);
}

@end

#import <Foundation/Foundation.h>

@interface NSOperationQueue (TDTScheduling)

/**
 Wait for @p delay and then add @p operation to the receiver.

 @param operation The operation to add to the receiver. It will be strongly
        referenced for @p delay` even if it cancelled or if the receiver
        is deallocated.
 @param delay The time interval to wait before adding @p operation.
 */
- (void)tdt_addOperation:(NSOperation *)operation
              afterDelay:(NSTimeInterval)delay;

@end

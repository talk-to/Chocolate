#import <Foundation/Foundation.h>

/**
 Methods on mutable arrays to make them appear to behave like FIFO queues.

 @note The FIFO abstraction will hold as long all additions and removals to the
 array are only make via the provided `enqueue/dequeue` methods.
 */
@interface NSArray (TDTQueueing)

- (void)tdt_enqueueObject:(id)object;
- (id)tdt_dequeueObject;

@end

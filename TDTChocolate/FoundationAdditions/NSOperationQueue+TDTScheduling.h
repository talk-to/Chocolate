#import <Foundation/Foundation.h>

@interface NSOperationQueue (TDTScheduling)

- (void)scheduleAfterDelay:(NSTimeInterval)delay
                 operation:(NSOperation *)operation;

@end

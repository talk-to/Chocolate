#import <Foundation/Foundation.h>

@interface NSOperationQueue (TDTScheduling)

- (void)tdt_addOperation:(NSOperation *)operation
              afterDelay:(NSTimeInterval)delay;

@end

#import <Foundation/Foundation.h>

/**
 A "Serial Queue" is defined as an NSOperationQueue object with the
 maximum concurrent operation count set to one.
 */
@interface NSOperationQueue (TDTSerialQueueAdditions)

/**
 @return A new instance of a serial queue.
 */
+ (instancetype)serialOperationQueue;

/**
 @return YES if the receiver is a serial queue.
 */
- (BOOL)isSerial;

@end

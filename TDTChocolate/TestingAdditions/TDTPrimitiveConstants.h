#import <Foundation/Foundation.h>

/**
 A very large time interval, suitable for being used in tests that do want
 to delay the execution of certain code (e.g. a dispatch_block_t) for so long
 that it can be effectively ignored.
 */
extern const NSTimeInterval TDTNSTimeIntervalInfinity;

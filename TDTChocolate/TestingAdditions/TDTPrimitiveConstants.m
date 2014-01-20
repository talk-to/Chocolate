#import "TDTPrimitiveConstants.h"

// Using `[[NSDate distantFuture] timeIntervalSinceNow]` overflows the
// common idiom of using `(int64_t)(x * NSEC_PER_SEC)` used when adding timers
// to GCD queues, so we just use a very large value instead.

const NSTimeInterval TDTNSTimeIntervalInfinity = 100000;

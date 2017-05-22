#import <Foundation/Foundation.h>

@interface NSDate (TDTAdditions)

- (int64_t)tdt_millisecondsSinceEpoch;

+ (NSDate *)tdt_dateFromMillisecondsSinceUnixEpoch:(int64_t)millisecondsSinceUnixEpoch;

@end

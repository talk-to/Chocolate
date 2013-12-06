#import "NSString+TDTRandom.h"

@implementation NSString (TDTRandom)

+ (instancetype)randomString {
  return [self stringWithFormat:@"%u", arc4random()];
}

@end

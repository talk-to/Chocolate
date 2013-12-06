#import "TDTRandomFixtures.h"

@implementation NSString (TDTRandomFixtures)

+ (instancetype)randomString {
  return [self stringWithFormat:@"%u", arc4random()];
}

@end

@implementation NSNumber (TDTRandomFixtures)

+ (instancetype)randomNumber {
  return [NSNumber numberWithLong:arc4random()];
}

@end

@implementation NSURL (TDTRandomFixtures)

+ (instancetype)randomURL {
  return [self URLWithString:[NSString randomString]];
}

@end

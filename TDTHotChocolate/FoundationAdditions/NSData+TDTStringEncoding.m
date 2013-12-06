#import "NSData+TDTStringEncoding.h"

@implementation NSData (TDTStringEncoding)

- (NSString *)stringUsingEncoding:(NSStringEncoding)encoding {
  return [[NSString alloc] initWithData:self encoding:encoding];
}

- (NSString *)stringUsingUTF8Encoding {
  return [self stringUsingEncoding:NSUTF8StringEncoding];
}

@end

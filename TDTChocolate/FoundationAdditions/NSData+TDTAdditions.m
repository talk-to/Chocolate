#import "NSData+TDTAdditions.h"

@implementation NSData (TDTAdditions)

- (NSString *)tdt_stringUsingEncoding:(NSStringEncoding)encoding {
  return [[NSString alloc] initWithData:self encoding:encoding];
}

- (NSString *)tdt_stringUsingUTF8Encoding {
  return [self tdt_stringUsingEncoding:NSUTF8StringEncoding];
}

- (NSString *)tdt_hexRepresentation {
	NSMutableString *stringBuffer = [NSMutableString stringWithCapacity:([self length] * 2)];
  const unsigned char *dataBuffer = [self bytes];
  for (NSUInteger i = 0; i < [self length]; ++i) {
    [stringBuffer appendFormat:@"%02lx", (unsigned long)dataBuffer[i]];
	}
  return stringBuffer;
}

@end

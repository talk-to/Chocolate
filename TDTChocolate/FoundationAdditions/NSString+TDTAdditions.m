#import "NSString+TDTAdditions.h"
#import "TDTAssert.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (TDTAdditions)

+ (instancetype)tdt_randomUUID {
  CFUUIDRef uuid = CFAutorelease(CFUUIDCreate(NULL));
  return (NSString *)CFBridgingRelease(CFUUIDCreateString(NULL, uuid));
}

+ (NSString *)tdt_stringWithUnsignedInteger:(NSUInteger)unsignedInteger {
  return [self stringWithFormat:@"%lu", (unsigned long)unsignedInteger];
}

+ (NSString *)tdt_stringWithBOOL:(BOOL)b {
  return b ? @"YES" : @"NO";
}

- (NSString *)tdt_SHA1Digest {
  const char *cstr = [self cStringUsingEncoding:NSUTF8StringEncoding];
  NSData *data = [NSData dataWithBytes:cstr length:self.length];

  uint8_t digest[CC_SHA1_DIGEST_LENGTH];

  NSUInteger length = data.length;
  TDTAssert(length < UINT32_MAX);
  CC_SHA1(data.bytes, (CC_LONG)length, digest);

  NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];

  for (int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
    [output appendFormat:@"%02x", digest[i]];

  return output;
}

- (NSString *)tdt_stringByTrimmingWhitespaceAndNewlines {
  return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *)tdt_stringByTrimmingNonAlphaNumericCharacters {
  NSCharacterSet *charactersToRemove = [[NSCharacterSet alphanumericCharacterSet] invertedSet];
  return [self stringByTrimmingCharactersInSet:charactersToRemove];
}

- (NSString *)tdt_stringByNillingBlanks {
  return [self tdt_isNonEmpty] ? self : nil;
}

- (BOOL)tdt_containsString:(NSString *)string {
  return ([self rangeOfString:string].location != NSNotFound);
}

- (NSData *)tdt_dataUsingUTF8Encoding {
  return [self dataUsingEncoding:NSUTF8StringEncoding];
}

- (BOOL)tdt_isNonEmpty {
  return (self.length > 0);
}

- (NSUInteger)tdt_unsignedIntegerValue {
  unsigned long ul = strtoul([self cStringUsingEncoding:NSUTF8StringEncoding], NULL, 10);
  if (ul > NSUIntegerMax) {
    ul = NSUIntegerMax;
  }
  return (NSUInteger)ul;
}

@end

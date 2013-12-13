#import "NSString+TDTAdditions.h"
#import "TDTAssert.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (TDTAdditions)

+ (instancetype)randomUUID {
  CFUUIDRef uuid = CFAutorelease(CFUUIDCreate(NULL));
  return (NSString *)CFBridgingRelease(CFUUIDCreateString(NULL, uuid));
}

- (NSString *)sha1Digest {
  const char *cstr = [self cStringUsingEncoding:NSUTF8StringEncoding];
  NSData *data = [NSData dataWithBytes:cstr length:self.length];

  uint8_t digest[CC_SHA1_DIGEST_LENGTH];

  NSUInteger length = data.length;
  TDTAssert(length < UINT32_MAX, nil);
  CC_SHA1(data.bytes, (CC_LONG)length, digest);

  NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];

  for (int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
    [output appendFormat:@"%02x", digest[i]];

  return output;
}

- (NSString *)stringByTrimmingWhitespaceAndNewlines {
  return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *)stringByTrimmingNonAlphaNumericCharacters {
  NSCharacterSet *charactersToRemove = [[NSCharacterSet alphanumericCharacterSet] invertedSet];
  return [self stringByTrimmingCharactersInSet:charactersToRemove];
}

- (NSString *)stringByNillingBlanks {
  if ([self length] == 0) {
    return nil;
  }
  return self;
}

+ (NSString *)stringWithUnsignedInteger:(NSUInteger)uInteger {
  return [self stringWithFormat:@"%lu", (unsigned long)uInteger];
}

- (BOOL)containsString:(NSString *)string {
  return ([self rangeOfString:string].location != NSNotFound);
}

@end

#import "NSString+TDTAdditions.h"
#import "TDTAssert.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (TDTAdditions)

+ (instancetype)tdt_randomUUID {
  CFUUIDRef uuid = CFAutorelease(CFUUIDCreate(NULL));
  return (NSString *)CFBridgingRelease(CFUUIDCreateString(NULL, uuid));
}

+ (NSString *)tdt_stringWithUnsignedInteger:(NSUInteger)unsignedInteger {
  return [self stringWithFormat:@"%llu", (unsigned long long)unsignedInteger];
}

+ (NSString *)tdt_stringWithInteger:(NSInteger)integer {
  return [self stringWithFormat:@"%lld", (long long)integer];
}

+ (NSString *)tdt_stringWithBOOL:(BOOL)b {
  return b ? @"YES" : @"NO";
}

- (NSString *)tdt_SHA1Digest {
  const char *cstr = [self cStringUsingEncoding:NSUTF8StringEncoding];
  NSUInteger characterCount = [self lengthOfBytesUsingEncoding:NSUTF8StringEncoding];
  NSData *data = [NSData dataWithBytes:cstr length:characterCount];

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

- (NSString *)tdt_stringByRemovingCharacters:(NSCharacterSet *)characters {
  return [[self componentsSeparatedByCharactersInSet:characters] componentsJoinedByString:@""];
}

- (BOOL)tdt_isEmail {
  NSString *emailRegex = @"[A-Z0-9a-z][A-Z0-9a-z._%+-]*@[A-Za-z0-9][A-Za-z0-9.-]*\\.[A-Za-z]{2,6}";
  NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
  BOOL isValid = [emailTest evaluateWithObject:self];
  return isValid;
}

@end

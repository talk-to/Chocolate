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

+ (NSString *)tdt_stringWithUInt64:(uint64_t)uInt64 {
  return [self stringWithFormat:@"%" PRIu64, uInt64];
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
  return [self tdt_isBlankAfterTrimmingWhitespaces] ? nil : self;
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

- (uint64_t)tdt_uInt64 {
  unsigned long long ull = strtoull([self cStringUsingEncoding:NSUTF8StringEncoding], NULL, 10);
  return (uint64_t)ull;
}

- (NSString *)tdt_stringByRemovingCharacters:(NSCharacterSet *)characters {
  return [[self componentsSeparatedByCharactersInSet:characters] componentsJoinedByString:@""];
}

- (BOOL)tdt_isEmail {
  NSString *emailRegex = @"(?:[a-zA-Z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-zA-Z0-9!#$%\\&'*+/=?\\^_`{|}"
  @"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
  @"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-zA-Z0-9](?:[a-"
  @"z0-9-]*[a-zA-Z0-9])?\\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?|\\[(?:(?:25[0-5"
  @"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
  @"9][0-9]?|[a-zA-Z0-9-]*[a-zA-Z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
  @"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";
  return [self isEmailValidWithRegex:emailRegex];
}

- (BOOL)tdt_isEmail2 {
  NSString *emailRegex = @"[^@ ]+@[^@ ]+\\.[^@ ]+";
  return [self isEmailValidWithRegex:emailRegex];
}

- (BOOL)isEmailValidWithRegex:(NSString *)emailRegex {
  NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
  BOOL isValid = [emailTest evaluateWithObject:self];
  return isValid;
}

- (BOOL)tdt_isBlankAfterTrimmingWhitespaces {
  NSString *trimmedString = [self tdt_stringByTrimmingWhitespaceAndNewlines];
  return ![trimmedString tdt_isNonEmpty];
}

@end

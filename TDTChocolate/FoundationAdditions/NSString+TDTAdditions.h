#import <Foundation/Foundation.h>

@interface NSString (TDTAdditions)

/**
 @return A string representing a newly generated version 4 random UUID
 */
+ (instancetype)randomUUID;

/**
 There is no platform agnostic format specifier for an `NSUInteger`. Ergo this.
 */
+ (NSString *)stringWithUnsignedInteger:(NSUInteger)uInteger;

/**
 @return The SHA1 of the receiver
 */
- (NSString *)SHA1Digest;

/**
 @return A new string by trimming whitespace (including newlines) from the receiver.
 */
- (NSString *)stringByTrimmingWhitespaceAndNewlines;

/** 
 @return A new string by trimming non alphanumeric characters from the receiver
 */
- (NSString *)stringByTrimmingNonAlphaNumericCharacters;

/**
 @return `nil` if the receiver is blank, otherwise returns the receiver.
 */
- (NSString *)stringByNillingBlanks;

/**
 @return YES if the receiver contains `string`
 */
- (BOOL)containsString:(NSString *)string;

/**
 @return NSData containing the UTF8 encoding of the receiver.
 */
- (NSData *)dataUsingUTF8Encoding;

@end

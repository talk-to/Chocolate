#import <Foundation/Foundation.h>

@interface NSString (TDTAdditions)

/**
 @return A string representing a newly generated version 4 random UUID
 */
+ (instancetype)tdt_randomUUID;

/**
 There is no platform agnostic format specifier for an `NSUInteger`. Ergo this.
 */
+ (NSString *)tdt_stringWithUnsignedInteger:(NSUInteger)unsignedInteger;

/**
 There is no platform agnostic format specifier for an `NSInteger`. Ergo this.
 */
+ (NSString *)tdt_stringWithInteger:(NSInteger)integer;

/**
 @return "YES" or "NO"
 */
+ (NSString *)tdt_stringWithBOOL:(BOOL)b;

/**
 @return The SHA1 of the receiver
 */
- (NSString *)tdt_SHA1Digest;

/**
 @return A new string by trimming whitespace (including newlines) from the receiver.
 */
- (NSString *)tdt_stringByTrimmingWhitespaceAndNewlines;

/**
 @return A new string by trimming non alphanumeric characters from the receiver
 */
- (NSString *)tdt_stringByTrimmingNonAlphaNumericCharacters;

/**
 @return `nil` if the receiver is blank, otherwise returns the receiver.
 */
- (NSString *)tdt_stringByNillingBlanks;

/**
 @return YES if the receiver contains `string`
 */
- (BOOL)tdt_containsString:(NSString *)string;

/**
 @return NSData containing the UTF8 encoding of the receiver.
 */
- (NSData *)tdt_dataUsingUTF8Encoding;

/**
 @return YES if the receiver is the empty string.
 */
- (BOOL)tdt_isNonEmpty;

/**
 @return The NSUInteger value of the receiver’s text, assuming a decimal
 representation.

 @note If the converted value is greater than `NSUIntegerMax` then the return
 value is `NSUIntegerMax`.
 */
- (NSUInteger)tdt_unsignedIntegerValue;

/**
 @return String obtained by removing all occurrences of any of the characters
 in the @p characters set.
 */
- (NSString *)tdt_stringByRemovingCharacters:(NSCharacterSet *)characters;

/**
 @return Return YES if string is valid email, otherwise NO.
 */
- (BOOL)tdt_isEmail;

/**
 @return Returns YES if string contains only @p whitespace characters.
 */
- (BOOL)tdt_isBlank;

@end

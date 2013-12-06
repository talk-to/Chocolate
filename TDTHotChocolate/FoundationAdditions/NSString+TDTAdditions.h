#import <Foundation/Foundation.h>

@interface NSString (TDTAdditions)

/**
 @return a string representing a newly generated version 4 random UUID
 */
+ (instancetype)randomUUID;

/**
 @return The SHA1 of the receiver
 */
- (NSString *)sha1Digest;

/** 
 @return a new string by trimming non alphanumeric characters from the receiver
 */
- (NSString *)stringByTrimmingNonAlphaNumericCharacters;

/**
 @return `nil` if the receiver is blank, otherwise returns the receiver.
 */
- (NSString *)stringByNillingBlanks;

/**
 There is no platform agnostic format specifier for an `NSUInteger`. Ergo this.
 */
+ (NSString *)stringWithUnsignedInteger:(NSUInteger)uInteger;

@end

#import <Foundation/Foundation.h>

@interface NSData (TDTAdditions)

/**
 Motivation: `NSData` does not provide a convenience constructors for these.
 */
- (NSString *)stringUsingEncoding:(NSStringEncoding)encoding;
- (NSString *)stringUsingUTF8Encoding;

/**
 @return A string of hex digits representing the contents of the receiver.
 */
- (NSString *)hexRepresentation;

@end

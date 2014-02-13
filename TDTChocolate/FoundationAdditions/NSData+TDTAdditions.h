#import <Foundation/Foundation.h>

@interface NSData (TDTAdditions)

/**
 Motivation: `NSData` does not provide a convenience constructors for these.
 */
- (NSString *)tdt_stringUsingEncoding:(NSStringEncoding)encoding;
- (NSString *)tdt_stringUsingUTF8Encoding;

/**
 @return A string of hex digits representing the contents of the receiver.
 */
- (NSString *)tdt_hexRepresentation;

@end

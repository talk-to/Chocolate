#import <Foundation/Foundation.h>

/// Motivation: `NSData` does not provide a convenience constructor for this.

@interface NSData (TDTStringEncoding)

- (NSString *)stringUsingEncoding:(NSStringEncoding)encoding;
- (NSString *)stringUsingUTF8Encoding;

@end

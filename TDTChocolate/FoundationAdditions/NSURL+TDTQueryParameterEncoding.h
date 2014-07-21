#import <Foundation/Foundation.h>

/**
 @note Chocolate already has a URL encoding mechanism in
 @p TDTURLQueryComponents, but that was based on a non-standard and possibly
 incorrect Stack-Overflow answer, and does not work in all scenarios.
 For example, it encodes "Hello, World" as "Hello,+World" whereas some
 APIs expect "Hello%2C%20World".

 This is an alternative implementation, based on
 http://stackoverflow.com/a/8086845/141220
 which would encode "Hello, World" as "Hello%2C%20World".

 It is less complete than the other implementation one, but (hopefully)
 more standard conforming. The other implementation is retained because
 correctly determining which one should be "standard" would require a bit
 more effort.
 */
@interface NSURL (TDTQueryParameterEncoding)

/**
 @return URL obtained by adding suitably encoded HTTP query @p parameters
 on to the receiver.
 */
- (NSURL *)tdt_URLWithQueryParameters:(NSDictionary *)parameters;

@end

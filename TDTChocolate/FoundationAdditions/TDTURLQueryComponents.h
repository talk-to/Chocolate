
//  Reference : http://stackoverflow.com/questions/3997976/parse-nsurl-query-property

#import <Foundation/Foundation.h>

@interface NSString (TDTURLQueryComponents)

/**
 Decode URL query string treating @p self as query.

 @return decoded string
 */
- (NSString *)tdt_stringByDecodingURLFormat;

/**
 Encode URL query string treating @p self as query.

 @return encoded string
 */
- (NSString *)tdt_stringByEncodingURLFormat;

/**
 Treating @p self as query string, parse the query and return the parsed
 result as a dictionary.

 @return parsed dictionary
 */
- (NSMutableDictionary *)tdt_dictionaryFromQueryComponents;

@end

@interface NSURL (TDTURLQueryComponents)

/**
 Parse the query of @p self and returned the parsed result as a dictionary.

 @return parsed dictionary
 */
- (NSMutableDictionary *)tdt_queryComponents;

/**
 Add query components to an existing URL.

 @param queryComponents query components to be added

 @return new URL formed after appending query components
 */
- (NSURL *)tdt_URLByAppendingQueryComponents:(NSDictionary *)queryComponents;

@end

@interface NSDictionary (TDTURLQueryComponents)

/**
 Convert @p self to a valid query string.

 @return converted query string
 */
- (NSString *)tdt_stringFromQueryComponents;

@end

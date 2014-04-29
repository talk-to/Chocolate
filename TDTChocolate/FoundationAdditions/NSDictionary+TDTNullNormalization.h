#import <Foundation/Foundation.h>

// Motivation:
// JSON responses frequently contain 'null'. For our purposes, a JSON object with
// a null property is equivalent to the same object with that property missing.
// However, JSON parsers treat the former as `NSNull` and the latter as nil;
// This leads to problems for the subsequent code because NSNull is a bona-fide
// object while messages to nil are discarded. Furthermore, Objective C truthy
// checks work for NSNull and fail for nil.

@interface NSDictionary (TDTNullNormalization)

/**
 @return NSDictionary created by removing all enteries whose @p value is an
 instance of @p NSNull.

 @see NSArray+TDTNullNormalization
 */
- (NSDictionary *)tdt_dictionaryByRemovingNulls;

@end

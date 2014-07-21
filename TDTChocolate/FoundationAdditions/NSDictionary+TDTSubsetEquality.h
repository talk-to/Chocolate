#import <Foundation/Foundation.h>

@interface NSDictionary (TDTSubsetEquality)

/**
 Recursively compare the structure and values of two dictionaries to
 determine if one of them contains a subset of the entries (keys, values) of
 the other. If any of the values are an array, then the array contents are
 also recursively matched.

 @return YES if the receiver is a subset of the argument @p dict.
 */
- (BOOL)tdt_isSubsetOf:(NSDictionary *)dict;

@end

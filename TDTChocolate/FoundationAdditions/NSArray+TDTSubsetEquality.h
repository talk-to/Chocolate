#import <Foundation/Foundation.h>

@interface NSArray (TDTSubsetEquality)

/**
 @return YES if the receiver and @p array have the same number of elements,
 and @p tdt_isSubsetOf returns YES for each of them.

 @see `- [NSDictionary tdt_isSubsetOf]`
 */
- (BOOL)tdt_isSubsetOf:(NSArray *)array;

@end

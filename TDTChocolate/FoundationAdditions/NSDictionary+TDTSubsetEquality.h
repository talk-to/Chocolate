#import <Foundation/Foundation.h>

@interface NSDictionary (TDTSubsetEquality)

/**
 @return YES if the all of the keys in the receiver are present in @p dict,
 and for each such key, the corresponding values recursively return YES
 when probed using @p tdt_isSubsetOf.
 
 NSDictionary and NSArray instances respond to @p tdt_isSubsetOf in a custom
 manner. For everything else, it fall backs to an @p isEqual check.

 @see `- [NSArray tdt_isSubsetOf:]`
 */
- (BOOL)tdt_isSubsetOf:(NSDictionary *)dict;

@end

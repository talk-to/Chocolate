#import <Foundation/Foundation.h>

@interface NSArray (TDTNullNormalization)

/**
 @return NSArray created by removing all instances of @p NSNull.

 @see NSDictionary+TDTNullNormalization
 */
- (NSArray *)tdt_arrayByRemovingNulls;

@end

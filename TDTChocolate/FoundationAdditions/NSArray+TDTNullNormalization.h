#import <Foundation/Foundation.h>

@interface NSArray (TDTNullNormalization)

/**
 @return NSArray created by removing all instances of @p NSNull.

 @see NSDictionary+TDTNullNormalization
 */
- (NSArray *)arrayByRemovingNulls;

@end

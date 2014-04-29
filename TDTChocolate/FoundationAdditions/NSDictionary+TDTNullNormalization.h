#import <Foundation/Foundation.h>

@interface NSDictionary (TDTNullNormalization)

/**
 @return NSDictionary created by removing all enteries whose @p value is an
 instance of @p NSNull.

 @see NSArray+TDTNullNormalization
 */
- (NSDictionary *)tdt_dictionaryByRemovingNulls;

@end

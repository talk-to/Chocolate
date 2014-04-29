#import <Foundation/Foundation.h>

// This category provides a method to construct an array by removing all
// entries of class NSNull.
// Related: `NSDictionary+TDTNullNormalization`

@interface NSArray (TDTNullNormalization)

- (NSArray *)arrayByRemovingNulls;

@end

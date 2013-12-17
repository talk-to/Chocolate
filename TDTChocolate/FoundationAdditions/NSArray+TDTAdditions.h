#import <Foundation/Foundation.h>

@interface NSArray (TDTAdditions)

/**
 Converts an array of arrays into an array consisting of the objects of the arrays.

 @pre All objects in the receiver must be an instance of `NSArray`.
 @note This does not recursively flatten the arrays beyond the first level.
 */

- (instancetype)flatten;

/**
 @return YES if the receiver contains any object.
 */
- (BOOL)isNonEmpty;

@end

#import <Foundation/Foundation.h>

@interface NSArray (TDTAdditions)

/**
 Converts an array of arrays into an array consisting of the objects of the arrays.

 @pre All objects in the receiver must be an instance of `NSArray`.
 @note This does not recursively tdt_flatten the arrays beyond the first level.
 */

- (instancetype)tdt_flatten;

/**
 @return YES if the receiver contains any object.
 */
- (BOOL)tdt_isNonEmpty;

/**
 If the receiver contains exactly one object, then return that object;
 otherwise return @p nil.

 @warn This method will return @p nil if the receiver contains more
 than one object.
 */
- (id)tdt_onlyObjectOrNil;

/**
 @return array with the receiver's entries in reverse order.
 */
- (NSArray *)tdt_reversedArray;

/**
 @returns array with the receiver's entries shuffled in random order.
 */
- (NSArray *)tdt_shuffledArray;

@end

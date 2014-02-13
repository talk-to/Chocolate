#import <Foundation/Foundation.h>
#import "TDTFunctionalAdditionsBlockTypedefs.h"

@interface NSArray (TDTFunctionalAdditions)

/**
 Apply `selector` to every object in the receiver and return the array formed
 by collecting the results.

 The order of elements in this array corresponds to the order of original
 elements in the receiver. i.e. `selector` is first invoked for element at 
 index 0, then for element at index 1, and so on.
*/
- (NSArray *)tdt_arrayByMappingWithSelector:(SEL)selector;

/**
 Apply `block` to every object in the receiver and return the array formed
 by collecting the results.
 
 @see `arrayByMappingWithSelector` for the order of the elements in the result.
 */
- (NSArray *)tdt_arrayByMappingWithBlock:(TDTMapBlock)block;

/**
 Apply `selector` to every object in the receiver.
 */
- (void)tdt_applySelector:(SEL)selector;

/**
 Apply `block` to every object in the receiver.
 */
- (void)tdt_applyBlock:(TDTApplyBlock)block;

/**
 @return A new array containing the objects in the receiver for which
         `predicate` returns YES.
 */
- (NSArray *)tdt_filteredArrayUsingBlock:(TDTPredicateBlock)predicate;

/**
 @return A pair of arrays containing the objects in the receiver for which
         `predicate` returns YES and NO respectively.
 */
- (NSArray *)tdt_partitionUsingBlock:(TDTPredicateBlock)predicate;

/**
 @return YES if any object in the receiver satisfies `predicate`.
 */
- (BOOL)tdt_anyWithBlock:(TDTPredicateBlock)predicate;

@end

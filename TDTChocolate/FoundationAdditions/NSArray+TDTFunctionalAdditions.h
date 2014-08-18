#import <Foundation/Foundation.h>
#import "TDTFunctionalAdditionsBlockTypedefs.h"

@interface NSArray (TDTFunctionalAdditions)

/**
 Reduce from left to right, applying `newResult = block(currentResult, object)`
 for each @p element in the receiver and return the final value of @p newResult.
 @p initialObject is used in the first call to @p block.

 Return @p initialObject if the receiver is empty.
 */
- (id)tdt_objectAfterReducingWithInitialObject:(id)initialObject
                                         block:(id (^)(id accumulator, id object))block;

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

/**
 @return YES if all object in the receiver satisfy `predicate`.
 */
- (BOOL)tdt_allWithBlock:(TDTPredicateBlock)predicate;

/**
 Construct a dictionary from (key, value) pairs.

 @pre The reciever is expected to be of the form @p @[@[key, value] ..].
 */
- (NSDictionary *)tdt_dictionaryFromPairs;

/**
 Construct a dictionary from (key, value) pairs by collecting values keyed
 by the same key into arrays.

 Example:
 [(k1, v1), (k2, v2), (k1, v3)] => [k1: [v1, v3], k2: [v2]]

 @pre The reciever is expected to be of the form @p @[@[key, value] ..].
 */
- (NSDictionary *)tdt_dictionaryFromCombinedPairs;

@end

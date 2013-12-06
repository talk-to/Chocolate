#import <Foundation/Foundation.h>
#import "TDTFunctionalAdditionsBlockTypedefs.h"

@interface NSSet (TDTFunctionalAdditions)

/** 
 Creates a set from a collection. 
 
 - A collection can be either an `NSSet`, `NSArray` or an `NSDictionary`. 
 - In case its an `NSDictionary`, all of its values go into the set.
 */
+ (instancetype)setWithCollection:(id)collection;

/**
 Apply `selector` to every object in the receiver and return the set formed
 by collecting the results.
 */
- (NSSet *)setByMappingWithSelector:(SEL)selector;

/**
 Apply `block` to every object in the receiver and return the set formed
 by collecting the results.
 */
- (NSSet *)setByMappingWithBlock:(TDTMapBlock)block;

/**
 Apply `selector` to every object in the receiver.
 */
- (void)applySelector:(SEL)selector;

/**
 Apply `block` to every object in the receiver.
 */
- (void)applyBlock:(TDTApplyBlock)block;

/**
 @return A new set containing the objects in the receiver for which
         `predicate` returns YES.
 */
- (NSSet *)filteredSetUsingBlock:(TDTPredicateBlock)block;

/**
 @return YES if any object in the receiver satisfies `predicate`.
 */
- (BOOL)anyWithBlock:(TDTPredicateBlock)predicate;

@end

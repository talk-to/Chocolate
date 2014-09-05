#import <Foundation/Foundation.h>
#import "TDTFunctionalAdditionsBlockTypedefs.h"

@interface NSSet (TDTFunctionalAdditions)

/**
 Creates a set from a collection.

 - A collection can be either an `NSSet`, `NSArray` or an `NSDictionary`.
 - In case its an `NSDictionary`, all of its values go into the set.
 */
+ (instancetype)tdt_setWithCollection:(id)collection;

/**
 Apply `selector` to every object in the receiver and return the set formed
 by collecting the results.
 */
- (NSSet *)tdt_setByMappingWithSelector:(SEL)selector;

/**
 Apply `block` to every object in the receiver and return the set formed
 by collecting the results.
 */
- (NSSet *)tdt_setByMappingWithBlock:(TDTMapBlock)block;

/**
 Apply `selector` to every object in the receiver.
 */
- (void)tdt_applySelector:(SEL)selector;

/**
 Apply `block` to every object in the receiver.
 */
- (void)tdt_applyBlock:(TDTApplyBlock)block;

/**
 @return A new set containing the objects in the receiver for which
 `predicate` returns YES.
 */
- (NSSet *)tdt_filteredSetUsingBlock:(TDTPredicateBlock)block;

/**
 @return YES if any object in the receiver satisfies `predicate`.
 */
- (BOOL)tdt_anyWithBlock:(TDTPredicateBlock)predicate;

/**
 @see -[NSArray tdt_onlyObjectOrNil]
 */
- (id)tdt_onlyObjectOrNil;

@end

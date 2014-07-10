#import <Foundation/Foundation.h>
#import "TDTFunctionalAdditionsBlockTypedefs.h"

@interface NSDictionary (TDTFunctionalAdditions)

/**
 @return Dictionary obtained by transforming each @p (key, value) pair in
 the receiver with @p (key, block(value)).
 */
- (NSDictionary *)tdt_dictionaryByMappingValuesWithBlock:(TDTMapBlock)block;

/**
 @return Array obtained by transforming each @p (key, value) pair in
 the receiver with @p block(key, value).
 */
- (NSArray *)tdt_arrayByMappingEntriesWithBlock:(TDTMapEntryBlock)block;

/**
 @return Dictionary obtained by retaining only those (key, value) pairs from
 the receiver that satisfy @p predicate.
 */
- (NSDictionary *)tdt_dictionaryByFilteringUsingPredicate:(BOOL (^)(id key, id value))predicate;

@end

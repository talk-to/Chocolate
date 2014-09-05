#import "NSSet+TDTFunctionalAdditions.h"
#import "TDTAssert.h"
#import "TDTSuppressPerformSelectorLeakWarning.h"

@implementation NSSet (TDTFunctionalAdditions)

+ (instancetype)tdt_setWithCollection:(id)collection {
  if ([collection isKindOfClass:[NSSet class]]) {
    return [self setWithSet:collection];
  } else if ([collection isKindOfClass:[NSArray class]]) {
    return [self setWithArray:collection];
  } else if ([collection isKindOfClass:[NSDictionary class]]) {
    return [self setWithArray:[collection allValues]];
  } else {
    TDTAssertFailure(@"collection should be either an NSSet, NSArray or NSDictionary");
  }
}

#pragma mark Map

- (NSSet *)tdt_setByMappingWithSelector:(SEL)selector {
  NSMutableSet *result = [[NSMutableSet alloc] initWithCapacity:[self count]];
  for (id object in self) {
    TDTSuppressPerformSelectorLeakWarning([result addObject:[object performSelector:selector]]);
  }
  return result;
}

- (NSSet *)tdt_setByMappingWithBlock:(TDTMapBlock)block {
  NSMutableSet *result = [[NSMutableSet alloc] initWithCapacity:[self count]];
  for (id object in self) {
    [result addObject:block(object)];
  }
  return result;
}

#pragma mark Apply

- (void)tdt_applySelector:(SEL)selector {
  for (id object in self) {
    TDTSuppressPerformSelectorLeakWarning([object performSelector:selector]);
  }
}

- (void)tdt_applyBlock:(TDTApplyBlock)block {
  for (id object in self) {
    block(object);
  }
}

#pragma mark Filter

- (NSSet *)tdt_filteredSetUsingBlock:(TDTPredicateBlock)block {
  NSPredicate *predicate = [NSPredicate predicateWithBlock:^(id evaluatedObject, NSDictionary *bindings) {
    return block(evaluatedObject);
  }];
  return [self filteredSetUsingPredicate:predicate];
}

#pragma mark Any

- (BOOL)tdt_anyWithBlock:(TDTPredicateBlock)predicate {
  for (id obj in self) {
    if (predicate(obj)) {
      return YES;
    }
  }
  return NO;
}

#pragma mark -

- (id)tdt_onlyObjectOrNil {
  return (self.count == 1) ? [self anyObject] : nil;
}

@end

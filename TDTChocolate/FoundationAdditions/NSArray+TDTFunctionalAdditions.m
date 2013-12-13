#import "NSArray+TDTFunctionalAdditions.h"
#import "TDTSuppressPerformSelectorLeakWarning.h"

@implementation NSArray (TDTFunctionalAdditions)

#pragma mark Map

- (NSArray *)arrayByMappingWithBlock:(TDTMapBlock)block {
  NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity:self.count];
  for (id obj in self) {
    [result addObject:block(obj)];
  }
  return result;
}

-(NSArray *)arrayByMappingWithSelector:(SEL)selector {
  NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity:self.count];
  for (id obj in self) {
    TDTSuppressPerformSelectorLeakWarning([result addObject:[obj performSelector:selector]]);
  }
  return result;
}

#pragma mark Apply

- (void)applySelector:(SEL)selector {
  for (id object in self) {
    TDTSuppressPerformSelectorLeakWarning([object performSelector:selector]);
  }
}

- (void)applyBlock:(TDTApplyBlock)block {
  for (id object in self) {
    block(object);
  }
}

#pragma mark Filter

- (NSArray *)filteredArrayUsingBlock:(TDTPredicateBlock)block {
  NSPredicate *predicate = [NSPredicate predicateWithBlock:^(id evaluatedObject, NSDictionary *bindings) {
    return block(evaluatedObject);
  }];
  return [self filteredArrayUsingPredicate:predicate];
}

#pragma mark Partition

- (NSArray *)partitionUsingBlock:(TDTPredicateBlock)predicate {
  NSMutableArray *matching = [[NSMutableArray alloc] init];
  NSMutableArray *notMatching = [[NSMutableArray alloc] init];
  for (id obj in self) {
    if (predicate(obj)) {
      [matching addObject:obj];
    } else {
      [notMatching addObject:obj];
    }
  }
  return @[matching, notMatching];
}

#pragma mark Any

- (BOOL)anyWithBlock:(TDTPredicateBlock)predicate {
  for (id obj in self) {
    if (predicate(obj)) {
      return YES;
    }
  }
  return NO;
}

@end

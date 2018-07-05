#import "NSDictionary+TDTSubsetEquality.h"

static BOOL TDTPartialStructureEqualityIsMatch(id obj, id otherObj) {
  if (!otherObj) {
    return NO;
  } else if ([obj respondsToSelector:@selector(tdt_isSubsetOf:)]) {
    return [obj tdt_isSubsetOf:otherObj];
  } else if (![obj isEqual:otherObj]) {
    return NO;
  }
  return YES;
}

@implementation NSArray (TDTPartialStructureEquality)

- (BOOL)tdt_isSubsetOf:(NSArray *)array {
  if (![array isKindOfClass:[NSArray class]]) {
    return NO;
  }

  if (self.count != array.count) {
    return NO;
  }

  __block BOOL result = YES;
  [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    id otherObj = array[idx];
    if (!TDTPartialStructureEqualityIsMatch(obj, otherObj)) {
      *stop = YES;
      result = NO;
    }
  }];
  return result;
}

@end

@implementation NSDictionary (TDTPartialStructureEquality)

- (BOOL)tdt_isSubsetOf:(NSDictionary *)dict {
  if (![dict isKindOfClass:[NSDictionary class]]) {
    return NO;
  }

  __block BOOL result = YES;
  [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
    id otherObj = dict[key];
    if (!TDTPartialStructureEqualityIsMatch(obj, otherObj)) {
      *stop = YES;
      result = NO;
    }
  }];
  return result;
}

@end

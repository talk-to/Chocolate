#import "NSDictionary+TDTFunctionalAdditions.h"

@implementation NSDictionary (TDTFunctionalAdditions)

- (NSDictionary *)tdt_dictionaryByMappingValuesWithBlock:(TDTMapBlock)block {
  NSMutableDictionary *result = [NSMutableDictionary dictionaryWithCapacity:self.count];
  [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
    result[key] = block(obj);
  }];
  return result;
}

@end

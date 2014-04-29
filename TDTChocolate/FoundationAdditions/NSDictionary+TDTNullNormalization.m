#import "NSDictionary+TDTNullNormalization.h"
#import "NSArray+TDTNullNormalization.h"

@implementation NSDictionary (TDTNullNormalization)

- (NSDictionary *)tdt_dictionaryByRemovingNulls {
  NSMutableDictionary *modifiedDictionary = [NSMutableDictionary dictionaryWithCapacity:self.count];
  [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
    if ([obj isKindOfClass:[NSDictionary class]]) {
      modifiedDictionary[key] = [obj tdt_dictionaryByRemovingNulls];
    } else if ([obj isKindOfClass:[NSArray class]]) {
      modifiedDictionary[key] = [obj tdt_arrayByRemovingNulls];
    } else if ([obj isKindOfClass:[NSNull class]]) {
      // ignore
    } else {
      modifiedDictionary[key] = obj;
    }
  }];
  return modifiedDictionary;
}

@end

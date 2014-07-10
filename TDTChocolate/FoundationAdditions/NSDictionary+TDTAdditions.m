#import "NSDictionary+TDTAdditions.h"

@implementation NSDictionary (TDTAdditions)

- (NSDictionary *)tdt_dictionaryByMergingDictionary:(NSDictionary *)dict {
  NSMutableDictionary *result = [self mutableCopy];
  [result addEntriesFromDictionary:dict];
  return result;
}

- (NSDictionary *)tdt_dictionaryByRemovingEntryForKey:(id)key {
  NSMutableDictionary *dict = [self mutableCopy];
  [dict removeObjectForKey:key];
  return [dict copy];
}

@end

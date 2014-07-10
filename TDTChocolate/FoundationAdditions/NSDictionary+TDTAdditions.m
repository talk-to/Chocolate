#import "NSDictionary+TDTAdditions.h"

@implementation NSDictionary (TDTAdditions)

- (NSDictionary *)tdt_dictionaryByMergingDictionary:(NSDictionary *)dict {
  NSMutableDictionary *result = [self mutableCopy];
  [result addEntriesFromDictionary:dict];
  return result;
}

@end

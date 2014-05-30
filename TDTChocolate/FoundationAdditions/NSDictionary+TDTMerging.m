#import "NSDictionary+TDTMerging.h"

@implementation NSDictionary (TDTMerging)

- (NSDictionary *)tdt_dictionaryByMergingDictionary:(NSDictionary *)dict {
  NSMutableDictionary *result = [self mutableCopy];
  [result addEntriesFromDictionary:dict];
  return result;
}

@end

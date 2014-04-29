#import "NSArray+TDTNullNormalization.h"
#import "NSDictionary+TDTNullNormalization.h"

@implementation NSArray (TDTNullNormalization)

- (NSArray *)tdt_arrayByRemovingNulls {
  NSMutableArray *modifiedArray = [NSMutableArray arrayWithCapacity:self.count];
  for (id obj in self) {
    if ([obj isKindOfClass:[NSDictionary class]]) {
      [modifiedArray addObject:[obj tdt_dictionaryByRemovingNulls]];
    } else if ([obj isKindOfClass:[NSArray class]]) {
      [modifiedArray addObject:[obj tdt_arrayByRemovingNulls]];
    } else if ([obj isKindOfClass:[NSNull class]]) {
      // ignore
    } else {
      [modifiedArray addObject:obj];
    }
  }
  return modifiedArray;
}


@end

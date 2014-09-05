#import "NSDictionary+TDTAdditions.h"
#import "TDTAssert.h"

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

- (BOOL)tdt_writeInBinaryFormatToFile:(NSString *)path
                           atomically:(BOOL)useAuxiliaryFile {
  TDTParameterAssert(path);
  NSData *data = [NSPropertyListSerialization dataWithPropertyList:self
                                                            format:NSPropertyListBinaryFormat_v1_0
                                                           options:0
                                                             error:NULL];
  if (!data) {
    return NO;
  }

  return [data writeToFile:path atomically:useAuxiliaryFile];
}

@end

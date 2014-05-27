#import <Foundation/Foundation.h>

@interface NSDictionary (TDTMerging)

/**
 Wrapper over `[NSMutableDictionary addEntriesFromDictionary:]`.
 */
- (NSDictionary *)tdt_dictionaryByMergingDictionary:(NSDictionary *)dict;

@end

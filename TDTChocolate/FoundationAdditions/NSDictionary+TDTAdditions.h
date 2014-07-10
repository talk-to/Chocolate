#import <Foundation/Foundation.h>

@interface NSDictionary (TDTAdditions)

/**
 Construct a dictionary by adding entries from @p dict into the receiver.

 If the same key exists in both dictionaries, then the value from the
 argument @p dict is used.
 */
- (NSDictionary *)tdt_dictionaryByMergingDictionary:(NSDictionary *)dict;

@end

#import <Foundation/Foundation.h>

@interface NSDictionary (TDTAdditions)

/**
 Construct a dictionary by adding entries from @p dict into the receiver.

 If the same key exists in both dictionaries, then the value from the
 argument @p dict is used.
 */
- (NSDictionary *)tdt_dictionaryByMergingDictionary:(NSDictionary *)dict;

/**
 Construct a dictionary by removing an entry corresponding to @p key
 from the receiver.

 The receiver is returned unchanged if the @p key is not present.
 @note @p key should not be @p nil.
 */
- (NSDictionary *)tdt_dictionaryByRemovingEntryForKey:(id)key;

@end

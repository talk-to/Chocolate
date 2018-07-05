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

/**
 Write a plist in the @p NSPropertyListBinaryFormat_v1_0 format.

 This file can be later read-in via the stock @p dictionaryWithContentsOfFile.

 @discussion Milliseconds in dates are not preserved when writing dictionaries
 in the XML format (as is done by the stock @p writeToFile:atomically method).
 */
- (BOOL)tdt_writeInBinaryFormatToFile:(NSString *)path
                           atomically:(BOOL)useAuxiliaryFile;

/**
 *  Gives the JSON representation of the receiver.
 *
 *  @return JSON in string.
 */
- (NSString *)tdt_JSONString;

@end

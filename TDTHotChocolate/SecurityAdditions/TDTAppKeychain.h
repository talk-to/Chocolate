#import <Security/Security.h>

/**
 A key-value interface over the iOS provided Application specific Keychain.

 @note These functions are in thread agnostic, but not thread safe; races
       could occur if two threads simultaneosly try to access/modify the value
       associated with the same prefix and key.
 */

/**
 Set the Keychain entry corresponding to `prefix` and `key` to `data`.
 @note It is an error to pass `nil` for the `data` parameter. If you wish to
       delete the Keychain entry, use the `TDTAppKeychainRemoveData` function.
 */
void TDTAppKeychainSetData(NSData *data, NSString *prefix, NSString *key);

/**
 Remove the entry corresponding to the given `prefix` and `key`.
 */
void TDTAppKeychainRemoveData(NSString *prefix, NSString *key);

/**
 @return Data corresponding to given `prefix` and `key` pair, or nil.
 */
NSData *TDTAppKeychainGetData(NSString *prefix, NSString *key);

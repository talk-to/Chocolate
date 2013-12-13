#import "TDTAppKeychain.h"
#import "../FoundationAdditions/TDTAssert.h"

void TDTAppKeychainSetData(NSData *data, NSString *prefix, NSString *key) {
  TDTCParameterAssert(data);
  TDTCParameterAssert(key);
  TDTCParameterAssert(prefix);

  NSData *keyData = [key dataUsingEncoding:NSUTF8StringEncoding];
  NSData *prefixData = [prefix dataUsingEncoding:NSUTF8StringEncoding];

  NSMutableDictionary *query = [NSMutableDictionary dictionary];
  query[(__bridge id)kSecClass] = (__bridge id)kSecClassGenericPassword;
  query[(__bridge id)kSecAttrAccount] = prefixData;
  query[(__bridge id)kSecAttrService] = keyData;

  OSStatus status = SecItemCopyMatching((__bridge CFDictionaryRef)query, NULL);
  if (status == errSecItemNotFound) {
    NSMutableDictionary *attributes = query;
    attributes[(__bridge id)kSecValueData] = data;
    attributes[(__bridge id)kSecAttrAccessible] = (__bridge id)kSecAttrAccessibleAfterFirstUnlock;
    status = SecItemAdd((__bridge CFDictionaryRef)attributes, NULL);
    TDTCAssert(status == noErr,
               @"SecItemAdd (%@:%@) failed: %d", prefix, key, (int)status);
  } else if (status == noErr) {
    NSMutableDictionary *attributesToUpdate = [NSMutableDictionary dictionaryWithObject:data forKey:(__bridge id)kSecValueData];
    status = SecItemUpdate((__bridge CFDictionaryRef)query, (__bridge CFDictionaryRef)attributesToUpdate);
    TDTCAssert(status == noErr,
               @"SecItemUpdate (%@:%@) failed: %d", prefix, key, (int)status);
  }
}

void TDTAppKeychainRemoveData(NSString *prefix, NSString *key) {
  TDTCParameterAssert(key);
  TDTCParameterAssert(prefix);

  NSData *keyData = [key dataUsingEncoding:NSUTF8StringEncoding];
  NSData *prefixData = [prefix dataUsingEncoding:NSUTF8StringEncoding];

  NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
  attributes[(__bridge id)kSecClass] = (__bridge id)kSecClassGenericPassword;
  attributes[(__bridge id)kSecAttrAccount] = prefixData;
  attributes[(__bridge id)kSecAttrService] = keyData;

  OSStatus status = SecItemDelete((__bridge CFDictionaryRef)attributes);
  TDTCAssert(status == noErr,
             @"SecItemDelete (%@:%@) failed: %d", prefix, key, (int)status);
}

NSData *TDTAppKeychainGetData(NSString *prefix, NSString *key) {
  TDTCParameterAssert(key);
  TDTCParameterAssert(prefix);

  NSData *keyData = [key dataUsingEncoding:NSUTF8StringEncoding];
  NSData *prefixData = [prefix dataUsingEncoding:NSUTF8StringEncoding];

  NSMutableDictionary *query = [NSMutableDictionary dictionary];
  query[(__bridge id)kSecClass] = (__bridge id)kSecClassGenericPassword;
  query[(__bridge id)kSecReturnData] = (id)kCFBooleanTrue;
  query[(__bridge id)kSecMatchLimit] = (__bridge id)kSecMatchLimitOne;
  query[(__bridge id)kSecAttrAccount] = prefixData;
  query[(__bridge id)kSecAttrService] = keyData;

  CFDataRef valueData;
  OSStatus status = SecItemCopyMatching((__bridge CFDictionaryRef)query, (CFTypeRef *)&valueData);
  if (status != noErr) {
    TDTCAssert(status == errSecItemNotFound,
               @"SecItemCopyMatching (%@:%@) failed: %d", prefix, key, (int)status);
    return nil;
  }

  NSData *data = CFBridgingRelease(valueData);
  return data;
}

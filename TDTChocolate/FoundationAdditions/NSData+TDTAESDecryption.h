#import <Foundation/Foundation.h>

@interface NSData (TDTAESDecryption)

/**
 Decrypt data encrypted using:

 $ openssl aes-128-cbc -K <key-hex-digits> -iv 0

 @pre The receiver must be at least 16 bytes long.
 @return NSData object containing the decrypted data.
 */
- (NSData *)tdt_dataByReversingAES128CBCWithKey:(NSData *)key;

@end

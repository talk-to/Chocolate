#import "NSData+TDTAESDecryption.h"
#import "TDTAssert.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation NSData (TDTAESDecryption)

- (NSData *)tdt_dataByReversingAES128CBCWithKey:(NSData *)key {
  char keyPtr[kCCKeySizeAES128];
  bzero(keyPtr, sizeof(keyPtr)); // fill with zeroes (for padding)
  memcpy(keyPtr, [key bytes], [key length]);

  TDTAssert(self.length >= kCCBlockSizeAES128,
            @"cannot decrypt data smaller than an AES block");

  // Note: Assuming that in no case will the decrypted data will have size
  // larger than the encrypted data.
  uint8_t *bufferPtr = malloc(self.length * sizeof(uint8_t));
  size_t movedBytes = 0;

  CCCryptorStatus ccStatus = CCCrypt(kCCDecrypt,
                                     kCCAlgorithmAES128,
                                     kCCOptionPKCS7Padding,
                                     (const void *)keyPtr,
                                     kCCKeySizeAES128,
                                     NULL,
                                     (const void *)[self bytes],
                                     self.length,
                                     (void *)bufferPtr,
                                     self.length,
                                     &movedBytes);

  TDTAssert(ccStatus == kCCSuccess, @"decryption failed with status code %d", ccStatus);

  return [NSData dataWithBytesNoCopy:bufferPtr length:movedBytes freeWhenDone:YES];
}

@end

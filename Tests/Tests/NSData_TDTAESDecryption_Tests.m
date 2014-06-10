#import <XCTest/XCTest.h>
#import <TDTChocolate/TDTFoundationAdditions.h>

@interface NSData_TDTAESDecryption_Tests : XCTestCase

@end

@implementation NSData_TDTAESDecryption_Tests

- (void)testSampleDecryption {
  NSData *originalData = [@"test" dataUsingEncoding:NSASCIIStringEncoding];
  const uint8_t keyBytes[] = { 0xde, 0xad, 0xbe, 0xef }; // deadbeef
  // $ echo -n 'test' | openssl aes-128-cbc -K 'deadbeef' -iv 0 | xxd -include
  const uint8_t encryptedBytes[] = {
    0xc5, 0x8b, 0x8c, 0x85, 0xde, 0x74, 0x48, 0xa0, 0x36, 0x3d, 0x39, 0x6f,
    0x88, 0x22, 0x59, 0x3b
  };
  NSData *key = TDT_NSDATA_FROM_BYTE_ARRAY(keyBytes);
  NSData *encryptedData = TDT_NSDATA_FROM_BYTE_ARRAY(encryptedBytes);
  XCTAssertEqualObjects([encryptedData tdt_dataByReversingAES128CBCWithKey:key],
                       originalData);
}

@end

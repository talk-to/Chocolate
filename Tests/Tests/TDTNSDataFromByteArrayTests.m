#import <XCTest/XCTest.h>
#import <TDTChocolate/FoundationAdditions/TDTNSDataFromByteArray.h>

@interface TDTNSDataFromByteArrayTests : XCTestCase

@end

@implementation TDTNSDataFromByteArrayTests

- (void)testNSDataConstructionFromNonEmptyByteArray {
  uint8_t bytes[] = { 0xab, 0xcd };
  NSData *data = TDT_NSDATA_FROM_BYTE_ARRAY(bytes);
  XCTAssertEqual(data.length, (NSUInteger)2);
  const uint8_t *dataBytes = data.bytes;
  XCTAssertEqual(dataBytes[0], bytes[0]);
  XCTAssertEqual(dataBytes[1], bytes[1]);
}

- (void)testNSDataConstructionFromEmptyByteArray {
  uint8_t bytes[] = { };
  NSData *data = TDT_NSDATA_FROM_BYTE_ARRAY(bytes);
  XCTAssertEqual(data.length, (NSUInteger)0);
}

@end

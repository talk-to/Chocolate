#import <XCTest/XCTest.h>
#import <TDTChocolate/FoundationAdditions/NSData+TDTAdditions.h>

@interface NSData_TDTAdditions_Tests : XCTestCase

@end

@implementation NSData_TDTAdditions_Tests

- (void)testHexRepresentation {
  static const uint8_t bytes[4] = { 0xde, 0xad, 0xbe, 0xef };
  NSData *data = [NSData dataWithBytes:bytes length:4];
  XCTAssertEqualObjects([data tdt_hexRepresentation], @"deadbeef");
}

@end

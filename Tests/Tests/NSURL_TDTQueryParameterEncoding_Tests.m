#import <XCTest/XCTest.h>
#import <TDTChocolate/TDTFoundationAdditions.h>

@interface NSURL_TDTQueryParameterEncoding_Tests : XCTestCase

@end

@implementation NSURL_TDTQueryParameterEncoding_Tests

- (void)testEncodingOfSpecialCharacters {
  NSDictionary *parameters = @{ @"msg": @"Hello, World" };
  NSURL *receiver = [NSURL URLWithString:@"http://example.com"];
  NSURL *result = [receiver tdt_URLWithQueryParameters:parameters];
  XCTAssertEqualObjects(@"http://example.com?msg=Hello%2C%20World",
                        [result absoluteString]);
}

- (void)testEncodingWhenMultipleParameters {
  NSDictionary *parameters = @{ @"x": @"a", @"y": @"b" };
  NSURL *receiver = [NSURL URLWithString:@"http://example.com"];
  NSURL *result = [receiver tdt_URLWithQueryParameters:parameters];
  XCTAssertEqualObjects(@"http://example.com?x=a&y=b", [result absoluteString]);
}

@end

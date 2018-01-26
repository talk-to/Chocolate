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

- (void)testEncodingOfSpacesAndPlus {
  NSDictionary *parameters = @{@"q": @"blue+light blue"};
  NSURL *receiver = [NSURL URLWithString:@"http://example.com"];
  NSURL *result = [receiver tdt_URLWithQueryParameters:parameters];
  XCTAssertEqualObjects(@"http://example.com?q=blue%2Blight%20blue",
                        [result absoluteString]);
}

- (void)testEncodingWhenMultipleParameters {
  NSDictionary *parameters = @{ @"x": @"a", @"y": @"b" };
  NSURL *receiver = [NSURL URLWithString:@"http://example.com"];
  NSURL *result = [receiver tdt_URLWithQueryParameters:parameters];
  XCTAssertEqualObjects(@"http://example.com?x=a&y=b", [result absoluteString]);
}

- (void)testEncodingOfPipeCharacter {
  NSDictionary *parameters = @{ @"x": @"a|b", @"y": @"b|c" };
  NSURL *receiver = [NSURL URLWithString:@"http://example.com"];
  NSURL *result = [receiver tdt_URLWithQueryParameters:parameters];
  XCTAssertEqualObjects(@"http://example.com?x=a%7Cb&y=b%7Cc", [result absoluteString]);
}

@end

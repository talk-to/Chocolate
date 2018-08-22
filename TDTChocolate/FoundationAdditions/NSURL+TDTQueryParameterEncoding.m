#import "NSURL+TDTQueryParameterEncoding.h"
#import "NSDictionary+TDTFunctionalAdditions.h"

#pragma mark Helper Category on Strings

@interface NSString (TDTQueryParameterEncoding)

- (NSString *)tdt_stringByEncodingQueryParameter;

@end

@implementation NSString (TDTQueryParameterEncoding)

- (NSString *)tdt_stringByEncodingQueryParameter {
  NSString *charactersToEscape = @"!*'();:@&=+$,/?%#[]\" |<>{}`^~\\";
  NSCharacterSet *allowedCharacters = [[NSCharacterSet characterSetWithCharactersInString:charactersToEscape] invertedSet];
  return [self stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacters];
}

@end

#pragma mark -

@implementation NSURL (TDTQueryParameterEncoding)

- (NSURL *)tdt_URLWithQueryParameters:(NSDictionary *)parameters {
  NSArray *encodedParameters = [parameters tdt_arrayByMappingEntriesWithBlock:^id(id key, id value) {
    NSString *stringValue = [[value description] tdt_stringByEncodingQueryParameter];
    return [@[key, stringValue] componentsJoinedByString:@"="];
  }];
  NSArray *URLComponents = @[[self absoluteString],
                             [encodedParameters componentsJoinedByString:@"&"]];
  return (([URLComponents[0] rangeOfString:@"?"].location != NSNotFound)
          ? [NSURL URLWithString:[URLComponents componentsJoinedByString:@"&"]]
          : [NSURL URLWithString:[URLComponents componentsJoinedByString:@"?"]]);
}

@end

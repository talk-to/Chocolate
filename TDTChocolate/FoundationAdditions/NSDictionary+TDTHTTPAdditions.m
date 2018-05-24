//
//  NSDictionary+TDTHTTPAdditions.m
//  Talkto
//
//  Created by Amandeep Singh on 8/24/17.
//  Copyright © 2017 Talk.to FZC. All rights reserved.
//

#import "NSDictionary+TDTHTTPAdditions.h"

@implementation NSDictionary (TDTHTTPAdditions)

- (NSString *)tdt_queryString {
  NSMutableArray *queryArray = [@[] mutableCopy];
  for (NSString *key in self) {
    NSString *queryKey = [key description];
    NSString *queryValue = [[self objectForKey:key] description];
    [queryArray addObject:[NSString stringWithFormat:@"%@=%@",
                           [[self class] urlEncodedString:queryKey],
                           [[self class] urlEncodedString:queryValue]]];
  }
  NSString *queryString = [queryArray componentsJoinedByString:@"&"];
  return [@"?" stringByAppendingString:queryString];
}

+ (NSString *)urlEncodedString:(NSString *)string {
  NSCharacterSet *allowedCharacters = [NSCharacterSet URLFragmentAllowedCharacterSet];
  return [string stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacters];
}

@end

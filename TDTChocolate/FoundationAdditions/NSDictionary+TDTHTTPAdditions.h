//
//  NSDictionary+TDTHTTPAdditions.h
//  Talkto
//
//  Created by Amandeep Singh on 8/24/17.
//  Copyright © 2017 Talk.to FZC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (TDTHTTPAdditions)

/**
 This method generates a HTTP Request query string 
 from the dictionary's key value pairs.
 */
- (NSString *)tdt_queryString;

@end


#import "TDTURLQueryComponents.h"

@implementation NSString (TDTURLQueryComponents)
- (NSString *)tdt_stringByDecodingURLFormat
{
  NSString *result = [self stringByReplacingOccurrencesOfString:@"+" withString:@" "];
  result = [result stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
  return result;
}

- (NSString *)tdt_stringByEncodingURLFormat
{
  NSString *result = [self stringByReplacingOccurrencesOfString:@" " withString:@"+"];
  result = [result stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
  return result;
}

- (NSMutableDictionary *)tdt_dictionaryFromQueryComponents
{
  NSMutableDictionary *queryComponents = [NSMutableDictionary dictionary];
  for(NSString *keyValuePairString in [self componentsSeparatedByString:@"&"])
  {
    NSArray *keyValuePairArray = [keyValuePairString componentsSeparatedByString:@"="];
    if ([keyValuePairArray count] < 2) continue; // Verify that there is at least one key, and at least one value.  Ignore extra = signs
    NSString *key = [[keyValuePairArray objectAtIndex:0] tdt_stringByDecodingURLFormat];
    NSString *value = [[keyValuePairArray objectAtIndex:1] tdt_stringByDecodingURLFormat];
    NSMutableArray *results = [queryComponents objectForKey:key]; // URL spec says that multiple values are allowed per key
    if(!results) // First object
    {
      results = [NSMutableArray arrayWithCapacity:1];
      [queryComponents setObject:results forKey:key];
    }
    [results addObject:value];
  }
  return queryComponents;
}
@end

@implementation NSURL (TDTURLQueryComponents)
- (NSMutableDictionary *)tdt_queryComponents
{
  return [[self query] tdt_dictionaryFromQueryComponents];
}

- (NSURL *)tdt_URLByAppendingQueryComponents:(NSDictionary *)queryComponents {
  NSURLComponents *components = [NSURLComponents componentsWithURL:self resolvingAgainstBaseURL:YES];
  components.query = [queryComponents tdt_stringFromQueryComponents];
  return [components URL];
}
@end

@implementation NSDictionary (TDTURLQueryComponents)
- (NSString *)tdt_stringFromQueryComponents
{
  NSString *result = nil;
  for(__strong NSString *key in [self allKeys])
  {
    key = [key tdt_stringByEncodingURLFormat];
    NSArray *allValues = [self objectForKey:key];
    if([allValues isKindOfClass:[NSArray class]])
      for(__strong NSString *value in allValues)
      {
        value = [[value description] tdt_stringByEncodingURLFormat];
        if(!result)
          result = [NSString stringWithFormat:@"%@=%@",key,value];
        else
          result = [result stringByAppendingFormat:@"&%@=%@",key,value];
      }
    else {
      NSString *value = [[allValues description] tdt_stringByEncodingURLFormat];
      if(!result)
        result = [NSString stringWithFormat:@"%@=%@",key,value];
      else
        result = [result stringByAppendingFormat:@"&%@=%@",key,value];
    }
  }
  return result;
}
@end

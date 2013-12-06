#import "NSString+TDTNegation.h"

@implementation NSString (TDTNegation)

- (NSString *)negation {
  return [@"Not " stringByAppendingString:self];
}

@end

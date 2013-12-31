#import "TDTNSStringExtendedComparison.h"
#import "NSString+TDTAdditions.h"

BOOL TDTNSStringEqualToStringExtended(NSString *x, NSString *y) {
  x = [[x stringByTrimmingWhitespaceAndNewlines] stringByNillingBlanks];
  y = [[y stringByTrimmingWhitespaceAndNewlines] stringByNillingBlanks];
  return x == y || [x isEqual:y];
}

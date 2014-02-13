#import "TDTNSStringExtendedComparison.h"
#import "NSString+TDTAdditions.h"

BOOL TDTNSStringEqualToStringExtended(NSString *x, NSString *y) {
  x = [[x tdt_stringByTrimmingWhitespaceAndNewlines] tdt_stringByNillingBlanks];
  y = [[y tdt_stringByTrimmingWhitespaceAndNewlines] tdt_stringByNillingBlanks];
  return x == y || [x isEqual:y];
}

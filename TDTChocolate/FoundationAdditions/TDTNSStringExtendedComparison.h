#import <Foundation/Foundation.h>

/**
 Perform an extended equality check between two strings by considering `nil`,
 empty strings and strings with only whitespace and newline characters to
 be equal (on top of the usual string equality).
 */
BOOL TDTNSStringEqualToStringExtended(NSString *x, NSString *y);

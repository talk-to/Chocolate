#import <Foundation/Foundation.h>

@interface NSString (TDTVersionComparison)

/**
 Compare the receiver with `string` after interpreting both of them as
 strings representing "version"s.

 Example of a version string: @"1.2.3.4-optional_label"

 @pre The result is undefined if either the receiver or `string` does not
 conform to the expected version format.
 */
- (NSComparisonResult)tdt_versionCompare:(NSString *)string;

@end

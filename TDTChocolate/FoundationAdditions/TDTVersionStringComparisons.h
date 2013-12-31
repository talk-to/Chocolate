#import <Foundation/Foundation.h>

/**
 Compare two strings representing "version"s.
 
 Example: 1.2.3.4-optional_label
 */
NSComparisonResult TDTCompareVersionStrings(NSString *v1, NSString *v2);

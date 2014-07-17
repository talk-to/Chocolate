#import <Foundation/Foundation.h>

/**
 Custom asserts that provide better error messages when the assert fails.
 */

/**
 Assert that @p array contains @p object
 */
#define TDTXCTAssertContains(array, object) \
XCTAssertTrue([(array) containsObject:(object)], @"Expected %@ to contain %@", (array), (object))

/**
 Assert that @p string contains @p substring
 */
#define TDTXCTAssertContainsString(string, substring) \
XCTAssertTrue([(string) tdt_containsString:(substring)], @"Expected %@ to contain %@", (string), (substring))

/**
 Assert that @p a is <= @p b.
 */
#define TDTXCTAssertEarlierEqualDate(a, b) \
XCTAssertTrue([(a) tdt_isEarlierThanOrEqualToDate:(b)], @"Expected %@ to be earlier than or same as %@", (a), (b))

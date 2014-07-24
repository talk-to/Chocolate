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
XCTAssertTrue([(string) rangeOfString:(substring)].location != NSNotFound, @"Expected %@ to contain %@", (string), (substring))

/**
 Assert that @p a is <= @p b.
 */
#define TDTXCTAssertEarlierThanOrEqualToDate(a, b) \
XCTAssertTrue([(a) compare:(b)] != NSOrderedDescending, @"Expected %@ to be earlier than or equal to %@", (a), (b))

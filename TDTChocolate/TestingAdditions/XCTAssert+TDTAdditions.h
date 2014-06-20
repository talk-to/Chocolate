#import <Foundation/Foundation.h>

#define TDTXCTAssertContains(array, value) \
XCTAssertTrue([(array) containsObject:(value)], @"Expected %@ to contain %@", (array), (value))

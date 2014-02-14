#import <Foundation/Foundation.h>

@interface NSArray (TDTRangeAdditions)

/**
 Construct a range from the start of the receiver until `index`.

 @param index It must be less than the length of the receiver.
 @return NSRange with location 0 and length equal to `index`.
 */
- (NSRange)tdt_rangeToIndex:(NSUInteger)index;

/**
 Construct a range from `index` upto the end of the receiver.

 @param index It must be less than the length of the receiver.
 @return NSRange with location equal to `index` and length equal to the
 number of elements in the remainder of the receiver.
 */
- (NSRange)tdt_rangeFromIndex:(NSUInteger)index;

@end

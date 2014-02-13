#import <Foundation/Foundation.h>

@interface NSInvocation (TDTIndexTranslation)

/**
 Translate the `index` of the argument of a selector into the index that
 `NSInvocation` uses to reference the same argument.
 */

+ (NSInteger)tdt_invocationIndexForIndex:(NSUInteger)index;

@end

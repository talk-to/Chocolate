#import "NSInvocation+TDTIndexTranslation.h"

@implementation NSInvocation (TDTIndexTranslation)

+ (NSInteger)invocationIndexForIndex:(NSUInteger)index {
  return  2 + (NSInteger)index;
}

@end

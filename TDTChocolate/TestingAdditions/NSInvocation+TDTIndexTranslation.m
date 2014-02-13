#import "NSInvocation+TDTIndexTranslation.h"

@implementation NSInvocation (TDTIndexTranslation)

+ (NSInteger)tdt_invocationIndexForIndex:(NSUInteger)index {
  return  2 + (NSInteger)index;
}

@end

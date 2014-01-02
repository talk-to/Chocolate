#import "NSString+TDTVersionComparison.h"

@implementation NSString (TDTVersionComparison)

- (NSComparisonResult)versionCompare:(NSString *)other {
  NSArray *baseVersionFields = [self componentsSeparatedByString:@"."];
  NSArray *newVersionFields = [other componentsSeparatedByString:@"."];

  NSUInteger minVersionFieldsCount = MIN([newVersionFields count], [baseVersionFields count]);
  for (NSUInteger index = 0; index < minVersionFieldsCount; index++) {
    NSCharacterSet *separators = [NSCharacterSet characterSetWithCharactersInString:@"_-"];
    NSString *baseFieldString = [baseVersionFields[index] componentsSeparatedByCharactersInSet:separators][0];
    NSString *newFieldString = [newVersionFields[index] componentsSeparatedByCharactersInSet:separators][0];
    NSInteger baseField = [baseFieldString integerValue];
    NSInteger newField = [newFieldString integerValue];

    if (newField > baseField) {
      return NSOrderedAscending;
    } else if (newField < baseField) {
      return NSOrderedDescending;
    }
  }
  if ([newVersionFields count] > [baseVersionFields count]) {
    return NSOrderedAscending;
  } else if ([newVersionFields count] < [baseVersionFields count]) {
    return NSOrderedDescending;
  } else {
    return NSOrderedSame;
  }
}

@end

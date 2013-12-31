#import "TDTVersionStringComparisons.h"

NSComparisonResult TDTCompareVersionStrings(NSString *v1, NSString *v2) {
  NSArray *baseVersionFields = [v1 componentsSeparatedByString:@"."];
  NSArray *newVersionFields = [v2 componentsSeparatedByString:@"."];

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

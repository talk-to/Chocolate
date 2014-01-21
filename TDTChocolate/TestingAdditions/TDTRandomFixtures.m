#import "TDTRandomFixtures.h"
#import "../FoundationAdditions/TDTAssert.h"

@implementation NSString (TDTRandomFixtures)

+ (instancetype)randomString {
  return [self stringWithFormat:@"%u", arc4random()];
}

@end

@implementation NSData (TDTRandomFixtures)

+ (instancetype)randomData {
  return [[NSString randomString] dataUsingEncoding:NSUTF8StringEncoding];
}

@end

@implementation NSNumber (TDTRandomFixtures)

+ (instancetype)randomNumber {
  return [NSNumber numberWithLong:arc4random()];
}

@end

@implementation NSArray (TDTRandomFixtures)

+ (instancetype)randomArrayOfLength:(NSUInteger)length {
  NSMutableArray *result = [NSMutableArray arrayWithCapacity:length];
  for (NSUInteger i = 0; i < length; i += 1) {
    id randomObject;
    switch (arc4random() % 3) {
      case 0:
        randomObject = [NSString randomString];
        break;
      case 1:
        randomObject = [NSNumber randomNumber];
        break;
      case 2:
        randomObject = [NSArray randomArrayOfLength:1];
        break;
      default:
        TDTAssertFailure(@"Unexpected Case");
    }
    [result addObject:randomObject];
  }
  return result;
}

@end

@implementation NSURL (TDTRandomFixtures)

+ (instancetype)randomURL {
  return [self URLWithString:[NSString randomString]];
}

@end

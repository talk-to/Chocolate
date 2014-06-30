#import "TDTRandomFixtures.h"
#import "../FoundationAdditions/TDTAssert.h"

@implementation NSString (TDTRandomFixtures)

+ (instancetype)tdt_randomString {
  return [self stringWithFormat:@"%u", arc4random()];
}

@end

@implementation NSData (TDTRandomFixtures)

+ (instancetype)tdt_randomData {
  return [[NSString tdt_randomString] dataUsingEncoding:NSUTF8StringEncoding];
}

@end

@implementation NSNumber (TDTRandomFixtures)

+ (instancetype)tdt_randomNumber {
  return [NSNumber numberWithLong:arc4random()];
}

@end

@implementation NSArray (TDTRandomFixtures)

+ (instancetype)tdt_randomArrayOfLength:(NSUInteger)length {
  NSMutableArray *result = [NSMutableArray arrayWithCapacity:length];
  for (NSUInteger i = 0; i < length; i += 1) {
    id randomObject;
    switch (arc4random() % 3) {
      case 0:
        randomObject = [NSString tdt_randomString];
        break;
      case 1:
        randomObject = [NSNumber tdt_randomNumber];
        break;
      case 2:
        randomObject = [NSArray tdt_randomArrayOfLength:1];
        break;
      default:
        TDTAssertFailure();
    }
    [result addObject:randomObject];
  }
  return result;
}

@end

@implementation NSURL (TDTRandomFixtures)

+ (instancetype)tdt_randomURL {
  return [self URLWithString:[NSString tdt_randomString]];
}

@end

@implementation NSDate (TDTRandomFixtures)

+ (instancetype)tdt_randomDate {
  NSTimeInterval randomTimeInterval = arc4random();
  return [self dateWithTimeIntervalSince1970:randomTimeInterval];
}

@end

@implementation NSDictionary (TDTRandomFixtures)

+ (instancetype)tdt_randomDictionary {
  return @{ [NSString tdt_randomString] : [NSString tdt_randomString] };
}

@end

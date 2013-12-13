#import <Foundation/Foundation.h>

/**
 Category methods on commonly used types for generating random instances.

 Inspired by Haskell's QuickCheck.
 */

@interface NSString (TDTRandomFixtures)

+ (instancetype)randomString;

@end

@interface NSNumber (TDTRandomFixtures)

+ (instancetype)randomNumber;

@end

@interface NSArray (TDTRandomFixtures)

+ (instancetype)randomArrayOfLength:(NSUInteger)length;

@end

@interface NSURL (TDTRandomFixtures)

+ (instancetype)randomURL;

@end

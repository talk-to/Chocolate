#import <Foundation/Foundation.h>

/**
 Category methods on commonly used types for generating random instances.

 Inspired by Haskell's QuickCheck.
 */

@interface NSString (TDTRandomFixtures)

/**
 @return A string consisting of random characters.
 It is guranteed to be non empty.
 */
+ (instancetype)tdt_randomString;

@end

@interface NSData (TDTRandomFixtures)

/**
 @return Data consisting of random bytes.
 It is guranteed to be non empty.
 */
+ (instancetype)tdt_randomData;

@end

@interface NSNumber (TDTRandomFixtures)

+ (instancetype)tdt_randomNumber;

@end

@interface NSArray (TDTRandomFixtures)

+ (instancetype)tdt_randomArrayOfLength:(NSUInteger)length;

@end

@interface NSURL (TDTRandomFixtures)

+ (instancetype)tdt_randomURL;

@end

@interface NSDate (TDTRandomFixtures)

+ (instancetype)tdt_randomDate;

@end

@interface NSDictionary (TDTRandomFixtures)

/**
 @return A dictionary consisting of a random string key-value pair.
 */
+ (instancetype)tdt_randomDictionary;

@end

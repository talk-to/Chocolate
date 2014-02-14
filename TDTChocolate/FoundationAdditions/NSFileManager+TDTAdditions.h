#import <Foundation/Foundation.h>

@interface NSFileManager (TDTAdditions)

/**
 @return URL to the any directory which matches the given search path in
 the User's domain.
 */
- (NSURL *)tdt_userURLForDirectory:(NSSearchPathDirectory)directory;

/**
 Creates a temporary file in a suitable temporary directory.

 The generated file has a name of the form "prefix-random.suffix",
 where "random" denotes a string of random integers to gurantee uniqueness.

 @return URL to the temporary file.
 */
- (NSURL *)tdt_fileURLToTemporaryFileWithNamePrefix:(NSString *)prefix
                                             suffix:(NSString *)suffix;

@end

#import "NSFileManager+TDTTemporaryFilePaths.h"

@implementation NSFileManager (TDTTemporaryFilePaths)

/**
 Simplified version of `tdt_fileURLToTemporaryFileWithNamePrefix:suffix:`
 */
- (NSString *)tdt_temporaryFilePath {
  NSString *UUID = [[NSUUID UUID] UUIDString];
  return [NSTemporaryDirectory() stringByAppendingString:UUID];
}

/**
 Execute @p block with a valid temporary file path. A file written to this
 path will be automatically removed after @p block finishes execution.
 */
- (void)tdt_withTemporaryPath:(void (^)(NSString *path))block {
  NSString *path = [self tdt_temporaryFilePath];
  block(path);
  [self removeItemAtPath:path error:NULL];
}

@end

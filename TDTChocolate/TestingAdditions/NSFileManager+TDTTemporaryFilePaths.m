#import "NSFileManager+TDTTemporaryFilePaths.h"

@implementation NSFileManager (TDTTemporaryFilePaths)

- (NSString *)tdt_temporaryFilePath {
  NSString *UUID = [[NSUUID UUID] UUIDString];
  return [NSTemporaryDirectory() stringByAppendingString:UUID];
}

- (void)tdt_withTemporaryPath:(void (^)(NSString *path))block {
  NSString *path = [self tdt_temporaryFilePath];
  block(path);
  [self removeItemAtPath:path error:NULL];
}

@end

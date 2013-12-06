#import "NSFileManager+TDTAdditions.h"
#import "../TDTAssert.h"

@implementation NSFileManager (TDTAdditions)

- (NSURL *)userURLForDirectory:(NSSearchPathDirectory)directory {
  return [[self URLsForDirectory:directory inDomains:NSUserDomainMask] firstObject];
}

- (NSURL *)fileURLToTemporaryFileWithNamePrefix:(NSString *)prefix
                                         suffix:(NSString *)suffix {
  NSString *temporaryDirectory = NSTemporaryDirectory();
  NSString *nameTemplate = [NSString stringWithFormat:@"%@-XXXXX.%@", prefix, suffix];
  NSString *tempFileTemplate = [temporaryDirectory                                stringByAppendingPathComponent:nameTemplate];

  const char *tempFileTemplateCString = [tempFileTemplate fileSystemRepresentation];

  char *tempFilePathCString = (char *)malloc(strlen(tempFileTemplateCString) + sizeof(char));
  strcpy(tempFilePathCString, tempFileTemplateCString);
  int fileDescriptor = mkstemps(tempFilePathCString, (int)[suffix length]);
  TDTAssert(fileDescriptor != -1, @"Could not create temporary file");
  close(fileDescriptor);

  NSString *tempFilePath = [self stringWithFileSystemRepresentation:tempFilePathCString
                                                             length:strlen(tempFilePathCString)];
  free(tempFilePathCString);

  return [NSURL fileURLWithPath:tempFilePath];
}

@end

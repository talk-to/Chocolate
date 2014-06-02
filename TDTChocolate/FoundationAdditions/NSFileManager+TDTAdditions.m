#import "NSFileManager+TDTAdditions.h"
#import "TDTAssert.h"

@implementation NSFileManager (TDTAdditions)

- (NSURL *)tdt_userURLForDirectory:(NSSearchPathDirectory)directory {
  return [[self URLsForDirectory:directory inDomains:NSUserDomainMask] firstObject];
}

- (NSURL *)tdt_fileURLToTemporaryFileWithNamePrefix:(NSString *)prefix
                                             suffix:(NSString *)suffix {
  NSString *temporaryDirectory = NSTemporaryDirectory();
  NSString *dottedSuffix = [@"." stringByAppendingString:suffix];
  NSString *nameTemplate = [NSString stringWithFormat:@"%@-XXXXX%@", prefix, dottedSuffix];
  NSString *tempFileTemplate = [temporaryDirectory                                stringByAppendingPathComponent:nameTemplate];

  const char *tempFileTemplateCString = [tempFileTemplate fileSystemRepresentation];

  char *tempFilePathCString = (char *)malloc(strlen(tempFileTemplateCString) + sizeof(char));
  strcpy(tempFilePathCString, tempFileTemplateCString);
  int fileDescriptor = mkstemps(tempFilePathCString, (int)[dottedSuffix length]);
  TDTAssert(fileDescriptor != -1, @"Could not create temporary file");
  close(fileDescriptor);

  NSString *tempFilePath = [self stringWithFileSystemRepresentation:tempFilePathCString
                                                             length:strlen(tempFilePathCString)];
  free(tempFilePathCString);

  return [NSURL fileURLWithPath:tempFilePath];
}

- (BOOL)forceMoveItemAtPath:(NSString *)sourcePath
                     toPath:(NSString *)destinationPath
                      error:(NSError **)error {
  if ([self fileExistsAtPath:destinationPath]) {
    [self removeItemAtPath:destinationPath error:NULL];
  }
  return [self moveItemAtPath:sourcePath
                       toPath:destinationPath
                        error:error];
}

@end

#import <Foundation/Foundation.h>

@interface NSFileManager (TDTTemporaryFilePaths)

/**
 Simplified version of `tdt_fileURLToTemporaryFileWithNamePrefix:suffix:`
 */
- (NSString *)tdt_temporaryFilePath;

/**
 Execute @p block with a valid temporary file path. A file written to this
 path will be automatically removed after @p block finishes execution.
 */
- (void)tdt_withTemporaryPath:(void (^)(NSString *path))block;

@end

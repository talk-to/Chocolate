#import <XCTest/XCTest.h>
#import <TDTChocolate/TDTTestingAdditions.h>

@interface NSFileManager_TDTTemporaryFilePaths_Tests : XCTestCase

@end

@implementation NSFileManager_TDTTemporaryFilePaths_Tests

- (void)testFileIsRemovedAfterBlockExecutes {
  __block NSString *temporaryPath;
  [[NSFileManager defaultManager] tdt_withTemporaryPath:^(NSString *path) {
    temporaryPath = path;
    [@{} writeToFile:path atomically:YES];
    XCTAssertTrue([[NSFileManager defaultManager] fileExistsAtPath:temporaryPath]);
  }];
  XCTAssertFalse([[NSFileManager defaultManager] fileExistsAtPath:temporaryPath]);
}

@end

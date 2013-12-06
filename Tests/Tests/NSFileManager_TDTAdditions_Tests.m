#import <XCTest/XCTest.h>
#import <TDTHotChocolate/TDTTestingAdditions.h>
#import <TDTHotChocolate/FoundationAdditions/NSFileManager+TDTAdditions.h>

@interface NSFileManager_TDTAdditions_Tests : XCTestCase

@end

@implementation NSFileManager_TDTAdditions_Tests

- (void)testTemporaryFilePathURLConstruction {
  NSFileManager *fileManager = [NSFileManager defaultManager];
  NSString *prefix = [NSString randomString];
  NSString *suffix = [NSString randomString];
  NSURL *url = [fileManager fileURLToTemporaryFileWithNamePrefix:prefix
                                                          suffix:suffix];
  XCTAssertTrue(url.isFileURL);
  NSString *urlString = url.absoluteString;
  XCTAssertNotEqual([urlString rangeOfString:prefix].location, NSNotFound);
  XCTAssertTrue([urlString hasSuffix:suffix]);
}

@end

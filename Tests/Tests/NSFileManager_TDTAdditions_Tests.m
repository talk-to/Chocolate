#import <XCTest/XCTest.h>
#import <TDTChocolate/TDTTestingAdditions.h>
#import <TDTChocolate/FoundationAdditions/NSFileManager+TDTAdditions.h>
#import <TDTChocolate/FoundationAdditions/NSString+TDTAdditions.h>

@interface NSFileManager_TDTAdditions_Tests : XCTestCase

@end

@implementation NSFileManager_TDTAdditions_Tests

- (void)testTemporaryFilePathURLConstruction {
  NSFileManager *fileManager = [NSFileManager defaultManager];
  NSString *prefix = [NSString tdt_randomString];
  NSString *suffix = [NSString tdt_randomString];
  NSURL *url = [fileManager tdt_fileURLToTemporaryFileWithNamePrefix:prefix
                                                          suffix:suffix];
  XCTAssertTrue(url.isFileURL);
  NSString *urlString = url.absoluteString;
  XCTAssertTrue([urlString tdt_containsString:prefix]);
  XCTAssertTrue([urlString hasSuffix:suffix]);
}

- (void)testTemporaryFilePathURLsShouldBeDifferentOnEachRun {
  NSFileManager *fileManager = [NSFileManager defaultManager];
  NSString *prefix = [NSString tdt_randomString];
  NSString *suffix = [NSString tdt_randomString];
  NSURL *urlOne = [fileManager tdt_fileURLToTemporaryFileWithNamePrefix:prefix
                                                             suffix:suffix];
  NSURL *urlTwo = [fileManager tdt_fileURLToTemporaryFileWithNamePrefix:prefix
                                                             suffix:suffix];
  XCTAssertNotEqualObjects(urlOne, urlTwo);
}


@end

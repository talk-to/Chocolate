#import <XCTest/XCTest.h>
#import <TDTChocolate/TDTTestingAdditions.h>
#import <TDTChocolate/FoundationAdditions/NSFileManager+TDTAdditions.h>
#import <TDTChocolate/FoundationAdditions/NSString+TDTAdditions.h>

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
  XCTAssertTrue([urlString containsString:prefix]);
  XCTAssertTrue([urlString hasSuffix:suffix]);
}

@end

#import <XCTest/XCTest.h>
#import <TDTChocolate/TDTZlibAdditions.h>

NSString *const TDTZlibTestsException = @"TDTZlibTestsException";

@class TDTZlibCompressor;
@class TDTZlibDecompressor;

@interface TDTZlibWrapperTests : XCTestCase

@property (nonatomic, strong) TDTZlibCompressor *compressor;
@property (nonatomic, strong) TDTZlibDecompressor *decompressor;

@end

@implementation TDTZlibWrapperTests

@synthesize compressor = compressor_;
@synthesize decompressor = decompressor_;

// Runs the 'gunzip' utility and returns data from its standard output
- (NSData *)gunzipData:(NSData *)data {
  NSFileManager *dfm = [NSFileManager defaultManager];
  NSString *tmpDir = NSTemporaryDirectory();
  NSString *tmpPath = [tmpDir stringByAppendingPathComponent:@"compressedData.gz"];
  NSString *tmpOutPath = [tmpDir stringByAppendingPathComponent:@"compressedData"];
  if (![dfm createFileAtPath:tmpPath contents:data attributes:nil]) {
    NSLog(@"Couldn't create file at path: %@", tmpPath);
    return nil;
  }
  [dfm removeItemAtPath:tmpOutPath error:NULL];
  NSTask *task = [[NSTask alloc] init];
  [task setLaunchPath:@"/usr/bin/gunzip"];
  [task setArguments:[NSArray arrayWithObjects:tmpPath, nil]];
  [task setStandardInput:[NSFileHandle fileHandleWithNullDevice]];
  [task setStandardOutput:[NSFileHandle fileHandleWithNullDevice]];
  [task launch];
  [task waitUntilExit];
  int status = [task terminationStatus];
  if (status == 0) {
    return [NSData dataWithContentsOfFile:tmpOutPath];
  } else {
    @throw [NSException exceptionWithName:TDTZlibTestsException reason:@"gunzip didn't return successfully" userInfo:nil];
  }
}

- (NSData *)gzipData:(NSData *)data {
  NSFileManager *dfm = [NSFileManager defaultManager];
  NSString *tmpDir = NSTemporaryDirectory();
  NSString *tmpPath = [tmpDir stringByAppendingPathComponent:@"data"];
  NSString *tmpOutPath = [tmpDir stringByAppendingPathComponent:@"data.gz"];
  if (![dfm createFileAtPath:tmpPath contents:data attributes:nil]) {
    NSLog(@"Couldn't create file at path: %@", tmpPath);
    return nil;
  }
  [dfm removeItemAtPath:tmpOutPath error:NULL];
  NSTask *task = [[NSTask alloc] init];
  [task setLaunchPath:@"/usr/bin/gzip"];
  [task setArguments:[NSArray arrayWithObjects:tmpPath, nil]];
  [task setStandardInput:[NSFileHandle fileHandleWithNullDevice]];
  [task setStandardOutput:[NSFileHandle fileHandleWithNullDevice]];
  [task launch];
  [task waitUntilExit];
  int status = [task terminationStatus];
  if (status == 0) {
    return [NSData dataWithContentsOfFile:tmpOutPath];
  } else {
    @throw [NSException exceptionWithName:TDTZlibTestsException reason:@"gzip didn't return successfully" userInfo:nil];
  }
}

- (void)setUp {
  self.compressor = [[TDTZlibCompressor alloc] initWithCompressionFormat:TDTCompressionFormatGzip];
  self.decompressor = [[TDTZlibDecompressor alloc] initWithCompressionFormat:TDTCompressionFormatGzip];
}

- (void)tearDown {
  self.compressor = nil;
  self.decompressor = nil;
}

#pragma mark - Compression tests

- (void)testEmptyData {
  NSData *inData = [NSData data];
  NSData *compressedData = [self.compressor finishData:inData];
  NSData *gunzipData = [self gunzipData:compressedData];
  XCTAssertTrue([gunzipData isEqualToData:inData], @"Input data not equal to gunzip data");
}

- (void)testSmallData {
  NSData *inData = [@"hello world" dataUsingEncoding:NSUTF8StringEncoding];
  NSData *compressedData = [self.compressor finishData:inData];
  NSData *gunzipData = [self gunzipData:compressedData];
  XCTAssertTrue([gunzipData isEqualToData:inData], @"Input data not equal to gunzip data");
}

- (void)testLargeFile {
  NSBundle *bundle = [NSBundle bundleForClass:[self class]];
  NSData *inData = [NSData dataWithContentsOfFile:[bundle pathForResource:@"largeFile1" ofType:@"dat"]];
  NSData *compressedData = [self.compressor finishData:inData];
  NSData *gunzipData = [self gunzipData:compressedData];
  XCTAssertTrue([gunzipData isEqualToData:inData], @"Input data not equal to gunzip data");
}

- (void)testLargeFile2 {
  NSBundle *bundle = [NSBundle bundleForClass:[self class]];
  NSData *inData = [NSData dataWithContentsOfFile:[bundle pathForResource:@"largeFile1" ofType:@"dat"]];
  NSMutableData *compressedData = [NSMutableData data];
  [compressedData appendData:[self.compressor compressData:inData]];
  [compressedData appendData:[self.compressor finishData:nil]];
  NSData *gunzipData = [self gunzipData:compressedData];
  XCTAssertTrue([gunzipData isEqualToData:inData], @"Input data not equal to gunzip data");
}

- (void)testCompressFile {
  NSBundle *bundle = [NSBundle bundleForClass:[self class]];
  NSString *path = [bundle pathForResource:@"largeFile1" ofType:@"dat"];
  NSData *inData = [NSData dataWithContentsOfFile:path];
  NSData *compressedData = [self.compressor compressFile:path format:TDTCompressionFormatGzip error:NULL];
  NSData *gunzipData = [self gunzipData:compressedData];
  XCTAssertTrue([gunzipData isEqualToData:inData], @"Input data not equal to gunzip data");
}

- (void)testCompressFileError {
  NSBundle *bundle = [NSBundle bundleForClass:[self class]];
  NSString *path = [bundle pathForResource:@"largeFile1" ofType:@"dat"];
  // Modify path to a non-existent file
  path = [path stringByDeletingPathExtension];
  path = [path stringByAppendingPathExtension:@"dat2"];
  NSError *error;
  NSData *result = [self.compressor compressFile:path format:TDTCompressionFormatGzip error:&error];
  XCTAssertNil(result, @"result should be nil");
  XCTAssertNotNil(error, @"error should be non-nil");
}

- (void)testMultiCompress {
  NSMutableData *compressedData = [NSMutableData data];
  [compressedData appendData:[self.compressor compressData:[@"foobar" dataUsingEncoding:NSUTF8StringEncoding]]];
  [compressedData appendData:[self.compressor compressData:[@"baz" dataUsingEncoding:NSUTF8StringEncoding]]];
  [compressedData appendData:[self.compressor compressData:[@"quux" dataUsingEncoding:NSUTF8StringEncoding]]];
  [compressedData appendData:[self.compressor finishData:nil]];
  NSData *inData = [@"foobarbazquux" dataUsingEncoding:NSUTF8StringEncoding];
  NSData *gunzipData = [self gunzipData:compressedData];
  XCTAssertTrue([gunzipData isEqualToData:inData], @"Input data not equal to gunzip data");
}

- (void)testMultiCompressFlush {
  NSMutableData *compressedData = [NSMutableData data];
  [compressedData appendData:[self.compressor flushData:[@"foobar" dataUsingEncoding:NSUTF8StringEncoding]]];
  [compressedData appendData:[self.compressor flushData:[@"baz" dataUsingEncoding:NSUTF8StringEncoding]]];
  [compressedData appendData:[self.compressor flushData:[@"quux" dataUsingEncoding:NSUTF8StringEncoding]]];
  [compressedData appendData:[self.compressor finishData:nil]];
  NSData *inData = [@"foobarbazquux" dataUsingEncoding:NSUTF8StringEncoding];
  NSData *gunzipData = [self gunzipData:compressedData];
  XCTAssertTrue([gunzipData isEqualToData:inData], @"Input data not equal to gunzip data");
}

# pragma mark - Decompression tests

- (void)testEmptyDataDecompression {
  NSData *inData = [NSData data];
  NSData *compressedData = [self gzipData:inData];
  NSData *decompressedData = [self.decompressor finishData:compressedData];
  XCTAssertTrue([decompressedData isEqualToData:inData], @"Input data not equal to output data");
}

- (void)testSmallDataDecompression {
  NSData *inData = [@"hello world" dataUsingEncoding:NSUTF8StringEncoding];
  NSData *compressedData = [self gzipData:inData];
  NSData *decompressedData = [self.decompressor finishData:compressedData];
  XCTAssertTrue([decompressedData isEqualToData:inData], @"Input data not equal to output data");
}

- (void)testLargeFileDecompression {
  NSBundle *bundle = [NSBundle bundleForClass:[self class]];
  NSData *inData = [NSData dataWithContentsOfFile:[bundle pathForResource:@"largeFile1" ofType:@"dat"]];
  NSData *compressedData = [self gzipData:inData];
  NSData *decompressedData = [self.decompressor finishData:compressedData];
  XCTAssertTrue([decompressedData isEqualToData:inData], @"Input data not equal to output data");
}

- (void)testLargeFile2Decompression {
  NSBundle *bundle = [NSBundle bundleForClass:[self class]];
  NSData *inData = [NSData dataWithContentsOfFile:[bundle pathForResource:@"largeFile1" ofType:@"dat"]];
  NSMutableData *compressedData = [NSMutableData data];
  [compressedData appendData:[self gzipData:inData]];
  [compressedData appendData:[self gzipData:nil]];
  NSData *decompressedData = [self.decompressor finishData:compressedData];
  XCTAssertTrue([decompressedData isEqualToData:inData], @"Input data not equal to output data");
}

- (void)testDecompressFile {
  NSBundle *bundle = [NSBundle bundleForClass:[self class]];
  NSString *path = [bundle pathForResource:@"largeFile1" ofType:@"dat"];
  NSData *inData = [NSData dataWithContentsOfFile:path];
  NSData *compressedData = [self gzipData:inData];
  NSData *decompressedData = [self.decompressor finishData:compressedData];
  XCTAssertTrue([decompressedData isEqualToData:inData], @"Input data not equal to output data");
}

- (void)testDecompressFileError {
  NSBundle *bundle = [NSBundle bundleForClass:[self class]];
  NSString *path = [bundle pathForResource:@"largeFile1" ofType:@"dat"];
  // Modify path to a non-existent file
  path = [path stringByDeletingPathExtension];
  path = [path stringByAppendingPathExtension:@"dat2"];
  NSError *error;
  NSData *result = [self.decompressor decompressFile:path format:TDTCompressionFormatGzip error:&error];
  XCTAssertNil(result, @"result should be nil");
  XCTAssertNotNil(error, @"error should be non-nil");
}

- (void)testMultiDecompress {
  NSData *inData = [@"foobarbazquux" dataUsingEncoding:NSUTF8StringEncoding];
  NSMutableData *decompressedData = [NSMutableData data];

  NSData *compressedData1 = [self.compressor compressData:[@"foobar" dataUsingEncoding:NSUTF8StringEncoding]];
  NSData *compressedData2 = [self.compressor compressData:[@"baz" dataUsingEncoding:NSUTF8StringEncoding]];
  NSData *compressedData3 = [self.compressor compressData:[@"quux" dataUsingEncoding:NSUTF8StringEncoding]];

  [decompressedData appendData:[self.decompressor decompressData:compressedData1]];
  [decompressedData appendData:[self.decompressor decompressData:compressedData2]];
  [decompressedData appendData:[self.decompressor decompressData:compressedData3]];
  [decompressedData appendData:[self.decompressor finishData:[self.compressor finishData:nil]]];

  XCTAssertTrue([decompressedData isEqualToData:inData], @"Input data not equal to output data");
}

- (void)testMultiDecompressFlush {
  NSData *inData = [@"foobarbazquux" dataUsingEncoding:NSUTF8StringEncoding];
  NSMutableData *decompressedData = [NSMutableData data];

  NSData *compressedData1 = [self.compressor compressData:[@"foobar" dataUsingEncoding:NSUTF8StringEncoding]];
  NSData *compressedData2 = [self.compressor compressData:[@"baz" dataUsingEncoding:NSUTF8StringEncoding]];
  NSData *compressedData3 = [self.compressor compressData:[@"quux" dataUsingEncoding:NSUTF8StringEncoding]];

  [decompressedData appendData:[self.decompressor flushData:compressedData1]];
  [decompressedData appendData:[self.decompressor flushData:compressedData2]];
  [decompressedData appendData:[self.decompressor flushData:compressedData3]];
  [decompressedData appendData:[self.decompressor finishData:[self.compressor finishData:nil]]];

  XCTAssertTrue([decompressedData isEqualToData:inData], @"Input data not equal to output data");
}

@end

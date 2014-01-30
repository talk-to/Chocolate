//
//  TDTZlib.h
//  Talkto
//
//  Created by Chaitanya Gupta on 14/08/12.
//  Copyright (c) 2012 Talk.to FZC. All rights reserved.
//
// This file provides convenient Objective-C'esque wrappers over the zlib library.

#import <Foundation/Foundation.h>

typedef enum {
  TDTCompressionFormatDeflate,
  TDTCompressionFormatGzip
} TDTCompressionFormat;


// This class provides a wrapper over the compression related functions
// provided by zlib
@interface TDTZlibCompressor : NSObject

// The compression level. Must be between between 0 and 9: 1 gives best speed,
// 9 gives best compression, 0 gives no compression at all (the input data is
// simply copied a block at a time). Default is Z_DEFAULT_COMPRESSION from zlib.h
// (currently equivalent to level 6)
@property (nonatomic) int level;

// Window size is the size of the history buffer in bits. Should be between
// 8 and 15. Defaults to 15.
@property (nonatomic) int windowSize;

// If NO, then the NSData object returned by {compress,flush,finish}Data: methods
// is only safe to use as long as one of these methods is not called again or the
// receiver is not deallocated. Don't set this to NO unless you know what you are doing.
// Defaults to YES.
@property (nonatomic) BOOL copyOutputData;

// The output buffer used by the compressor is initially equal to the size specified
// by outBufferChunkSize. If greater output space is required, the output buffer increases
// its size in increments of outBufferChunkSize.
@property (nonatomic) unsigned int outBufferChunkSize;

// The designated initializer -- needs compression format and compression level
- (id)initWithCompressionFormat:(TDTCompressionFormat)compressionFormat level:(int)level;

// Initialize with the given compression format.
- (id)initWithCompressionFormat:(TDTCompressionFormat)compressionFormat;

// Sends all input data to the internal zStream and returns any output data proivded
// by the zStream. Its possible that not all of input has been compressed and returned
// at this point
- (NSData *)compressData:(NSData *)data;

// Sends all input data to the internal zStream and ensures that all the input data
// is compressed and returned
- (NSData *)flushData:(NSData *)data;

// Sends all input data to the internal zStream and finishes compression. Returns any
// data provided by the zStream
- (NSData *)finishData:(NSData *)data;

// Convenience method which reads a file in fixed size chunks and returns the compressed
// data
- (NSData *)compressFile:(NSString *)path format:(TDTCompressionFormat)format error:(NSError **)error;

@end


// This class provides a wrapper over the decompression related functions
// provided by zlib
@interface TDTZlibDecompressor : NSObject

// Window size is the size of the history buffer in bits. Should be between
// 8 and 15. Defaults to 15.
@property (nonatomic) int windowSize;

// If NO, then the NSData object returned by {compress,flush,finish}Data: methods
// is only safe to use as long as one of these methods is not called again or the
// receiver is not deallocated. Don't set this to NO unless you know what you are doing.
// Defaults to YES.
@property (nonatomic) BOOL copyOutputData;

// The output buffer used by the compressor is initially equal to the size specified
// by outBufferChunkSize. If greater output space is required, the output buffer increases
// its size in increments of outBufferChunkSize.
@property (nonatomic) unsigned int outBufferChunkSize;

// Initialize with the given decompression format.
- (id)initWithCompressionFormat:(TDTCompressionFormat)compressionFormat;

// Sends all input data to the internal zStream and returns any output data proivded
// by the zStream. Its possible that not all of input has been decompressed and returned
// at this point
- (NSData *)decompressData:(NSData *)data;

// Sends all input data to the internal zStream and ensures that all the input data
// is decompressed and returned
- (NSData *)flushData:(NSData *)data;

// Sends all input data to the internal zStream and finishes compression. Returns any
// data provided by the zStream
- (NSData *)finishData:(NSData *)data;

// Convenience method which reads a file in fixed size chunks and returns the decompressed
// data
- (NSData *)decompressFile:(NSString *)path format:(TDTCompressionFormat)format error:(NSError **)error;

@end

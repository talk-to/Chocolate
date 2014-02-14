#import <Foundation/Foundation.h>
#import "TDTSizeofArray.h"

/**
 @param BYTE_ARRAY a uint8_t byte array.
 @return An `NSData` object initialized with bytes from `BYTE_ARRAY`
 @pre The definition of `BYTE_ARRAY` must be in scope when this macro is evaluated.
 */
#define TDT_NSDATA_FROM_BYTE_ARRAY(BYTE_ARRAY) \
[NSData dataWithBytes:(BYTE_ARRAY) length:TDT_SIZEOF_ARRAY(BYTE_ARRAY)]

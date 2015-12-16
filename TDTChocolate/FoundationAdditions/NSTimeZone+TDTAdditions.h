//
//  NSTimeZone+TDTAdditions.h
//  
//
//  Created by Udit Agarwal on 16/12/15.
//
//

#import <Foundation/Foundation.h>

@interface NSTimeZone (TDTAdditions)

/**
 Converts receiver to time-numoffset format
 @return Timezone in @p time-numoffset format.
 @note Refer https://tools.ietf.org/html/rfc3339#section-5.6 to know more about
       time-numoffset format.
 */
- (NSString *)tdt_timeNumoffset;

@end

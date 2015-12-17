//
//  NSTimeZone+TDTAdditions.m
//  
//
//  Created by Udit Agarwal on 16/12/15.
//
//

#import "NSTimeZone+TDTAdditions.h"

static const NSInteger NumSecondsInMinute = 60;
static const NSInteger NumMinutesInHour = 60;


@implementation NSTimeZone (TDTAdditions)

- (NSString *)tdt_timeNumoffset {
  NSInteger seconds = self.secondsFromGMT;
  NSString *sign = (seconds < 0) ? @"-" : @"+";
  seconds = abs(seconds);

  int minutes = (seconds / NumSecondsInMinute) % NumMinutesInHour;
  int hours = (int)seconds / (NumSecondsInMinute * NumMinutesInHour);
  
  return [NSString stringWithFormat:@"%@%02d:%02d", sign, hours, minutes];
}

@end

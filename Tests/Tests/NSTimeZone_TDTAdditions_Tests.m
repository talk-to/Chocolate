//
//  NSTimeZone_TDTAdditions_Tests.m
//  Talkto
//
//  Created by Udit Agarwal on 16/12/15.
//  Copyright (c) 2015 Talk.to FZC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <TDTChocolate/FoundationAdditions/NSTimeZone+TDTAdditions.h>

@interface NSTimeZone_TDTAdditions_Tests : XCTestCase

@end

@implementation NSTimeZone_TDTAdditions_Tests

- (void)checkTimeNumoffset:(NSString *)timeNumoffset
         forSecondsFromGMT:(NSInteger)secondsFromGMT {
  NSTimeZone *timezone = [NSTimeZone timeZoneForSecondsFromGMT:secondsFromGMT];
  XCTAssertEqualObjects(timeNumoffset, timezone.tdt_timeNumoffset);
}

- (void)testItAddsPaddingForTimeZoneWithHoursLessThanTen {
  [self checkTimeNumoffset:@"+05:30" forSecondsFromGMT:19800];
}

- (void)testItDoesNotAddPaddingForTimeZoneWithHoursMoreThanNine {
  [self checkTimeNumoffset:@"+12:00" forSecondsFromGMT:43200];
}

- (void)testItAddsPaddingForTimeZoneWithMinutesLessThanTen {
  [self checkTimeNumoffset:@"+05:02" forSecondsFromGMT:18120];
}

- (void)testItAddsPaddingForTimeZoneWithMinutesMoreThanNine {
  [self checkTimeNumoffset:@"+05:30" forSecondsFromGMT:19800];
}

- (void)testItAddsPlusSignForPositiveTimeZones {
  [self checkTimeNumoffset:@"+05:30" forSecondsFromGMT:19800];
}

- (void)testItAddsNegativeSignForNegativeTimeZones {
  [self checkTimeNumoffset:@"-05:30" forSecondsFromGMT:-19800];
}

@end

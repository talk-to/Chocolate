#import <Foundation/Foundation.h>

/**
 @return A pseudo-random double in the interval [0.0, 1.0).
 */
double TDTRandomDouble();

/**
 @return A pseudo-random double in the interval [fromInclusive, toExclusive).
 @pre `fromInclusive` must be less than `toExclusive`.
 */
double TDTRandomDoubleInInterval(double fromInclusive, double toExclusive);

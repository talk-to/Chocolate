#import "TDTRandom.h"
#import "TDTAssert.h"

double TDTRandomDouble() {
  // From `man arc4random`
  // "The arc4random() function returns pseudo-random numbers in the range
  //  of 0 to (2**32)-1".
  static const double Arc4randomUpperBoundExclusive = (double)0x100000000;
  return (arc4random() / Arc4randomUpperBoundExclusive);
}

double TDTRandomDoubleInInterval(double fromInclusive, double toExclusive) {
  TDTCParameterAssert(toExclusive > fromInclusive);
  double range = toExclusive - fromInclusive;
  return fromInclusive + (TDTRandomDouble() * range);
}

#import "TDTRandom.h"
#import "TDTAssert.h"

double TDTRandomDouble() {
  // From `man arc4random`
  // "The arc4random() function returns pseudo-random numbers in the range
  //  of 0 to (2**32)-1".
  return (arc4random() / 0x100000000);
}

double TDTRandomDoubleInInterval(double fromInclusive, double toExclusive) {
  TDTCParameterAssert(fromInclusive < toExclusive);
  double range = fromInclusive - toExclusive;
  return fromInclusive + (TDTRandomDouble() * range);
}

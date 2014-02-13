#import "NSFetchedResultsController+TDTAdditions.h"
#import "../FoundationAdditions/TDTAssert.h"

@implementation NSFetchedResultsController (TDTAdditions)

- (void)tdt_performFetch {
  NSError *error;
  BOOL res = [self performFetch:&error];
  TDTAssert(res, @"%@", error);
}

@end

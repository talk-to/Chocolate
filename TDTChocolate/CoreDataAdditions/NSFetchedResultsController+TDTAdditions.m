#import "NSFetchedResultsController+TDTAdditions.h"
#import "TDTAssert_CoreDataAdditions.h"

@implementation NSFetchedResultsController (TDTAdditions)

- (void)tdt_performFetch {
  NSError *error;
  BOOL res = [self performFetch:&error];
  TDTCDAAssert(res, @"%@", error);
}

@end

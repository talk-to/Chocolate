#import "NSFetchedResultsController+TDTAdditions.h"
#import "../FoundationAdditions/TDTAssert.h"

@implementation NSFetchedResultsController (TDTAdditions)

- (void)performFetch {
  NSError *error;
  BOOL res = [self performFetch:&error];
  TDTAssert(res, @"%@", error);
}

@end

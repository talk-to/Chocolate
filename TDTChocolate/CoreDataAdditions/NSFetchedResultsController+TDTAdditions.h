#import <CoreData/CoreData.h>

@interface NSFetchedResultsController (TDTAdditions)

/**
 Wrapper over `performFetch:` that aborts on errors.
 */
- (void)performFetch;

@end

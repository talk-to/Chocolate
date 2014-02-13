#import <CoreData/CoreData.h>

@interface NSManagedObjectContext (TDTAdditions)

/**
 Wrapper over `existingObjectWithID:error:` that aborts on errors.
 */
- (NSManagedObject *)tdt_existingObjectWithID:(NSManagedObjectID *)objectID;

/**
 Wrapper over `executeFetchRequest:error:` that aborts on errors.
 */
- (NSArray *)tdt_executeFetchRequest:(NSFetchRequest *)fetchRequest;

/**
 Wrapper over `save:` that aborts on errors.
 */
- (void)tdt_save;

@end

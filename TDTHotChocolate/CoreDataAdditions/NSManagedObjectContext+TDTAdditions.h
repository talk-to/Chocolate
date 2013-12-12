#import <CoreData/CoreData.h>

@interface NSManagedObjectContext (TDTAdditions)

/**
 Wrapper over `existingObjectWithID:error:` that aborts on errors.
 */
- (NSManagedObject *)existingObjectWithID:(NSManagedObjectID *)objectID;

/**
 Wrapper over `executeFetchRequest:error:` that aborts on errors.
 */
- (NSArray *)executeFetchRequest:(NSFetchRequest *)fetchRequest;

/**
 Wrapper over `save:` that aborts on errors.
 */
- (void)save;

@end

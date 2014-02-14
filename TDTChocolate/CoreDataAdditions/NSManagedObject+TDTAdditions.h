#import <CoreData/CoreData.h>

@interface NSManagedObject (TDTAdditions)

/**
 Insert a new instance of the receiver in `managedObjectContext`.
 @return The newly inserted object.
 */
+ (instancetype)tdt_insertNewObjectInManagedObjectContext:(NSManagedObjectContext *)managedObjectContext;

/// String representation of the receiver.
+ (NSString *)tdt_entityName;

/**
 @return Array containing all instances of the receiver that match `predicate`
 in `managedObjectContext`. The return value is guranteed to not be nil.
 @note This method aborts on errors.
 */
+ (NSArray *)tdt_fetchObjectsForPredicate:(NSPredicate *)predicate
                   inManagedObjectContext:(NSManagedObjectContext *)managedObjectContext;

/**
 @return Array containing all instances of the receiver in `managedObjectContext`.
 The return value is guranteed to not be nil.
 @note This method aborts on errors.
 */
+ (NSArray *)tdt_fetchAllObjectsInManagedObjectContext:(NSManagedObjectContext *)managedObjectContext;

/**
 @return The only instance of the receiver that matches `predicate` in
 `managedObjectContext`, or nil if there are no such instances.
 @note This method aborts if there is an error or if there are multiples
 instances that match `predicate`.
 */
+ (instancetype)tdt_fetchObjectForPredicate:(NSPredicate *)predicate
                     inManagedObjectContext:(NSManagedObjectContext *)managedObjectContext;

/**
 @return Count of the number of instances of the receiver that match `predicate`
 in `managedObjectContext`. The return value is guranteed to be valid
 and not `NSNotFound`.
 @note This method aborts on errors.
 */
+ (NSUInteger)tdt_countForPredicate:(NSPredicate *)predicate
             inManagedObjectContext:(NSManagedObjectContext *)managedObjectContext;

@end

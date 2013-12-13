#import "NSManagedObject+TDTAdditions.h"
#import "NSManagedObjectContext+TDTAdditions.h"
#import "../FoundationAdditions/TDTAssert.h"

@implementation NSManagedObject (TDTAdditions)

+ (instancetype)insertNewObjectInManagedObjectContext:(NSManagedObjectContext *)managedObjectContext {
  NSParameterAssert(managedObjectContext);
  return [NSEntityDescription insertNewObjectForEntityForName:[self entityName]
                                       inManagedObjectContext:managedObjectContext];
}

+ (NSString *)entityName {
  return NSStringFromClass(self);
}

+ (NSArray *)fetchObjectsForPredicate:(NSPredicate *)predicate
               inManagedObjectContext:(NSManagedObjectContext *)managedObjectContext {
  NSParameterAssert(managedObjectContext);
  NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:[self entityName]];
  if (predicate) {
    fetchRequest.predicate = predicate;
  }
  return [managedObjectContext executeFetchRequest:fetchRequest];
}

+ (NSArray *)fetchAllObjectsInManagedObjectContext:(NSManagedObjectContext *)managedObjectContext {
  return [self fetchObjectsForPredicate:nil
                 inManagedObjectContext:managedObjectContext];
}

+ (instancetype)fetchObjectForPredicate:(NSPredicate *)predicate
                 inManagedObjectContext:(NSManagedObjectContext *)managedObjectContext {
  NSArray *results = [self fetchObjectsForPredicate:predicate
                             inManagedObjectContext:managedObjectContext];
  TDTAssert([results count] <= 1, @"Multiple objects matching predicate (%@): %@", predicate, results);
  return [results firstObject];
}

+ (NSUInteger)countForPredicate:(NSPredicate *)predicate
         inManagedObjectContext:(NSManagedObjectContext *)managedObjectContext {
  NSParameterAssert(managedObjectContext);
  NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:[self entityName]];
  fetchRequest.predicate = predicate;
  NSError *error;
  NSUInteger count = [managedObjectContext countForFetchRequest:fetchRequest
                                                          error:&error];
  TDTAssert(count != NSNotFound, @"%@", error);
  return count;
}

@end

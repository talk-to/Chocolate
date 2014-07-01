#import "NSManagedObject+TDTAdditions.h"
#import "NSManagedObjectContext+TDTAdditions.h"
#import "TDTAssert_CoreDataAdditions.h"

@implementation NSManagedObject (TDTAdditions)

+ (instancetype)tdt_insertNewObjectInManagedObjectContext:(NSManagedObjectContext *)managedObjectContext {
  NSParameterAssert(managedObjectContext);
  return [NSEntityDescription insertNewObjectForEntityForName:[self tdt_entityName]
                                       inManagedObjectContext:managedObjectContext];
}

+ (NSString *)tdt_entityName {
  return NSStringFromClass(self);
}

+ (NSArray *)tdt_fetchObjectsForPredicate:(NSPredicate *)predicate
                   inManagedObjectContext:(NSManagedObjectContext *)managedObjectContext {
  NSParameterAssert(managedObjectContext);
  NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:[self tdt_entityName]];
  if (predicate) {
    fetchRequest.predicate = predicate;
  }
  return [managedObjectContext tdt_executeFetchRequest:fetchRequest];
}

+ (NSArray *)tdt_fetchAllObjectsInManagedObjectContext:(NSManagedObjectContext *)managedObjectContext {
  return [self tdt_fetchObjectsForPredicate:nil
                     inManagedObjectContext:managedObjectContext];
}

+ (instancetype)tdt_fetchObjectForPredicate:(NSPredicate *)predicate
                     inManagedObjectContext:(NSManagedObjectContext *)managedObjectContext {
  NSArray *results = [self tdt_fetchObjectsForPredicate:predicate
                                 inManagedObjectContext:managedObjectContext];
  TDTCDAAssert([results count] <= 1, @"Multiple objects matching predicate (%@): %@", predicate, results);
  return [results firstObject];
}

+ (NSUInteger)tdt_countForPredicate:(NSPredicate *)predicate
             inManagedObjectContext:(NSManagedObjectContext *)managedObjectContext {
  NSParameterAssert(managedObjectContext);
  NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:[self tdt_entityName]];
  fetchRequest.predicate = predicate;
  NSError *error;
  NSUInteger count = [managedObjectContext countForFetchRequest:fetchRequest
                                                          error:&error];
  TDTCDAAssert(count != NSNotFound, @"%@", error);
  return count;
}

@end

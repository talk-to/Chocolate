#import "NSManagedObjectContext+TDTAdditions.h"
#import "TDTAssert_CoreDataAdditions.h"

@implementation NSManagedObjectContext (TDTAdditions)

- (NSManagedObject *)tdt_existingObjectWithID:(NSManagedObjectID *)objectID {
  NSError *error;
  NSManagedObject *object = [self existingObjectWithID:objectID error:&error];
  TDTCDAAssert(object != nil, @"%@", error);
  return object;
}

- (NSArray *)tdt_executeFetchRequest:(NSFetchRequest *)fetchRequest {
  NSError *error;
  NSArray *results = [self executeFetchRequest:fetchRequest error:&error];
  TDTCDAAssert(results != nil, @"%@", error);
  return results;
}

- (void)tdt_save {
  NSError *error;
  BOOL res = [self save:&error];
  TDTCDAAssert(res, @"%@", error);
}

@end

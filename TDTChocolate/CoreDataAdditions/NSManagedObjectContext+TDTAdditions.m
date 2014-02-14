#import "NSManagedObjectContext+TDTAdditions.h"
#import "../FoundationAdditions/TDTAssert.h"

@implementation NSManagedObjectContext (TDTAdditions)

- (NSManagedObject *)tdt_existingObjectWithID:(NSManagedObjectID *)objectID {
  NSError *error;
  NSManagedObject *object = [self existingObjectWithID:objectID error:&error];
  TDTAssertNotNil(object, @"%@", error);
  return object;
}

- (NSArray *)tdt_executeFetchRequest:(NSFetchRequest *)fetchRequest {
  NSError *error;
  NSArray *results = [self executeFetchRequest:fetchRequest error:&error];
  TDTAssertNotNil(results, @"%@", error);
  return results;
}

- (void)tdt_save {
  NSError *error;
  BOOL res = [self save:&error];
  TDTAssert(res, @"%@", error);
}

@end

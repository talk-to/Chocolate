#import "TDTObjectOrDefault.h"

id TDTObjectOrDefault(id object, id defaultValue) {
  NSCParameterAssert(defaultValue);
  NSCParameterAssert(object == nil
                     || [defaultValue isKindOfClass:[object class]]
                     || [object isKindOfClass:[defaultValue class]]);
  return (object != nil) ? object : defaultValue;
}

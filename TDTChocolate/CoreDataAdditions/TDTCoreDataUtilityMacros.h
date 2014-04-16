
/**
 Macros to ease creation of core data accessors for scalar values.
 @see "Core Data Programming Guide" > "Non-Standard Persistent Attributes"
 */

#define TDT_COREDATA_CREATE_INT_GETTER(key, type, getter, primitiveAccessor) \
- (type)getter { \
[self willAccessValueForKey:key]; \
NSNumber *tmp = self.primitiveAccessor; \
[self didAccessValueForKey:key]; \
return (type)[tmp integerValue]; \
}

#define TDT_COREDATA_CREATE_INT_SETTER(key, type, setter, primitiveAccessor) \
- (void)setter : (type)x { \
[self willChangeValueForKey:key]; \
self.primitiveAccessor = @(x); \
[self didChangeValueForKey:key]; \
}

#define TDT_COREDATA_CREATE_INT_ACCESSOR(key, type, getter, setter, primitiveAccessor) \
TDT_COREDATA_CREATE_INT_GETTER(key, type, getter, primitiveAccessor) \
TDT_COREDATA_CREATE_INT_SETTER(key, type, setter, primitiveAccessor)


#define TDT_COREDATA_CREATE_BOOL_GETTER(key, type, getter, primitiveAccessor) \
- (type)getter { \
[self willAccessValueForKey:key]; \
NSNumber *tmp = self.primitiveAccessor; \
[self didAccessValueForKey:key]; \
return [tmp boolValue]; \
}

#define TDT_COREDATA_CREATE_BOOL_SETTER(key, type, setter, primitiveAccessor) \
- (void)setter : (type)x { \
[self willChangeValueForKey:key]; \
self.primitiveAccessor = @(x); \
[self didChangeValueForKey:key]; \
}

#define TDT_COREDATA_CREATE_BOOL_ACCESSOR(key, type, getter, setter, primitiveAccessor) \
TDT_COREDATA_CREATE_BOOL_GETTER(key, type, getter, primitiveAccessor) \
TDT_COREDATA_CREATE_BOOL_SETTER(key, type, setter, primitiveAccessor)

#define TDT_COREDATA_CREATE_FLOAT_GETTER(key, type, getter, primitiveAccessor) \
- (type)getter { \
[self willAccessValueForKey:key]; \
NSNumber *tmp = self.primitiveAccessor; \
[self didAccessValueForKey:key]; \
return (type)[tmp floatValue]; \
}

#define TDT_COREDATA_CREATE_FLOAT_SETTER(key, type, setter, primitiveAccessor) \
- (void)setter : (type)x { \
[self willChangeValueForKey:key]; \
self.primitiveAccessor = @(x); \
[self didChangeValueForKey:key]; \
}

#define TDT_COREDATA_CREATE_FLOAT_ACCESSOR(key, type, getter, setter, primitiveAccessor) \
TDT_COREDATA_CREATE_FLOAT_GETTER(key, type, getter, primitiveAccessor) \
TDT_COREDATA_CREATE_FLOAT_SETTER(key, type, setter, primitiveAccessor)

/**
 Invoking the super (NSManagedObject) setter functionality in an overridden
 setter of a custom NSManagedObject subclass results in an infinite loop.
 So we have to perform the same actions (what the default implementation would
 have done) inline. These macro takes away some of the pain.
 */

#define TDT_COREDATA_INVOKE_SUPER_GETTER(KEY, VARIABLE, PRIMITIVE_PROPERTY) \
[self willAccessValueForKey:KEY]; \
VARIABLE = self.PRIMITIVE_PROPERTY; \
[self didAccessValueForKey:KEY]

#define TDT_COREDATA_INVOKE_SUPER_SETTER(KEY, VALUE, PRIMITIVE_PROPERTY) \
[self willChangeValueForKey:KEY]; \
self.PRIMITIVE_PROPERTY = VALUE; \
[self didChangeValueForKey:KEY]

/**
 Emit declarations for a `customGetter` that relays the value of
 `originalProperty`, and override the setter for `originalProperty` (using
 the name `linkedSetter`) to also generate KVO notifications for `customGetter`.
 `primitiveProperty` is used for accessing and updating `originalProperty`

 Do not put a semicolon after this macro.

 Example:

 @property BOOL isFoo;
 @property BOOL foo;
 @property NSNumber *primitiveFoo;
 ...
 TDT_COREDATA_CUSTOM_GETTER_FOR_BOOL_PROPERTY(isFoo, setFoo, foo, primitiveFoo)
 */
#define TDT_COREDATA_CUSTOM_GETTER_FOR_BOOL_PROPERTY(customGetter, linkedSetter, originalProperty, primitiveProperty) \
- (BOOL)customGetter { \
[self willAccessValueForKey:NSStringFromSelector(@selector(customGetter))]; \
NSNumber *tmp = self.primitiveProperty; \
[self didAccessValueForKey:NSStringFromSelector(@selector(customGetter))]; \
return [tmp boolValue]; \
} \
\
- (void)linkedSetter:(BOOL)tmp { \
[self willChangeValueForKey:NSStringFromSelector(@selector(customGetter))]; \
[self willChangeValueForKey:NSStringFromSelector(@selector(originalProperty))]; \
self.primitiveProperty = @(tmp); \
[self didChangeValueForKey:NSStringFromSelector(@selector(originalProperty))]; \
[self didChangeValueForKey:NSStringFromSelector(@selector(customGetter))]; \
}

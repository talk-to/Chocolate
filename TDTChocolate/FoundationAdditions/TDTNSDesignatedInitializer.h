/**
 Interim declaration of NS_DESIGNATED_INITIALIZER until Apple
 starts exposing it (probably by the next SDK release).

 @see https://gist.github.com/steipete/9482253
 */

#ifndef NS_DESIGNATED_INITIALIZER
#if __has_attribute(objc_designated_initializer)
#define NS_DESIGNATED_INITIALIZER __attribute((objc_designated_initializer))
#else
#define NS_DESIGNATED_INITIALIZER
#endif
#endif

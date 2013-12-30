// http://stackoverflow.com/a/7933931/141220

#define TDTSuppressPerformSelectorLeakWarning(code) \
  do { \
    _Pragma("clang diagnostic push") \
    _Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
    code; \
    _Pragma("clang diagnostic pop") \
  } while (0)

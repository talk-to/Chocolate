
/**
 @param C_ARRAY A C Array
 @return The size of the `C_ARRAY
 @pre The definition of `C_ARRAY` must be in scope when this macro is evaluated.
 */
#define TDT_SIZEOF_ARRAY(C_ARRAY) (sizeof(C_ARRAY) / sizeof((C_ARRAY)[0]))

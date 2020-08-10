/* php_yield extension for PHP */

#ifndef PHP_PHP_YIELD_H
# define PHP_PHP_YIELD_H

#include "php.h"
#include "php_ini.h"
#include "ext/standard/info.h"

#include "yield.h"

#define PHP_STUDY_VERSION "0.1.0"

extern zend_module_entry php_yield_module_entry;

#define phpext_php_yield_ptr &php_yield_module_entry

# define PHP_PHP_YIELD_VERSION "0.1.0"

#ifdef PHP_WIN32
#    define PHP_STUDY_API __declspec(dllexport)
#elif defined(__GNUC__) && __GNUC__ >= 4
#    define PHP_STUDY_API __attribute__ ((visibility("default")))
#else
#    define PHP_STUDY_API
#endif

#ifdef ZTS
#include "TSRM.h"
#endif

ZEND_BEGIN_MODULE_GLOBALS(php_yield)

ZEND_END_MODULE_GLOBALS(php_yield)


void study_coroutine_util_init();

# if defined(ZTS) && defined(COMPILE_DL_PHP_YIELD)
ZEND_TSRMLS_CACHE_EXTERN()
# endif

#endif	/* PHP_PHP_YIELD_H */


/* php_yield extension for PHP */

#ifndef PHP_PHP_YIELD_H
# define PHP_PHP_YIELD_H

extern zend_module_entry php_yield_module_entry;
# define phpext_php_yield_ptr &php_yield_module_entry

# define PHP_PHP_YIELD_VERSION "0.1.0"

# if defined(ZTS) && defined(COMPILE_DL_PHP_YIELD)
ZEND_TSRMLS_CACHE_EXTERN()
# endif

#endif	/* PHP_PHP_YIELD_H */


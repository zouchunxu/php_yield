/* php_yield extension for PHP */

#ifdef HAVE_CONFIG_H

# include "config.h"

#endif

#include "php.h"
#include "ext/standard/info.h"
#include "php_php_yield.h"

/* For compatibility with older PHP versions */
#ifndef ZEND_PARSE_PARAMETERS_NONE
#define ZEND_PARSE_PARAMETERS_NONE() \
    ZEND_PARSE_PARAMETERS_START(0, 0) \
    ZEND_PARSE_PARAMETERS_END()
#endif

PHP_MINIT_FUNCTION (php_yield) {
    study_coroutine_util_init();
    php_printf("MINIT\n");
    return SUCCESS;
}

PHP_MSHUTDOWN_FUNCTION (php_yield) {
    php_printf("MSHUTDOWN\n");
    return SUCCESS;
}

PHP_RINIT_FUNCTION (php_yield) {
#if defined(ZTS) && defined(COMPILE_DL_PHP_YIELD)
    ZEND_TSRMLS_CACHE_UPDATE();
#endif
    php_printf("RINIT\n");
    return SUCCESS;
}

PHP_RSHUTDOWN_FUNCTION (php_yield) {
    php_printf("RSHUTDOWN\n");
    return SUCCESS;
}

PHP_MINFO_FUNCTION (php_yield) {
    php_info_print_table_start();
    php_info_print_table_header(2, "php_yield support", "enabled");
    php_info_print_table_end();
}


/* {{{ void php_yield_test1()
 */
PHP_FUNCTION (php_yield_test1) {
    ZEND_PARSE_PARAMETERS_NONE();

    php_printf("The extension %s is loaded and working!\r\n", "php_yield");
}
/* }}} */

/* {{{ string php_yield_test2( [ string $var ] )
 */
PHP_FUNCTION (php_yield_test2) {
    char *var = "World";
    size_t var_len = sizeof("World") - 1;
    zend_string * retval;

    ZEND_PARSE_PARAMETERS_START(0, 1)
            Z_PARAM_OPTIONAL
            Z_PARAM_STRING(var, var_len)
    ZEND_PARSE_PARAMETERS_END();

    retval = strpprintf(0, "Hello %s", var);

    RETURN_STR(retval);
}
/* }}}*/


/* {{{ arginfo
 */
ZEND_BEGIN_ARG_INFO(arginfo_php_yield_test1, 0)
ZEND_END_ARG_INFO()

ZEND_BEGIN_ARG_INFO(arginfo_php_yield_test2, 0)
                ZEND_ARG_INFO(0, str)
ZEND_END_ARG_INFO()
/* }}} */

/* {{{ php_yield_functions[]
 */
static const zend_function_entry php_yield_functions[] = {
        PHP_FE(php_yield_test1, arginfo_php_yield_test1)
        PHP_FE(php_yield_test2, arginfo_php_yield_test2)
        PHP_FE_END
};
/* }}} */

/* {{{ php_yield_module_entry
 */
zend_module_entry php_yield_module_entry = {
        STANDARD_MODULE_HEADER,
        "php_yield",                    /* Extension name */
        php_yield_functions,            /* zend_function_entry */
        PHP_MINIT(php_yield),                            /* PHP_MINIT - Module initialization */
        PHP_MSHUTDOWN(php_yield),                            /* PHP_MSHUTDOWN - Module shutdown */
        PHP_RINIT(php_yield),            /* PHP_RINIT - Request initialization */
        PHP_RSHUTDOWN(php_yield),                            /* PHP_RSHUTDOWN - Request shutdown */
        PHP_MINFO(php_yield),            /* PHP_MINFO - Module info */
        PHP_PHP_YIELD_VERSION,        /* Version */
        STANDARD_MODULE_PROPERTIES
};
/* }}} */

#ifdef COMPILE_DL_PHP_YIELD
# ifdef ZTS
ZEND_TSRMLS_CACHE_DEFINE()
# endif

ZEND_GET_MODULE(php_yield)

#endif


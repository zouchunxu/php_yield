#ifndef STUDY_COROUTINE_H
#define STUDY_COROUTINE_H

#include "php_php_yield.h"

namespace Study
{
    class PHPCoroutine
    {
        static long create(zend_fcall_info_cache *fci_cache, uint32_t argc, zval *argv);
    };
}

#endif    /* STUDY_COROUTINE_H */
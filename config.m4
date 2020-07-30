dnl config.m4 for extension php_yield

dnl Comments in this file start with the string 'dnl'.
dnl Remove where necessary.

dnl If your extension references something external, use with:

dnl PHP_ARG_WITH(php_yield, for php_yield support,
dnl Make sure that the comment is aligned:
dnl [  --with-php_yield             Include php_yield support])

dnl Otherwise use enable:

PHP_ARG_ENABLE(php_yield, whether to enable php_yield support,
dnl Make sure that the comment is aligned:
[  --enable-php_yield          Enable php_yield support], no)

if test "$PHP_PHP_YIELD" != "no"; then
  dnl Write more examples of tests here...

  dnl # get library FOO build options from pkg-config output
  dnl AC_PATH_PROG(PKG_CONFIG, pkg-config, no)
  dnl AC_MSG_CHECKING(for libfoo)
  dnl if test -x "$PKG_CONFIG" && $PKG_CONFIG --exists foo; then
  dnl   if $PKG_CONFIG foo --atleast-version 1.2.3; then
  dnl     LIBFOO_CFLAGS=\`$PKG_CONFIG foo --cflags\`
  dnl     LIBFOO_LIBDIR=\`$PKG_CONFIG foo --libs\`
  dnl     LIBFOO_VERSON=\`$PKG_CONFIG foo --modversion\`
  dnl     AC_MSG_RESULT(from pkgconfig: version $LIBFOO_VERSON)
  dnl   else
  dnl     AC_MSG_ERROR(system libfoo is too old: version 1.2.3 required)
  dnl   fi
  dnl else
  dnl   AC_MSG_ERROR(pkg-config not found)
  dnl fi
  dnl PHP_EVAL_LIBLINE($LIBFOO_LIBDIR, PHP_YIELD_SHARED_LIBADD)
  dnl PHP_EVAL_INCLINE($LIBFOO_CFLAGS)

  dnl # --with-php_yield -> check with-path
  dnl SEARCH_PATH="/usr/local /usr"     # you might want to change this
  dnl SEARCH_FOR="/include/php_yield.h"  # you most likely want to change this
  dnl if test -r $PHP_PHP_YIELD/$SEARCH_FOR; then # path given as parameter
  dnl   PHP_YIELD_DIR=$PHP_PHP_YIELD
  dnl else # search default path list
  dnl   AC_MSG_CHECKING([for php_yield files in default path])
  dnl   for i in $SEARCH_PATH ; do
  dnl     if test -r $i/$SEARCH_FOR; then
  dnl       PHP_YIELD_DIR=$i
  dnl       AC_MSG_RESULT(found in $i)
  dnl     fi
  dnl   done
  dnl fi
  dnl
  dnl if test -z "$PHP_YIELD_DIR"; then
  dnl   AC_MSG_RESULT([not found])
  dnl   AC_MSG_ERROR([Please reinstall the php_yield distribution])
  dnl fi

  dnl # --with-php_yield -> add include path
  dnl PHP_ADD_INCLUDE($PHP_YIELD_DIR/include)

  dnl # --with-php_yield -> check for lib and symbol presence
  dnl LIBNAME=PHP_YIELD # you may want to change this
  dnl LIBSYMBOL=PHP_YIELD # you most likely want to change this

  dnl PHP_CHECK_LIBRARY($LIBNAME,$LIBSYMBOL,
  dnl [
  dnl   PHP_ADD_LIBRARY_WITH_PATH($LIBNAME, $PHP_YIELD_DIR/$PHP_LIBDIR, PHP_YIELD_SHARED_LIBADD)
  dnl   AC_DEFINE(HAVE_PHP_YIELDLIB,1,[ ])
  dnl ],[
  dnl   AC_MSG_ERROR([wrong php_yield lib version or lib not found])
  dnl ],[
  dnl   -L$PHP_YIELD_DIR/$PHP_LIBDIR -lm
  dnl ])
  dnl
  dnl PHP_SUBST(PHP_YIELD_SHARED_LIBADD)

  dnl # In case of no dependencies
  AC_DEFINE(HAVE_PHP_YIELD, 1, [ Have php_yield support ])

  PHP_NEW_EXTENSION(php_yield, php_yield.c, $ext_shared)
fi

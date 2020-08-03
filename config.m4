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
  PHP_ADD_LIBRARY(pthread)
  STUDY_ASM_DIR="thirdparty/boost/asm/"
  CFLAGS="-Wall -pthread $CFLAGS"

  AS_CASE([$host_os],
        [linux*], [STUDY_OS="LINUX"],
        []
  )

  AS_CASE([$host_cpu],
        [x86_64*], [STUDY_CPU="x86_64"],
        [x86*], [STUDY_CPU="x86"],
        [i?86*], [STUDY_CPU="x86"],
        [arm*], [STUDY_CPU="arm"],
        [aarch64*], [STUDY_CPU="arm64"],
        [arm64*], [STUDY_CPU="arm64"],
        []
  )

  if test "$STUDY_CPU" = "x86_64"; then
      if test "$STUDY_OS" = "LINUX"; then
          STUDY_CONTEXT_ASM_FILE="x86_64_sysv_elf_gas.S"
      fi
  elif test "$STUDY_CPU" = "x86"; then
      if test "$STUDY_OS" = "LINUX"; then
          STUDY_CONTEXT_ASM_FILE="i386_sysv_elf_gas.S"
      fi
  elif test "$STUDY_CPU" = "arm"; then
      if test "$STUDY_OS" = "LINUX"; then
          STUDY_CONTEXT_ASM_FILE="arm_aapcs_elf_gas.S"
      fi
  elif test "$STUDY_CPU" = "arm64"; then
      if test "$STUDY_OS" = "LINUX"; then
          STUDY_CONTEXT_ASM_FILE="arm64_aapcs_elf_gas.S"
      fi
  elif test "$STUDY_CPU" = "mips32"; then
      if test "$STUDY_OS" = "LINUX"; then
         STUDY_CONTEXT_ASM_FILE="mips32_o32_elf_gas.S"
      fi
  fi

  study_source_file="\
          php_yield.c \
          ${STUDY_ASM_DIR}make_${STUDY_CONTEXT_ASM_FILE} \
          ${STUDY_ASM_DIR}jump_${STUDY_CONTEXT_ASM_FILE}
  "
  AC_DEFINE(HAVE_PHP_YIELD, 1, [ Have php_yield support ])

  PHP_NEW_EXTENSION(php_yield, $study_source_file, $ext_shared, ,, cxx)

  PHP_ADD_INCLUDE([$ext_srcdir])
  PHP_ADD_INCLUDE([$ext_srcdir/include])

  PHP_INSTALL_HEADERS([ext/php_yield], [*.h config.h include/*.h thirdparty/*.h])

  PHP_REQUIRE_CXX()

  CXXFLAGS="$CXXFLAGS -Wall -Wno-unused-function -Wno-deprecated -Wno-deprecated-declarations"
  CXXFLAGS="$CXXFLAGS -std=c++11"

  PHP_ADD_BUILD_DIR($ext_builddir/thirdparty/boost)

  PHP_ADD_BUILD_DIR($ext_builddir/thirdparty/boost/asm)
fi

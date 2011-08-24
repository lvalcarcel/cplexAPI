AC_INIT([cplexAPI], [1.1.8], [geliudie@uni-duesseldorf.de])


dnl # --------------------------------------------------------------------
dnl # R compiler and flags
dnl # --------------------------------------------------------------------

: ${R_HOME=`R RHOME`}
if test -z "${R_HOME}"; then
    echo "could not determine R_HOME"
    exit 1
fi


dnl # GNU R default settings
CC=`"${R_HOME}/bin/R" CMD config CC`
CFLAGS=`"${R_HOME}/bin/R" CMD config CFLAGS`
CPPFLAGS=`"${R_HOME}/bin/R" CMD config CPPFLAGS`
AC_PROG_CC


dnl # --------------------------------------------------------------------
dnl # template config.h.in
dnl # --------------------------------------------------------------------

AC_CONFIG_HEADERS([src/config.h])


dnl # --------------------------------------------------------------------
dnl # get arguments
dnl # --------------------------------------------------------------------

AC_ARG_WITH(cplex-include,
            AC_HELP_STRING([--with-cplex-include=PATH],
                           [location of CPLEX include directory]
                          ),
            [CPLEX_INCLUDE=$withval],
            [CPLEX_INCLUDE=""])

AC_ARG_WITH(cplex-lib,
            AC_HELP_STRING([--with-cplex-lib=PATH],
                           [location of CPLEX callable library]
                          ),
            [CPLEX_LIB=$withval],
            [CPLEX_LIB=""])

dnl # CPLEX file check.c for debugging
AC_ARG_WITH(cplex-check,
            AC_HELP_STRING([--with-cplex-check=PATH],
                           [location of CPLEX file check.c]
                          ),
            [CPLEX_CHECK=$withval],
            [CPLEX_CHECK="no"])


dnl # --------------------------------------------------------------------
dnl # test arguments
dnl # --------------------------------------------------------------------

dnl # include and library directories
if test [ -n "$CPLEX_INCLUDE" -a -n "$CPLEX_LIB" ] ; then

    if test [ -d "$CPLEX_INCLUDE" ] ; then
        CPLEX_CPPFLAGS="-I${CPLEX_INCLUDE}"
    else
        AC_MSG_ERROR([directory $CPLEX_INCLUDE does not exist])
    fi

    if test [ -d "$CPLEX_LIB" ] ; then
        LIBS="-L${CPLEX_LIB}"
    else
        AC_MSG_ERROR([directory $CPLEX_LIB does not exist])
    fi

else
    if test [ -n "$CPLEX_INCLUDE" -o -n "$CPLEX_LIB" ] ; then
        AC_MSG_ERROR([Please set both options: --with-cplex-include AND --with-cplex-lib])
    fi
fi


dnl # debugging routines
if test [ "${CPLEX_CHECK}" != "no" ] ; then
    if test [ -r "${CPLEX_CHECK}/check.c" ] ; then
        cp ${CPLEX_CHECK}/check.c src/
        AC_DEFINE([USE_CHECK], [1], [defined, if check.c can be used])
        #AC_DEFINE([CPLEXX_NAMES], [1], [defined, if check.c can be used])
        CPLEX_CPPFLAGS="-DHAVE_CONFIG_H ${CPLEX_CPPFLAGS}"
    else
        AC_MSG_WARN([cannot find file 'check.c'])
    fi
fi

CPPFLAGS="${CPPFLAGS} ${CPLEX_CPPFLAGS}"


dnl # set libraries to link to
INCL="-lcplex -lm -lpthread"


dnl # --------------------------------------------------------------------
dnl # CFLAGS
dnl # --------------------------------------------------------------------

OS_NAME=`uname -s`
MACHINE_NAME=`uname -m`

CPLEX_CFLAGS="-Wall"

dnl # OS dependent
if test [ "${OS_NAME}" = "Darwin" ] ; then
    INCL="${INCL} -framework CoreFoundation -framework IOKit"
    #CPLEX_CFLAGS="${CPLEX_CFLAGS} -ansi"
else
    CPLEX_CFLAGS="${CPLEX_CFLAGS} -std=c99"
    if test [ "${MACHINE_NAME}" = "x86_64" ] ; then
        CPLEX_CFLAGS="${CPLEX_CFLAGS} -m64"
    else
        CPLEX_CFLAGS="${CPLEX_CFLAGS} -m32"
    fi
fi


dnl # compiler dependent
if test [ "${CC:0:3}" = "icc" ] ; then

dnl # for icc: disable remark #981: operands are evaluated in unspecified order
    CPLEX_CFLAGS="${CPLEX_CFLAGS} -wd981"
else
    if test [ "${CC:0:3}" = "gcc" ] ; then
        CPLEX_CFLAGS="${CPLEX_CFLAGS} -Wextra -Wunknown-pragmas"
        CPLEX_CFLAGS="${CPLEX_CFLAGS} -Wconversion -Wwrite-strings"
        CPLEX_CFLAGS="${CPLEX_CFLAGS} -pedantic"
    fi
fi

LIBS="$LIBS $INCL"


dnl # --------------------------------------------------------------------
dnl # check header and library
dnl # --------------------------------------------------------------------

AC_CHECK_HEADER([ilcplex/cplex.h], ,
    AC_MSG_ERROR([Could not find cplex.h:
      cplexAPI requires IBM ILOG CPLEX from http://www.ibm.com/.
      use --with-clpex-include or CPLEX_INCLUDE to specify the include path.]))


AC_SEARCH_LIBS([CPXopenCPLEX], [cplex], ,
    AC_MSG_ERROR([Could not link to IBM ILOG CPLEX:
      use --with-cplex-lib or CPLEX_LIB to specify the library path.]))


dnl # --------------------------------------------------------------------
dnl # substitute src/Makevars
dnl # --------------------------------------------------------------------

AC_SUBST(CPLEX_CFLAGS)
AC_SUBST(CPLEX_CPPFLAGS)
AC_SUBST(LIBS)
AC_OUTPUT(src/Makevars)

exit 0

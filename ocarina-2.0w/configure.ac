AC_PREREQ(2.57)
AC_INIT(ocarina, 2.0w, ocarina-users@enst.fr)
AC_CONFIG_SRCDIR(src)
AC_CONFIG_AUX_DIR(support)

##########################################
# Initialization.
##########################################

AC_CANONICAL_SYSTEM
AM_INIT_AUTOMAKE([1.9 tar-pax])

##########################################
# Check fo various programs.
##########################################

AC_CHECK_PROG(MV, mv, mv)
AC_CHECK_PROG(RM, rm, rm)
AC_CHECK_PROG(CP, cp, cp)
AC_CHECK_PROG(GREP, grep, grep)
AC_CHECK_PROG(CHMOD, chmod, chmod)
AC_CHECK_TOOL([STRIP],[strip])
AC_PROG_RANLIB
AM_PROG_GNATMAKE
AM_CROSS_PROG_GNATMAKE
AM_PROG_WORKING_ADA
AM_CROSS_PROG_WORKING_ADA
AM_HAS_APDIR
AC_CHECK_PROG(GNATCLEAN, gnatclean, gnatclean)
AC_CHECK_PROG(GNATLS, gnatls, gnatls)
AC_EXEEXT
AM_PATH_PYTHON

##########################################
# Check for the path kind used by GNAT
##########################################

AC_MSG_CHECKING([the path kind used by the Ada compiler])
PATH_KIND=`$GNATLS -v 2>&1 \
      | grep -A2 '^Source Search Path:' \
      | tail -1 | tr '[[A-Z]]' '[[a-z]]' \
      | sed -e 's, *[[a-z]]:[[/\\]].*,WINDOWS,g' \
      | sed -e 's, */.*,UNIX,g'`
case ${PATH_KIND} in
     "WINDOWS" | "UNIX" )
         AC_MSG_RESULT($PATH_KIND)
	 ;;
     * )
	 AC_MSG_WARN([gnatls ("$GNATLS") uses an unknown path kind: "${PATH_KIND}. Assuming UNIX path"])
	 PATH_KIND=UNIX
	 ;;
esac
AC_SUBST(PATH_KIND)

##########################################
# Check for GNU Make
##########################################

AM_GNU_MAKE

##########################################
# XML/Ada
##########################################

XMLADA_INCS=""
XMLADA_LIBS=""
XMLADA_FLAGS=""
XMLADA_PROJECT=""
has_xmlada=no

AC_MSG_CHECKING([XmlAda])
if xmlada-config --version 2>&1 | ${GREP} "^XmlAda" > /dev/null 2>&1; then
   XMLADA_CONFIG=xmlada-config
   XMLADA_INCS="`xmlada-config --cflags`"
   XMLADA_LIBS="`xmlada-config --libs`"
   XMLADA_PROJECT="`xmlada-config --prefix`/lib/gnat"
   has_xmlada=yes
else
   XMLADA_CONFIG=no
   has_xmlada=no
fi
AC_MSG_RESULT($has_xmlada)
AM_CONDITIONAL(HAS_XMLADA, [test "x$has_xmlada" = "xyes"])

AC_SUBST(XMLADA_INCS)
AC_SUBST(XMLADA_LIBS)
AC_SUBST(XMLADA_CONFIG)
AC_SUBST(XMLADA_PROJECT)

##########################################
# Check for maintainer (debug) mode.
##########################################

GNATFLAGS=""

define(DEBUG_OPTIONS, [dnl
  GNATFLAGS="-XBUILD=debug"
  debug=true])
define(NODEBUG_OPTIONS, [dnl
  GNATFLAGS="-XBUILD=release"
  debug=false])

AC_ARG_ENABLE(debug,
[  --enable-debug          Turn on debugging options],
[if [[ "$enableval" = "yes" ]]; then
  DEBUG_OPTIONS
else
  NODEBUG_OPTIONS
fi],
[NODEBUG_OPTIONS])

define(GCOV_OPTIONS, [dnl
  GCOV=""
  gcov=true])
define(NOGCOV_OPTIONS, [dnl
  GCOV="-- "
  gcov=false])

AC_ARG_ENABLE(gcov,
[  --enable-gcov           Turn on gcov],
[if [[ "$enableval" = "yes" ]]; then
  GCOV_OPTIONS
else
  NOGCOV_OPTIONS
fi],
[NOGCOV_OPTIONS])

AC_SUBST(GNATFLAGS)
AC_SUBST(GCOV)
AM_CONDITIONAL(DEBUG, test x$debug = xtrue)


define(SHARED_LIBRARY_OPTIONS, [dnl
  GNAT_LIB_FLAGS="-XLIBRARY=dynamic"
  shared=true])
define(NO_SHARED_LIBRARY_OPTIONS, [dnl
  GNAT_LIB_FLAGS="-XLIBRARY=static"
  shared=false])

AC_ARG_ENABLE(shared,
[  --enable-shared         Build shared libraries],
[if [[ "$enableval" = "yes" ]]; then
  SHARED_LIBRARY_OPTIONS
else
  NO_SHARED_LIBRARY_OPTIONS
fi],
[NO_SHARED_LIBRARY_OPTIONS])

AC_SUBST(GNAT_LIB_FLAGS)
AM_CONDITIONAL(SHARED_LIBRARY, test x$shared = xtrue)

##########################################
# Windows requires specific targets
##########################################

case "$host_os" in
  *cygwin* | *mingw*)
    windows=true
    ;;
  *)
    windows=false
    ;;
esac
AM_CONDITIONAL(WINDOWS, test x$windows = xtrue)

case "$target_os" in
  *cygwin* | *mingw*)
    EXE_SUFFIX=.exe
    ;;
  *)
    EXE_SUFFIX=
    ;;
esac
AC_SUBST(EXE_SUFFIX)

######################################################
# See whether a unified tree build has been requested
######################################################

root="`dirname $0`"

AC_MSG_CHECKING([default services])
AC_ARG_WITH(ocarina-runtimes,
AS_HELP_STRING([--with-ocarina-runtimes=x], [enumerate runtimes]),
[
  RUNTIME_LIST=""
  AM_CONDITIONAL(PO_HI_ADA, false)
  AM_CONDITIONAL(PO_HI_C, false)
  AM_CONDITIONAL(PO_HI_JAVA, false)
  AM_CONDITIONAL(PO_QOS_ADA, false)
  AM_CONDITIONAL(POK, false)

  newwithval=`echo ${withval} | tr "[A-Z]" "[a-z]"`
  for R in ${newwithval}
  do
     case ${R} in
        all )
	    for P in polyorb-hi-ada polyorb-hi-c polyorb-qos-ada polyorb-hi-java
            do
	       if test -d ${root}/resources/runtime/${P}
     	       then
	          RUNTIME_LIST="${RUNTIME_LIST}${P} "
               else
                  AC_MSG_ERROR([runtime ${P} not found])
     	       fi
            done

            AM_CONDITIONAL(PO_HI_ADA, true)
	    AM_CONDITIONAL(PO_HI_C, true)
	    AM_CONDITIONAL(PO_HI_JAVA, true)
            AM_CONDITIONAL(PO_QOS_ADA, true)
	    ;;

        none )
	    AM_CONDITIONAL(PO_HI_ADA, false)
	    AM_CONDITIONAL(PO_HI_C, false)
            AM_CONDITIONAL(PO_QOS_ADA, false)
	    ;;
	 
	pok )
            if test -d ${root}/resources/runtime/${R}
            then
               RUNTIME_LIST="${RUNTIME_LIST}${R} "
            else
               AC_MSG_ERROR([runtime ${R} not found])
            fi
	    AM_CONDITIONAL(POK, true)
	    ;;

	polyorb-hi-ada )
            if test -d ${root}/resources/runtime/${R}
            then
               RUNTIME_LIST="${RUNTIME_LIST}${R} "
            else
               AC_MSG_ERROR([runtime ${R} not found])
            fi
	    AM_CONDITIONAL(PO_HI_ADA, true)
	    ;;

	polyorb-hi-c )
            if test -d ${root}/resources/runtime/${R}
            then
               RUNTIME_LIST="${RUNTIME_LIST}${R} "
            else
               AC_MSG_ERROR([runtime ${R} not found])
            fi
	    AM_CONDITIONAL(PO_HI_C, true)
	    ;;

	polyorb-hi-java )
            if test -d ${root}/resources/runtime/${R}
            then
               RUNTIME_LIST="${RUNTIME_LIST}${R} "
            else
               AC_MSG_ERROR([runtime ${R} not found])
            fi
	    AM_CONDITIONAL(PO_HI_JAVA, true)
	    ;;

	polyorb-qos-ada )
            if test -d ${root}/resources/runtime/${R}
            then
               RUNTIME_LIST="${RUNTIME_LIST}${R} "
            else
               AC_MSG_ERROR([runtime ${R} not found])
            fi
	    AM_CONDITIONAL(PO_QOS_ADA, true)
	    ;;

	* )
	    AC_MSG_ERROR([unknown runtime ${R}])
	    ;;
     esac
  done
  RUNTIME_LIST=`echo "$RUNTIME_LIST" | sed 's/ $//'`
],
[
  RUNTIME_LIST=""
  AM_CONDITIONAL(POK, test -d "${root}/resources/runtime/pok")
  AM_CONDITIONAL(PO_HI_ADA, test -d "${root}/resources/runtime/polyorb-hi-ada")
  AM_CONDITIONAL(PO_HI_C, test -d "${root}/resources/runtime/polyorb-hi-c")
  AM_CONDITIONAL(PO_HI_JAVA, test -d "${root}/resources/runtime/polyorb-hi-java")
  AM_CONDITIONAL(PO_QOS_ADA, test -d "${root}/resources/runtime/polyorb-qos-ada")
])
AC_MSG_RESULT(${RUNTIME_LIST})
AC_SUBST(RUNTIME_LIST)

AC_MSG_CHECKING([for default AADL version])
AC_ARG_WITH(aadl-version,
AS_HELP_STRING([--with-aadl-version=x], [choose AADL version (v1)]),
[
  AADL_VERSION="AADL_V1"
  newval=`echo ${withval} | tr "A-Z" "a-z"`
  case ${newval} in
  v1 )
     AADL_VERSION=AADL_V1
     ;;
  v2 )
     AADL_VERSION=AADL_V2
     ;;
  * )
     AC_MSG_ERROR([no such AADL version])
  esac
],
[
  AADL_VERSION="AADL_V1"
  newval="v1"
])
AC_MSG_RESULT(${newval})
AC_SUBST(AADL_VERSION)

##########################################
# Some version control stuff
##########################################

current_conf_dir="`dirname $0`"
AM_REVISION_UTILS([${current_conf_dir}])

##########################################
# Some final adjustments
##########################################

# Adjust the value of CYGPATH_W depending on the nature of the used
# compiler. On windows platforms, if the used Ada compiler has been
# compiled for target *cygwin*, there is no need for the "cygpath -w"
# path converter.

if test x"${PATH_KIND}" = x"UNIX"; then
   CYGPATH_W="echo"
   PATH_SEP=":"
else
   PATH_SEP=";"
fi;

# Substitute only PATH_SEP because CYGPATH_W is handled automatically
# by autoconf.

AC_SUBST(PATH_SEP)

if test x"$CYGPATH_W" = x"echo"; then
   CYGPATH_U="echo"
else
   CYGPATH_U="cygpath -u"
fi
AC_SUBST(CYGPATH_U)

##########################################
# Output generated files
##########################################

dnl Important! One file per line, nothing before
dnl or after except whitespace! This section
dnl may, one day, be edited automatically to remove 
dnl some entries.

AC_OUTPUT([
	Makefile
	doc/Makefile
	doc/real/Makefile
	examples/Makefile
	examples/petri_net/Makefile
	examples/petri_net/robot/Makefile
	examples/real/Makefile
	examples/real/lib/Makefile
	examples/real/resources/Makefile
	examples/real/safety/Makefile
	examples/real/security/Makefile
	projects/Makefile
	projects-distrib/Makefile
	resources/Makefile
	resources/behavioural_properties/Makefile
	resources/runtime/Makefile
	resources/runtime/cheddar/Makefile
	projects/ocarina.gpr
	src/main/Makefile
	src/main/ocarina-configuration.adb
	src/frontends/Makefile
	src/core/Makefile
	src/transfo/Makefile
	src/backends/Makefile
	src/Makefile
	support/Makefile
	support/strip_wrapper.sh
	tools/Makefile
	tools/gendoc.py
	tools/compare.py
	ocarina-config
])

AC_MSG_NOTICE(%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%)
AC_MSG_NOTICE(Ocarina configuration is complete!)
AC_MSG_NOTICE(Including the following Ocarina modules: $OCARINA_MODULES)
AC_MSG_NOTICE(GNU make command name: "$GNU_MAKE")
AC_MSG_NOTICE(%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%)

##########################################
# Some post-configure manipulations
##########################################

${CHMOD} a+x tools/gendoc.py
${CHMOD} a+x tools/compare.py
${CHMOD} a+x support/strip_wrapper.sh

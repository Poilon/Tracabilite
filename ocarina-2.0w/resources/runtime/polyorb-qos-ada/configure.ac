AC_PREREQ(2.57)
AC_INIT(PolyORB-QoS/Ada, 1.0w, aadl-devel@listes.enst.fr)
AC_CONFIG_SRCDIR(src)
AC_CONFIG_AUX_DIR(support)

##########################################
# Initialization.
##########################################

AC_CANONICAL_SYSTEM
AM_INIT_AUTOMAKE([1.9 tar-pax] foreign)

##########################################
# Check fo various programs.
##########################################

AC_CHECK_PROG(MV, mv, mv)
AC_CHECK_PROG(RM, rm, rm)
AC_CHECK_PROG(CP, cp, cp)
AC_CHECK_PROG(GREP, grep, grep)
AC_CHECK_PROG(CHMOD, chmod, chmod)
AC_CHECK_PROG(TEX, tex, tex)
AC_CHECK_PROG(BIBTEX, bibtex, bibtex)
AC_PROG_RANLIB
AC_EXEEXT
AM_PATH_PYTHON

##########################################
# Check for GNU Make
##########################################

AM_GNU_MAKE

##########################################
# Check for various GNAT installations
##########################################

# The user must have at least an operation native GNAT Ada compiler

AM_PROG_WORKING_ADA
AM_PROG_GNATMAKE
AM_PROG_WORKING_ADA
AC_CHECK_PROG(GNATCLEAN, gnatclean, gnatclean)

##########################################
# Check for Ocarina
##########################################

AM_PATH_OCARINA(1.1, ,AC_MSG_ERROR([Ocarina 1.1 or later is not installed on your system]))

##########################################
# Check for maintainer (debug) mode.
##########################################

GNATFLAGS=""

define(DEBUG_OPTIONS, [dnl
  GNATFLAGS="-XBUILD=debug"
  WARNINGS_ARE_ERRORS=""
  debug=true])
define(NODEBUG_OPTIONS, [dnl
  GNATFLAGS="-XBUILD=release"
  WARNINGS_ARE_ERRORS="--  "
  debug=false])

AC_ARG_ENABLE(debug,
[  --enable-debug          Turn on debugging options],
[if [[ "$enableval" = "yes" ]]; then
  DEBUG_OPTIONS
else
  NODEBUG_OPTIONS
fi],
[DEBUG_OPTIONS])

AC_SUBST(GNATFLAGS)
AC_SUBST(WARNINGS_ARE_ERRORS)
AM_CONDITIONAL(DEBUG, test x$debug = xtrue)

##########################################
# PolyORB
##########################################

POLYORB_MIN_V="2.2"
TAB="	"

AM_PATH_POLYORB(${POLYORB_MIN_V}, ,AC_MSG_WARN(
[${TAB}PolyORB ${POLYORB_MIN_V} or later is not installed on your system. 
${TAB}${TAB}${TAB}The Ocarina PolyORB runtime will not be installed on 
${TAB}${TAB}${TAB}your system.]))

##########################################
# Windows requires specific targets
##########################################

case "$host_os" in
  cygwin* | mingw*)
    windows=true
    ;;
  *)
    windows=false
    ;;
esac
AM_CONDITIONAL(WINDOWS, test x$windows = xtrue)

############################################
# Set the value corresponding to cygpath -u
############################################

if test x"$CYGPATH_W" = x"echo"; then
   CYGPATH_U="echo"
else
   CYGPATH_U="cygpath -u"
fi
AC_SUBST(CYGPATH_U)

###############################################################
# Force the installation prefix to be equal to the Ocarina one
###############################################################

prefix='$(OCARINA_PREFIX)'

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
	examples/Makefile
	examples/bbs/Makefile
	examples/bintree/Makefile
	examples/man_in_the_middle/Makefile
	examples/producer_consumer/Makefile
	examples/ring/Makefile
	examples/shared/Makefile
	examples/hybrid_subprogram/Makefile
	examples/priorities/Makefile
	examples/import/Makefile
	examples/monolithic/Makefile
	src/Makefile
	support/gendoc.py
	support/Makefile
])

AC_MSG_NOTICE(%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%)
AC_MSG_NOTICE(PolyORB-QoS/Ada configuration is complete!)
AC_MSG_NOTICE(GNU make command name: "$GNU_MAKE")
AC_MSG_NOTICE(%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%)

##########################################
# Some post-configure manipulations
##########################################

${CHMOD} a+x support/gendoc.py

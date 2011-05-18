#! /bin/sh

# This script invokes the stript utility with the right path kind
# (UNIX or Windows).

STRIP="strip"
EXECUTABLE="$1"
CYGPATH_W="echo"

${STRIP} "`${CYGPATH_W} ${EXECUTABLE}`"
exit $?

# !/bin/sh

# This script build all the distributed application generation
# examples and stores the result in a subdirectory of the current
# directory

# If the -n flag is given, the example will not be compiled.

# Build the tests

comp=true

while test $# -gt 0; do
  case "$1" in
      -n) comp=false ;;
  esac
  shift
done

script_dir=`dirname $0`

# The default value for the path converter is 'echo'. By default, we
# do not convert paths. the user may override this value by providing
# his own path converter (such as 'cygpath -w').
path_conv="${path_conv-echo}"

build_and_compile () {
    if test x${comp} = x"true"; then
	ocarina -b -x "`${path_conv} $1`"
	
	CODE=$?
	
	if test ! ${CODE} = 0; then
	    exit ${CODE}
	fi
    else
	ocarina -x "`${path_conv} $1`"
    fi;
}

SCENARIO_FILES="${script_dir}/bbs/scenario.aadl\
    ${script_dir}/bintree/scenario_1.aadl\
    ${script_dir}/bintree/scenario_2.aadl\
    ${script_dir}/bintree/scenario_2_udp.aadl\
    ${script_dir}/man_in_the_middle/scenario.aadl\
    ${script_dir}/producer_consumer/scenario.aadl\
    ${script_dir}/ring/scenario_1.aadl\
    ${script_dir}/ring/scenario_1_udp.aadl\
    ${script_dir}/ring/scenario_2.aadl\
    ${script_dir}/hybrid_subprogram/scenario_1.aadl\
    ${script_dir}/hybrid_subprogram/scenario_2.aadl\
    ${script_dir}/hybrid_subprogram/scenario_3.aadl\
    ${script_dir}/priorities/scenario.aadl\
    ${script_dir}/priorities/scenario_inv.aadl\
    ${script_dir}/import/scenario_1.aadl\
    ${script_dir}/import/scenario_2.aadl\
    ${script_dir}/import/scenario_3.aadl\
    ${script_dir}/import/scenario_4.aadl\
    ${script_dir}/monolithic/scenario.aadl"

#     ${script_dir}/shared/scenario.aadl\

for S in ${SCENARIO_FILES}; do
    build_and_compile ${S}
done;

# !/bin/sh

# This scripts runs all the distributed application generation
# examples and stores the execution result in several .log files in
# the current directory

trace_list=""

# Create result files

execution_dir=`pwd`
bin_dirs=`find . -name 'bin'`
test_result=${execution_dir}/global_result.log
script_dir=`dirname $0`; cd ${script_dir}; script_dir=`pwd`
cd ${execution_dir}

rm -f ${test_result}

touch ${test_result}

for d in ${bin_dirs}; do
    example_dir=`dirname ${d}`;
    partial_trace=${execution_dir}/${example_dir}.log
    trace_list="${trace_list} ${partial_trace}"
    
    clear
    rm -f ${partial_trace}
    touch ${partial_trace}

    cd ${d}
    echo `ls`
    echo `pwd`

    # Get the PIDs of all nodes in a variables to kill them after the
    # execution

    PIDs=

    # Run all the distributed application nodes in the order given by the
    # scenario file
    
    nodes=`ls ?*`
    echo "Running example ${example_dir}"
    echo "Nodes : ${nodes}"
    for i in ${nodes}; do
	echo "${example_dir}: running node ${i}"
	./${i} >> ${partial_trace} &
	PID=$!
	echo "${i} PID = ${PID}"
	
	PIDs="${PIDs} ${PID}"
	
	# Sleep for one second
	
	sleep 1
    done

    echo "ALL PIDs : ${PIDs}"
    
    # Let the nodes run for 3 seconds to see significant result

    sleep 3

    # Kill all nodes

    /bin/kill -9 ${PIDs} >/dev/null
    code=$?
    
    if [ ${code} -eq 0 ] ; then
	echo "${example_dir}: Probably PASSED" >> ${test_result}
    else
	echo "${example_dir}: Surely FAILED" >> ${test_result}
    fi

    sleep 2

    # Leave the example directory

    cd ${execution_dir}
done

sleep 1

cat ${trace_list}
cat ${test_result}

# If all examples passed, exit with status code 0, otherwise, exist
# with status code 1.

(((cat ${test_result} | grep "FAILED") && exit 1) || exit 0)

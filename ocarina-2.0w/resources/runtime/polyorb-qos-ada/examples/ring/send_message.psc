--  example of behavioural definition for "send_message"

list $places_to_merge;
list $transitions_to_merge;

create transition "sn_sn_th1_sp1_func_enter";
create transition "sn_sn_th1_sp1_func_leave";

create place "exec_function";

connect transition "sn_sn_th1_sp1_func_enter" to place "exec_function";
connect place "exec_function" to transition "sn_sn_th1_sp1_func_leave";

append transition "sn_sn_th1_sp1_func_enter" to $transitions_to_merge;
append transition "sn_sn_th1_sp1_func_leave" to $transitions_to_merge;

------------------------------------------------------------------------------
--                                                                          --
--                           OCARINA COMPONENTS                             --
--                                                                          --
--     O C A R I N A . B A C K E N D S . P O _ H I _ C . R U N T I M E      --
--                                                                          --
--                                 S p e c                                  --
--                                                                          --
--               Copyright (C) 2008-2009, GET-Telecom Paris.                --
--                                                                          --
-- Ocarina  is free software;  you  can  redistribute  it and/or  modify    --
-- it under terms of the GNU General Public License as published by the     --
-- Free Software Foundation; either version 2, or (at your option) any      --
-- later version. Ocarina is distributed  in  the  hope  that it will be    --
-- useful, but WITHOUT ANY WARRANTY;  without even the implied warranty of  --
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General --
-- Public License for more details. You should have received  a copy of the --
-- GNU General Public License distributed with Ocarina; see file COPYING.   --
-- If not, write to the Free Software Foundation, 51 Franklin Street, Fifth --
-- Floor, Boston, MA 02111-1301, USA.                                       --
--                                                                          --
-- As a special exception,  if other files  instantiate  generics from this --
-- unit, or you link  this unit with other files  to produce an executable, --
-- this  unit  does not  by itself cause  the resulting  executable to be   --
-- covered  by the  GNU  General  Public  License. This exception does not  --
-- however invalidate  any other reasons why the executable file might be   --
-- covered by the GNU Public License.                                       --
--                                                                          --
--                 Ocarina is maintained by the Ocarina team                --
--                       (ocarina-users@listes.enst.fr)                     --
--                                                                          --
------------------------------------------------------------------------------

package Ocarina.Backends.PO_HI_C.Runtime is

   --  Headers file that can be included

   type RH_Id is
     (RH_Null,                       --  Workaround to denote a null RH
      RH_PO_HI_Task,                 --  po_hi_task header
      RH_PO_HI_Time,                 --  po_hi_time header
      RH_PO_HI_Common,               --  po_hi_common header
      RH_PO_HI_Main,                 --  po_hi_main header
      RH_PO_HI_Messages,             --  po_hi_messages header
      RH_PO_HI_Protected,            --  po_hi_protected header
      RH_PO_HI_Marshallers,          --  po_hi_marshallers header
      RH_PO_HI_Returns,              --  po_hi_returns header
      RH_PO_HI_Transport,            --  po_hi_marshallers header
      RH_PO_HI_Types,                --  po_hi_types header
      RH_PO_HI_Gqueue,               --  po_hi_gqueue header
      RH_PO_HI_Protocols,            --  po_hi_protocols header
      RH_PO_HI_Simulink,             --  po_hi_simulink header
      RH_PO_HI_Utils,                --  po_hi_utils header
      RH_Activity,                   --  the activity header
      RH_Request,                    --  the request header
      RH_Types,                      --  the types header
      RH_Marshallers,                --  the marshallers header
      RH_Subprograms,                --  the subprograms
      RH_Deployment
     );

   --  Runtime Entities

   type RE_Id is
     (RE_Null,                           --  Workaround to denote a null RE
      RE_Microseconds,                   --  __po_hi_microseconds
      RE_Milliseconds,                   --  __po_hi_milliseconds
      RE_Seconds,                        --  __po_hi_seconds
      RE_Minutes,                        --  __po_hi_minutes
      RE_Create_Periodic_Task,           -- __po_hi_create_periodic_task
      RE_Create_Sporadic_Task,           -- __po_hi_create_sporadic_task
      RE_Wait_For_Next_Period,           -- __po_hi_task_wait_for_next_period
      RE_Initialize,                     -- __po_hi_initialize
      RE_Wait_Initialization,            -- __po_hi_wait_initialization
      RE_Marshall_Bool,                  -- __po_hi_marshall_bool
      RE_Unmarshall_Bool,                -- __po_hi_unmarshall_bool
      RE_Marshall_Char,                  -- __po_hi_marshall_char
      RE_Unmarshall_Char,                -- __po_hi_unmarshall_char
      RE_Marshall_Float,                 -- __po_hi_marshall_float
      RE_Unmarshall_Float,               -- __po_hi_unmarshall_float
      RE_Marshall_Float32,               -- __po_hi_marshall_float32
      RE_Unmarshall_Float32,             -- __po_hi_unmarshall_float32
      RE_Marshall_Float64,               -- __po_hi_marshall_float64
      RE_Unmarshall_Float64,             -- __po_hi_unmarshall_float64
      RE_Marshall_Request,               -- __po_hi_marshall_request
      RE_Unmarshall_Request,             -- __po_hi_unmarshall_request
      RE_Marshall_Int,                   -- __po_hi_marshall_int
      RE_Unmarshall_Int,                 -- __po_hi_unmarshall_int
      RE_Marshall_Int8,                  -- __po_hi_marshall_int8
      RE_Unmarshall_Int8,                -- __po_hi_unmarshall_int8
      RE_Marshall_Int16,                 -- __po_hi_marshall_int16
      RE_Unmarshall_Int16,               -- __po_hi_unmarshall_int16
      RE_Marshall_Int32,                 -- __po_hi_marshall_int32
      RE_Unmarshall_Int32,               -- __po_hi_unmarshall_int32
      RE_Marshall_Int64,                 -- __po_hi_marshall_int64
      RE_Unmarshall_Int64,               -- __po_hi_unmarshall_int64
      RE_Marshall_Uint8,                 -- __po_hi_marshall_uint8
      RE_Unmarshall_Uint8,               -- __po_hi_unmarshall_uint8
      RE_Marshall_Uint16,                -- __po_hi_marshall_uint16
      RE_Unmarshall_Uint16,              -- __po_hi_unmarshall_uint16
      RE_Marshall_Uint32,                -- __po_hi_marshall_uint32
      RE_Unmarshall_Uint32,              -- __po_hi_unmarshall_uint32
      RE_Marshall_Uint64,                -- __po_hi_marshall_uint64
      RE_Unmarshall_Uint64,              -- __po_hi_unmarshall_uint64
      RE_Marshall_Port,                  -- __po_hi_marshall_port
      RE_Unmarshall_Port,                -- __po_hi_unmarshall_port
      RE_Marshall_Array,                 -- __po_hi_marshall_array
      RE_Unmarshall_Array,               -- __po_hi_unmarshall_array
      RE_Gqueue_Init,                    -- __po_hi_gqueue_init
      RE_Gqueue_Store_In,                -- __po_hi_gqueue_store_in
      RE_Gqueue_Store_Out,               -- __po_hi_gqueue_store_out
      RE_Gqueue_Get_Count,               -- __po_hi_gqueue_get_count
      RE_Gqueue_Send_Output,             -- __po_hi_gqueue_send_output
      RE_Gqueue_Get_Value,               -- __po_hi_gqueue_get_value
      RE_Gqueue_Next_Value,              -- __po_hi_gqueue_next_value
      RE_Gqueue_Wait_For_Incoming_Event, -- __po_hi_gqueue_wait_for_incoming
      RE_Compute_Next_Period,            -- __po_hi_compute_next_period
      RE_Simulate_WCET,                  -- __po_hi_simulate_wcet
      RE_Sporadic_Wait,                  -- __po_hi_sporadic_wait
      RE_Compute_Miss,                   -- __po_hi_compute_miss
      RE_Sporadic_Wait_Release,          -- __po_hi_sporadic_wait_release
      RE_Protocols_Send,                 -- __po_hi_protocols_send
      RE_Main_Deliver,                   -- __po_hi_main_deliver
      RE_Protocols_Receive,              -- __po_hi_protocols_receive
      RE_Protocols_Nonblocking_Receive,  -- __po_hi_protocols_receive
      RE_Msg_Reallocate,                 -- __po_hi_msg_reallocate
      RE_Copy_Array,                     -- __po_hi_copy_array
      RE_Protected_Lock,                 -- __po_hi_protected_lock
      RE_Protected_Unlock,               -- __po_hi_protected_unlock
      RE_Simulink_Init,                  -- __po_hi_simulink_init
      RE_Simulink_Find_Signal,           -- __po_hi_simulink_find_signal
      RE_Simulink_Find_Var,              -- __po_hi_simulink_find_var
      RE_Simulink_Find_Parameter,        -- __po_hi_simulink_find_parameter
      RE_Simulink_Update,                -- __po_hi_simulink_update
      RE_Wait_For_Tasks,                 -- __po_hi_wait_for_tasks

      RE_Default_Priority,               --  __PO_HI_DEFAULT_PRIORITY
      RE_Main_Type,                      --  __PO_HI_MAIN_TYPE
      RE_Main_Args,                      --  __PO_HI_MAIN_ARGS
      RE_Main_Name,                      --  __PO_HI_MAIN_NAME
      RE_Main_Return,                    --  __PO_HI_MAIN_RETURN
      RE_Nb_Servers,                     --  __PO_HI_NB_SERVERS
      RE_Nb_Ports,                       --  __PO_HI_NB_PORTS
      RE_Noport,                         --  __PO_HI_NOPORT
      RE_Noaddr,                         --  __PO_HI_NB_NOADDR
      RE_Unused_Node,                    --  __PO_HI_UNUSED_NODE
      RE_Nb_Protected,                   --  __PO_HI_NB_PROTECTED
      RE_Nb_Nodes,                       --  __PO_HI_NB_NODES
      RE_Gqueue_Fifo_Indata,             --  __PO_HI_GQUEUE_FIFO_DATA
      RE_Gqueue_Fifo_Out,                --  __PO_HI_GQUEUE_FIFO_OUT
      RE_Nb_Operations,                  --  __PO_HI_NB_OPERATIONS
      RE_Nb_Entities,                    --  __PO_HI_NB_ENTITIES
      RE_Simulink_Node,                  --  __PO_HI_SIMULINK_NODE
      RE_Simulink_Init_Func,             --  __PO_HI_SIMULINK_INIT
      RE_Simulink_Model_Type,            --  __PO_HI_SIMULINK_MODEL
      RE_Nb_Tasks,                       --  __PO_HI_NB_TASKS
      RE_SUCCESS,                        --  __PO_HI_SUCCESS

      RE_Task_Id,                        --  __po_hi_task_id
      RE_Entity_T,                       --  __po_hi_entity_t
      RE_Inetport_T,                     --  __po_hi_inetport_t
      RE_Inetaddr_T,                     --  __po_hi_inetaddr_t
      RE_Protected_T,                    --  __po_hi_protected_t
      RE_Entity_Server_T,                --  __po_hi_entity_server_t
      RE_Operation_T,                    --  __po_hi_operation_t
      RE_Request_T,                      --  __po_hi_request_t
      RE_Bool_T,                         --  __po_hi_bool_t
      RE_Uint64_T,                       --  __po_hi_uint64_t
      RE_Uint32_T,                       --  __po_hi_uint32_t
      RE_Uint16_T,                       --  __po_hi_uint16_t
      RE_Uint8_T,                        --  __po_hi_uint8_t
      RE_Int8_T,                         --  __po_hi_int8_t
      RE_Int16_T,                        --  __po_hi_int16_t
      RE_Int32_T,                        --  __po_hi_int32_t
      RE_Int64_T,                        --  __po_hi_int64_t
      RE_Float32_T,                      --  __po_hi_float32_t
      RE_Float64_T,                      --  __po_hi_float64_t
      RE_Msg_T,                          --  __po_hi_msg_t
      RE_Port_T,                         --  __po_hi_port_t
      RE_Local_Port_T,                   --  __po_hi_local_port_t
      RE_Node_T,                         --  __po_hi_node_t

      RE_Operation_Names,                --  __po_hi_operation_names
      RE_Ports_Names,                    --  __po_hi_port_names
      RE_Port_Global_To_Entity,          --  __po_hi_port_global_to_entity
      RE_Port_Global_To_Local            --  __po_hi_port_global_to_local
     );

   --  Runtime types

   subtype RT_Id is RE_Id range RE_Task_Id .. RE_Node_T;
   subtype RC_Id is RE_Id range RE_Default_Priority .. RE_SUCCESS;
   subtype RF_Id is RE_Id range RE_Null .. RE_Wait_For_Tasks;
   subtype RV_Id is RE_Id range RE_Operation_Names .. RE_Port_Global_To_Local;

   RE_Header_Table : constant array (RE_Id) of RH_Id
     := (RE_Null                           => RH_Null,
         --  Runtime functions associations
         RE_Microseconds                   => RH_PO_HI_Time,
         RE_Milliseconds                   => RH_PO_HI_Time,
         RE_Seconds                        => RH_PO_HI_Time,
         RE_Minutes                        => RH_PO_HI_Time,
         RE_Protocols_Send                 => RH_PO_HI_Protocols,
         RE_Protocols_Receive              => RH_PO_HI_Protocols,
         RE_Protocols_Nonblocking_Receive  => RH_PO_HI_Protocols,
         RE_Unused_Node                    => RH_PO_HI_Types,
         RE_Msg_Reallocate                 => RH_PO_HI_Messages,
         RE_Marshall_Array                 => RH_PO_HI_Marshallers,
         RE_Unmarshall_Array               => RH_PO_HI_Marshallers,
         RE_Marshall_Bool                  => RH_PO_HI_Marshallers,
         RE_Unmarshall_Bool                => RH_PO_HI_Marshallers,
         RE_Marshall_Char                  => RH_PO_HI_Marshallers,
         RE_Unmarshall_Char                => RH_PO_HI_Marshallers,
         RE_Marshall_Int                   => RH_PO_HI_Marshallers,
         RE_Unmarshall_Int                 => RH_PO_HI_Marshallers,
         RE_Marshall_Int8                  => RH_PO_HI_Marshallers,
         RE_Unmarshall_Int8                => RH_PO_HI_Marshallers,
         RE_Marshall_Int16                 => RH_PO_HI_Marshallers,
         RE_Unmarshall_Int16               => RH_PO_HI_Marshallers,
         RE_Marshall_Int32                 => RH_PO_HI_Marshallers,
         RE_Unmarshall_Int32               => RH_PO_HI_Marshallers,
         RE_Marshall_Int64                 => RH_PO_HI_Marshallers,
         RE_Unmarshall_Int64               => RH_PO_HI_Marshallers,
         RE_Marshall_Uint8                 => RH_PO_HI_Marshallers,
         RE_Unmarshall_Uint8               => RH_PO_HI_Marshallers,
         RE_Marshall_Uint16                => RH_PO_HI_Marshallers,
         RE_Unmarshall_Uint16              => RH_PO_HI_Marshallers,
         RE_Marshall_Uint32                => RH_PO_HI_Marshallers,
         RE_Unmarshall_Uint32              => RH_PO_HI_Marshallers,
         RE_Marshall_Uint64                => RH_PO_HI_Marshallers,
         RE_Unmarshall_Uint64              => RH_PO_HI_Marshallers,
         RE_Marshall_Float                 => RH_PO_HI_Marshallers,
         RE_Unmarshall_Float               => RH_PO_HI_Marshallers,
         RE_Marshall_Float32               => RH_PO_HI_Marshallers,
         RE_Unmarshall_Float32             => RH_PO_HI_Marshallers,
         RE_Marshall_Float64               => RH_PO_HI_Marshallers,
         RE_Unmarshall_Float64             => RH_PO_HI_Marshallers,
         RE_Marshall_Port                  => RH_PO_HI_Marshallers,
         RE_Unmarshall_Port                => RH_PO_HI_Marshallers,
         RE_Marshall_Request               => RH_Marshallers,
         RE_Unmarshall_Request             => RH_Marshallers,
         RE_Create_Periodic_Task           => RH_PO_HI_Task,
         RE_Main_Deliver                   => RH_Activity,
         RE_Create_Sporadic_Task           => RH_PO_HI_Task,
         RE_Simulate_WCET                  => RH_PO_HI_Utils,
         RE_Compute_Miss                   => RH_PO_HI_Utils,
         RE_Wait_For_Next_Period           => RH_PO_HI_Task,
         RE_Compute_Next_Period            => RH_PO_HI_Task,
         RE_Initialize                     => RH_PO_HI_Main,
         RE_Wait_Initialization            => RH_PO_HI_Main,
         RE_Protected_Lock                 => RH_PO_HI_Protected,
         RE_Protected_Unlock               => RH_PO_HI_Protected,
         RE_Copy_Array                     => RH_PO_HI_Types,
         RE_Gqueue_Store_In                => RH_PO_HI_Gqueue,
         RE_Gqueue_Store_Out               => RH_PO_HI_Gqueue,
         RE_Gqueue_Send_Output             => RH_PO_HI_Gqueue,
         RE_Gqueue_Init                    => RH_PO_HI_Gqueue,
         RE_Gqueue_Get_Count               => RH_PO_HI_Gqueue,
         RE_Gqueue_Get_Value               => RH_PO_HI_Gqueue,
         RE_Gqueue_Next_Value              => RH_PO_HI_Gqueue,
         RE_Gqueue_Wait_For_Incoming_Event => RH_PO_HI_Gqueue,
         RE_Sporadic_Wait                  => RH_PO_HI_Task,
         RE_Sporadic_Wait_Release          => RH_PO_HI_Task,
         RE_Simulink_Find_Var              => RH_PO_HI_Simulink,
         RE_Simulink_Find_Signal           => RH_PO_HI_Simulink,
         RE_Simulink_Find_Parameter        => RH_PO_HI_Simulink,
         RE_Simulink_Update                => RH_PO_HI_Simulink,
         RE_Wait_For_Tasks                 => RH_PO_HI_Task,

         --  Runtime types associations

         RE_Msg_T                          => RH_PO_HI_Messages,
         RE_Task_Id                        => RH_Deployment,
         RE_Entity_T                       => RH_Deployment,
         RE_Local_Port_T                   => RH_Deployment,
         RE_Port_T                         => RH_Deployment,
         RE_Entity_Server_T                => RH_Deployment,
         RE_Protected_T                    => RH_PO_HI_Protected,
         RE_Inetport_T                     => RH_PO_HI_Protocols,
         RE_Inetaddr_T                     => RH_PO_HI_Protocols,
         RE_Bool_T                         => RH_PO_HI_Types,
         RE_Uint8_T                        => RH_PO_HI_Types,
         RE_Int8_T                         => RH_PO_HI_Types,
         RE_Uint16_T                       => RH_PO_HI_Types,
         RE_Int16_T                        => RH_PO_HI_Types,
         RE_Uint32_T                       => RH_PO_HI_Types,
         RE_Int32_T                        => RH_PO_HI_Types,
         RE_Uint64_T                       => RH_PO_HI_Types,
         RE_Int64_T                        => RH_PO_HI_Types,
         RE_Float32_T                      => RH_PO_HI_Types,
         RE_Float64_T                      => RH_PO_HI_Types,
         RE_Node_T                         => RH_Deployment,
         RE_Operation_T                    => RH_Request,
         RE_Request_T                      => RH_Request,

         --  Runtime Constants associations

         RE_Default_Priority               => RH_PO_HI_Task,
         RE_Main_Type                      => RH_PO_HI_Common,
         RE_Main_Args                      => RH_PO_HI_Common,
         RE_Main_Name                      => RH_PO_HI_Common,
         RE_Main_Return                    => RH_PO_HI_Common,
         RE_Nb_Nodes                       => RH_Deployment,
         RE_Nb_Ports                       => RH_Deployment,
         RE_Nb_Servers                     => RH_Deployment,
         RE_Nb_Protected                   => RH_PO_HI_Protected,
         RE_Nb_Entities                    => RH_Deployment,
         RE_Simulink_Init                  => RH_PO_HI_Simulink,
         RE_Simulink_Node                  => RH_Null,
         RE_Simulink_Init_Func             => RH_Null,
         RE_Simulink_Model_Type            => RH_Null,
         RE_Gqueue_Fifo_Indata             => RH_PO_HI_Gqueue,
         RE_Gqueue_Fifo_Out                => RH_PO_HI_Gqueue,
         RE_Nb_Operations                  => RH_Request,
         RE_Noaddr                         => RH_PO_HI_Protocols,
         RE_Noport                         => RH_PO_HI_Protocols,
         RE_Nb_Tasks                       => RH_Deployment,
         RE_SUCCESS                        => RH_PO_HI_Returns,

         --  Variables associations

         RE_Ports_Names                    => RH_PO_HI_Types,
         RE_Operation_Names                => RH_PO_HI_Types,
         RE_Port_Global_To_Entity          => RH_Deployment,
         RE_Port_Global_To_Local           => RH_Deployment
        );
   procedure Initialize;
   procedure Reset;

   function RE (Id : RE_Id) return Node_Id;
   --  Return a designator for entity Id

   function RH (Id : RH_Id) return Node_Id;
   --  Return a node for entity RH_Id

end Ocarina.Backends.PO_HI_C.Runtime;

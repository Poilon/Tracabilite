------------------------------------------------------------------------------
--                                                                          --
--                          PolyORB HI COMPONENTS                           --
--                                                                          --
--                                 A A D L                                  --
--                                                                          --
--                                 S p e c                                  --
--                                                                          --
--                 Copyright (C) 2009, GET-Telecom Paris.                   --
--                                                                          --
-- PolyORB HI is free software; you  can  redistribute  it and/or modify it --
-- under terms of the GNU General Public License as published by the Free   --
-- Software Foundation; either version 2, or (at your option) any later.    --
-- PolyORB HI is distributed  in the hope that it will be useful, but       --
-- WITHOUT ANY WARRANTY;  without even the implied warranty of              --
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General --
-- Public License for more details. You should have received  a copy of the --
-- GNU General Public  License  distributed with PolyORB HI; see file       --
-- COPYING. If not, write  to the Free  Software Foundation, 51 Franklin    --
-- Street, Fifth Floor, Boston, MA 02111-1301, USA.                         --
--                                                                          --
-- As a special exception,  if other files  instantiate  generics from this --
-- unit, or you link  this unit with other files  to produce an executable, --
-- this  unit  does not  by itself cause  the resulting  executable  to  be --
-- covered  by the  GNU  General  Public  License.  This exception does not --
-- however invalidate  any other reasons why  the executable file  might be --
-- covered by the  GNU Public License.                                      --
--                                                                          --
--                PolyORB HI is maintained by GET Telecom Paris             --
--                                                                          --
------------------------------------------------------------------------------

with System;

package aadl is
   type Event is access String;

   function "+" (S : String) return Event;
   --  This function returns a pointer to a string that is the name of
   --  the event.  This pointer is used as the parameter to the
   --  Raise_Event routine.

   type Error is access String;

   function "+" (S : String) return Error;
   --  This function returns a pointer to a string the is the name of
   --  the error.  This pointer is used as the parameter to the
   --  Raise_Error routine.

   procedure Create_Thread
     (Thread_Name       : System.Address;
      Thread_Parameters : System.Address);
   --  This procedure creates a thread of execution in the underlying
   --  operating environment that corresponds to the sequence of
   --  instructions that begin at the Thread_Name address and utilize
   --  the parameters that are encapsulated in the Thread_Parameters
   --  block.  This procedure may make use of additional information
   --  that is provided in AADL properties.

   procedure Await_Dispatch;
   --  This procedure will be called when the sequence of statements
   --  corresponding to the thread is ready to be dispatched by the
   --  underlying scheduler.  The AADL kernel will take the necessary
   --  steps to place the thread on the dispatch queue in the
   --  appropriate location.

   procedure Get_Resource;
   --  This procedure is called when a thread enters a critical region
   --  that accesses shared data.

   procedure Release_Resource;
   --  This procedure is called when a thread exits a critical region
   --  that accessed shared data.

   procedure Raise_Event (EVID : Event);
   --  This procedure is called when a thread or subprogram requires
   --  the transmission of events and event data. This procedure is
   --  called in response to the recognition of the named event.

   procedure Raise_Error (ERID : Error);
   --  This procedure is called when a thread or subprogram requires
   --  the transmission of an error condition.  This procedure is
   --  called in response to the recognition of the named error.

   procedure Thread_Dispatch_Status (Thread_Name : System.Address);
   --  This procedure may be called to determine the context of the
   --  execution of a thread.

   procedure Port_Dispatch_Status (Port_Name : System.Address);
   --  This procedure may be called by a thread to determine the port
   --  that caused an overflow error.

   procedure Connection_Status (Port_Name : System.Address);
   --  This procedure enables a thread to determine port variable
   --  status information.

   procedure Stop_Process;
   --  This procedure is called for a controlled shut-down of a
   --  process, i.e., all of its contained threads are halted,
   --  awaiting a dispatch, or not part of the current mode.

   procedure Abort_Process;
   --  This procedure is called for a shut-down of a process due to an
   --  anomaly.  All of its contained threads are terminated
   --  immediately.

   procedure Stop_Processor;
   --  A call to this procedure results in a transition to the
   --  processor stopping state at the next hyperperiod.

   procedure Abort_Processor;
   --  As the result of a call to this procedure, all threads bound to
   --  the processor are aborted.

   procedure Stop_System;
   procedure Abort_System;

end aadl;

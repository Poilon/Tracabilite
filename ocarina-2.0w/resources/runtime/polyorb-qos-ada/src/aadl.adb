------------------------------------------------------------------------------
--                                                                          --
--                          PolyORB HI COMPONENTS                           --
--                                                                          --
--                                 A A D L                                  --
--                                                                          --
--                                 B o d y                                  --
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

pragma Warnings (Off);
--  XXX dumb stub to be completed

package body aadl is

   ---------
   -- "+" --
   ---------

   function "+" (S : String) return Event is
   begin
      return "+" (S);
   end "+";

   ---------
   -- "+" --
   ---------

   function "+" (S : String) return Error is
   begin
      return "+" (S);
   end "+";

   -------------------
   -- Create_Thread --
   -------------------

   procedure Create_Thread
     (Thread_Name       : System.Address;
      Thread_Parameters : System.Address)
   is
   begin
      null;
   end Create_Thread;

   --------------------
   -- Await_Dispatch --
   --------------------

   procedure Await_Dispatch is
   begin
      null;
   end Await_Dispatch;

   ------------------
   -- Get_Resource --
   ------------------

   procedure Get_Resource is
   begin
      null;
   end Get_Resource;

   ----------------------
   -- Release_Resource --
   ----------------------

   procedure Release_Resource is
   begin
      null;
   end Release_Resource;

   -----------------
   -- Raise_Event --
   -----------------

   procedure Raise_Event (EVID : Event) is
   begin
      null;
   end Raise_Event;

   -----------------
   -- Raise_Error --
   -----------------

   procedure Raise_Error (ERID : Error) is
   begin
      null;
   end Raise_Error;

   ----------------------------
   -- Thread_Dispatch_Status --
   ----------------------------

   procedure Thread_Dispatch_Status (Thread_Name : System.Address) is
   begin
      null;
   end Thread_Dispatch_Status;

   --------------------------
   -- Port_Dispatch_Status --
   --------------------------

   procedure Port_Dispatch_Status (Port_Name : System.Address) is
   begin
      null;
   end Port_Dispatch_Status;

   -----------------------
   -- Connection_Status --
   -----------------------

   procedure Connection_Status (Port_Name : System.Address) is
   begin
      null;
   end Connection_Status;

   ------------------
   -- Stop_Process --
   ------------------

   procedure Stop_Process is
   begin
      null;
   end Stop_Process;

   -------------------
   -- Abort_Process --
   -------------------

   procedure Abort_Process is
   begin
      null;
   end Abort_Process;

   --------------------
   -- Stop_Processor --
   --------------------

   procedure Stop_Processor is
   begin
      null;
   end Stop_Processor;

   ---------------------
   -- Abort_Processor --
   ---------------------

   procedure Abort_Processor is
   begin
      null;
   end Abort_Processor;

   -----------------
   -- Stop_System --
   -----------------

   procedure Stop_System is
   begin
      null;
   end Stop_System;

   ------------------
   -- Abort_System --
   ------------------

   procedure Abort_System is
   begin
      null;
   end Abort_System;

end aadl;

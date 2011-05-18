------------------------------------------------------------------------------
--                                                                          --
--                          PolyORB HI COMPONENTS                           --
--                                                                          --
--   A R A O . P E R I O D I C _ T H R E A D S . F U L L _ T A S K I N G    --
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

with System;

with PolyORB.Initialization;
with PolyORB.Tasking.Threads;
with PolyORB.Utils.Strings;

package body ARAO.Periodic_Threads.Full_Tasking is

   package PTT renames PolyORB.Tasking.Threads;

   The_TF : PTT.Thread_Factory_Access;

   procedure Initialize;

   procedure Create_Periodic_Thread
     (TP           : Parameterless_Procedure;
      Priority     : System.Any_Priority := System.Default_Priority;
      Storage_Size : Integer := Default_Storage_Size);
   --  Create a periodic thread in full tasking mode

   ----------------------------
   -- Create_Periodic_Thread --
   ----------------------------

   procedure Create_Periodic_Thread
     (TP           : Parameterless_Procedure;
      Priority     : System.Any_Priority := System.Default_Priority;
      Storage_Size : Integer := Default_Storage_Size)
   is
      T : Thread_Access;
      pragma Unreferenced (T);

      --  Because `T' is assigned and never read
   begin
      The_TF := PTT.Get_Thread_Factory;

      T := Run_In_Task (TF               => The_TF,
                        Name             => "",
                        Default_Priority => Priority,
                        Storage_Size     => Storage_Size,
                        P                => TP);
   end Create_Periodic_Thread;

   ----------------
   -- Initialize --
   ----------------

   procedure Initialize is
   begin
      The_Create_Thread := Create_Periodic_Thread'Access;
   end Initialize;

   use PolyORB.Initialization;
   use PolyORB.Initialization.String_Lists;
   use PolyORB.Utils.Strings;

begin
   Register_Module
     (Module_Info'
      (Name      => +"arao.periodic_threads.full_tasking",
       Conflicts => Empty,
       Depends   => +"tasking.threads",
       Provides  => +"periodic_threads",
       Implicit  => False,
       Init      => Initialize'Access,
       Shutdown  => null));
end ARAO.Periodic_Threads.Full_Tasking;

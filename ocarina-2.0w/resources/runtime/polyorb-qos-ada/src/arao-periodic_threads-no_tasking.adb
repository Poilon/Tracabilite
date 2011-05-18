------------------------------------------------------------------------------
--                                                                          --
--                          PolyORB HI COMPONENTS                           --
--                                                                          --
--     A R A O . P E R I O D I C _ T H R E A D S . N O _ T A S K I N G      --
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
with PolyORB.Utils.Strings;

package body ARAO.Periodic_Threads.No_Tasking is

   procedure Initialize;

   procedure Create_Periodic_Thread
     (TP          : Parameterless_Procedure;
      Priority    : System.Any_Priority := System.Default_Priority;
      Storage_Size : Integer := Default_Storage_Size);
   --  Create a periodic thread in no tasking mode

   ----------------------------
   -- Create_Periodic_Thread --
   ----------------------------

   procedure Create_Periodic_Thread
     (TP           : Parameterless_Procedure;
      Priority     : System.Any_Priority := System.Default_Priority;
      Storage_Size : Integer := Default_Storage_Size)
   is
      pragma Unreferenced (Priority);
      pragma Unreferenced (Storage_Size);
   begin
      --  In no tasking mode, we simply run the procedure

      TP.all;
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
      (Name      => +"arao.periodic_threads.no_tasking",
       Conflicts => Empty,
       Depends   => +"tasking.threads",
       Provides  => +"periodic_threads",
       Implicit  => False,
       Init      => Initialize'Access,
       Shutdown  => null));
end ARAO.Periodic_Threads.No_Tasking;

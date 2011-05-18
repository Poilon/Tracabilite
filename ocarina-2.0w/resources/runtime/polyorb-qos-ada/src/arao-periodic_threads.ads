------------------------------------------------------------------------------
--                                                                          --
--                          PolyORB HI COMPONENTS                           --
--                                                                          --
--                A R A O . P E R I O D I C _ T H R E A D S                 --
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
with PolyORB.Tasking.Threads;

package ARAO.Periodic_Threads is
   use PolyORB.Tasking.Threads;

   procedure Create_Periodic_Thread
     (TP           : Parameterless_Procedure;
      Priority     : System.Any_Priority := System.Default_Priority;
      Storage_Size : Integer := 0);
   --  This procedure creates a periodic thread. The fact that the
   --  thread is periodic is handled in the TP procedure. Also, we
   --  assume that the PolyORB thread pool was properly created during
   --  the setup phase. Storage_size 0 is default size (not really 0
   --  bit).

   Default_Storage_Size : constant Integer;

   type Create_PT_Ptr is access procedure
     (TP           : Parameterless_Procedure;
      Priority     : System.Any_Priority := System.Default_Priority;
      Storage_Size : Integer := Default_Storage_Size);

private

   The_Create_Thread : Create_PT_Ptr;
   --  Depending on the tasking profile, this pointer is set to the
   --  correct procedure that creates a periodic thread.

   Default_Storage_Size : constant Integer := 64 * 1024;
   --  64KB is default size task stack size

end ARAO.Periodic_Threads;

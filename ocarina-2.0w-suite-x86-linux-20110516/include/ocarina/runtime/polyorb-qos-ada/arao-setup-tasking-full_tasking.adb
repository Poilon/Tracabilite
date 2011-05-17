------------------------------------------------------------------------------
--                                                                          --
--                          PolyORB HI COMPONENTS                           --
--                                                                          --
--      A R A O . S E T U P . T A S K I N G . F U L L _ T A S K I N G       --
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

--  Full tasking mode

with PolyORB.Tasking.Profiles.Full_Tasking.Threads.Static_Priorities;
pragma Elaborate_All
  (PolyORB.Tasking.Profiles.Full_Tasking.Threads.Static_Priorities);
pragma Warnings
  (Off, PolyORB.Tasking.Profiles.Full_Tasking.Threads.Static_Priorities);

with PolyORB.Tasking.Profiles.Full_Tasking.Threads;
pragma Elaborate_All (PolyORB.Tasking.Profiles.Full_Tasking.Threads);
pragma Warnings (Off, PolyORB.Tasking.Profiles.Full_Tasking.Threads);

with PolyORB.ORB.Thread_Pool;
pragma Warnings (Off, PolyORB.ORB.Thread_Pool);
pragma Elaborate_All (PolyORB.ORB.Thread_Pool);

with PolyORB.Tasking.Profiles.Full_Tasking.Portable_Mutexes;
pragma Warnings
  (Off, PolyORB.Tasking.Profiles.Full_Tasking.Portable_Mutexes);
pragma Elaborate_All
  (PolyORB.Tasking.Profiles.Full_Tasking.Portable_Mutexes);

with PolyORB.Tasking.Profiles.Full_Tasking.Condition_Variables;
pragma Warnings
  (Off, PolyORB.Tasking.Profiles.Full_Tasking.Condition_Variables);
pragma Elaborate_All
  (PolyORB.Tasking.Profiles.Full_Tasking.Condition_Variables);

with PolyORB.Tasking.Profiles.Full_Tasking.Threads.Annotations;
pragma Warnings
  (Off, PolyORB.Tasking.Profiles.Full_Tasking.Threads.Annotations);
pragma Elaborate_All
  (PolyORB.Tasking.Profiles.Full_Tasking.Threads.Annotations);

with PolyORB.Tasking.Profiles.Full_Tasking.Threads.Dynamic_Priorities;
pragma Warnings
  (Off, PolyORB.Tasking.Profiles.Full_Tasking.Threads.Dynamic_Priorities);
pragma Elaborate_All
  (PolyORB.Tasking.Profiles.Full_Tasking.Threads.Dynamic_Priorities);

--  Periodic threads

with ARAO.Periodic_Threads.Full_Tasking;
pragma Warnings (Off, ARAO.Periodic_Threads.Full_Tasking);
pragma Elaborate_All (ARAO.Periodic_Threads.Full_Tasking);

package body ARAO.Setup.Tasking.Full_Tasking is
end ARAO.Setup.Tasking.Full_Tasking;

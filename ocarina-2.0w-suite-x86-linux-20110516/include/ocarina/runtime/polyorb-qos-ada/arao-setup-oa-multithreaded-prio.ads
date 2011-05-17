------------------------------------------------------------------------------
--                                                                          --
--                          PolyORB HI COMPONENTS                           --
--                                                                          --
--     A R A O . S E T U P . O A . M U L T I T H R E A D E D . P R I O      --
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

--  Setup an object adapter for multithread processes with request
--  priority management.

with ARAO.Threads;

generic
   Data : ARAO.Threads.Thread_Properties_Array;

package ARAO.Setup.OA.Multithreaded.Prio is

   procedure Initialize;
   --  Create a Real-Time Object Adapter (RTPOA) for each IN port of
   --  the caller process. This procedure assumes that PolyORB was
   --  correctly setup, and particulary that PolyORB.RT_POA was
   --  previously withed. The RTPOAs will be created with respect to
   --  in port thread priority, stack size and number of connected out
   --  ports.

end ARAO.Setup.OA.Multithreaded.Prio;

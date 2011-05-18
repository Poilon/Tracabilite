------------------------------------------------------------------------------
--                                                                          --
--                          PolyORB HI COMPONENTS                           --
--                                                                          --
--                    A R A O . O B J _ A D A P T E R S                     --
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

with PolyORB.References;
with PolyORB.Servants;

package ARAO.Obj_Adapters is

   procedure Link_To_Obj_Adapter
     (T_Object :     PolyORB.Servants.Servant_Access;
      Ref      : out PolyORB.References.Ref);
   --  This procedure performs the link between the object reference
   --  (used by a client to send a request) and the servant who does
   --  the job specified by the request. This procedure assumes that
   --  the middlware is correctly set up and that a object adapter is
   --  created.

end ARAO.Obj_Adapters;
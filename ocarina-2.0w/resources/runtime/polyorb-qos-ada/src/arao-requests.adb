------------------------------------------------------------------------------
--                                                                          --
--                          PolyORB HI COMPONENTS                           --
--                                                                          --
--                        A R A O . R E Q U E S T S                         --
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

with PolyORB.Any.NVList;
with PolyORB.Types;
with PolyORB.Requests;
with PolyORB.Any.ExceptionList;

package body ARAO.Requests is

   --------------
   -- Emit_Msg --
   --------------

   procedure Emit_Msg
     (Item     : PolyORB.Any.Any;
      Ref      : PolyORB.References.Ref;
      PortName : String)
   is
      use PolyORB.Any;
      use PolyORB.Any.NVList;
      use PolyORB.Types;
      use PolyORB.Requests;

      Req : Request_Access;
      Args : PolyORB.Any.NVList.Ref;
      Result : PolyORB.Any.NamedValue;
   begin
      Create (Args);
      Add_Item
        (Args,
         To_PolyORB_String ("Emit_Msg"),
         Item,
         ARG_IN);

      Create_Request
        (Ref,
         PortName,
         Args,
         Result,
         PolyORB.Any.ExceptionList.Nil_Ref,
         Req,
         PolyORB.Requests.Sync_With_Transport);

      PolyORB.Requests.Invoke (Req);
      PolyORB.Requests.Destroy_Request (Req);
   end Emit_Msg;

end ARAO.Requests;

------------------------------------------------------------------------------
--                                                                          --
--                          PolyORB HI COMPONENTS                           --
--                                                                          --
--                 A R A O . R T _ O B J _ A D A P T E R S                  --
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

with PolyORB.Setup;
pragma Elaborate_All (PolyORB.Setup);

with PolyORB.ORB;
with PolyORB.RT_POA;
with PolyORB.Errors;
with PolyORB.Tasking.Priorities;
with PolyORB.POA_Types;
with PolyORB.POA;
with PolyORB.RT_POA.Basic_RT_POA;

package body ARAO.RT_Obj_Adapters is

   use PolyORB.Tasking.Priorities;

   -------------------------
   -- Link_To_Obj_Adapter --
   -------------------------

   procedure Link_To_Obj_Adapter
     (T_Object    : PolyORB.Servants.Servant_Access;
      Ref         : out PolyORB.References.Ref;
      Thread_Name : Standard.String;
      Priority    : Integer := System.Default_Priority)
   is
      use PolyORB.ORB;
      use PolyORB.Errors;
      use PolyORB.RT_POA;
      use PolyORB.POA_Types;

      My_Id       : Unmarshalled_Oid;
      Father_POA  : PolyORB.POA.Obj_Adapter_Access;
      Servant_POA : PolyORB.POA.Obj_Adapter_Access;
      Error       : Error_Container;
      ORB_Prio    : ORB_Priority;
      Success     : Boolean;
   begin
      To_ORB_Priority (External_Priority (Priority), ORB_Prio, Success);

      if not Success then
         raise Program_Error;
      end if;

      Father_POA := PolyORB.POA.Obj_Adapter_Access
        (PolyORB.ORB.Object_Adapter
         (PolyORB.Setup.The_ORB));

      PolyORB.POA.Find_POA
        (Father_POA,
         "RTPOA_" & Thread_Name,
         False,
         Servant_POA,
         Error);
      if Found (Error) then
         raise Program_Error;
      end if;

      PolyORB.RT_POA.Basic_RT_POA.Activate_Object_With_Id_And_Priority
        (PolyORB.RT_POA.Basic_RT_POA.Basic_RT_Obj_Adapter_Access
         (Servant_POA),
         T_Object,
         null,
         ORB_Priority (Priority),
         External_Priority (Priority),
         My_Id,
         Error);
      if Found (Error) then
         raise Program_Error;
      end if;

      Create_Reference
        (PolyORB.Setup.The_ORB,
         U_Oid_To_Oid (My_Id),
         "IDL:AADL_Model:1.0",
         Ref);
   end Link_To_Obj_Adapter;

end ARAO.RT_Obj_Adapters;

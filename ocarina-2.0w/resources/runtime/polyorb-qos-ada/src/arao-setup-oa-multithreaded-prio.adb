------------------------------------------------------------------------------
--                                                                          --
--                          PolyORB HI COMPONENTS                           --
--                                                                          --
--     A R A O . S E T U P . O A . M U L T I T H R E A D E D . P R I O      --
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

with Ada.Exceptions;
with Ada.Text_IO;

with ARAO.Setup.OA.Multithreaded;
pragma Warnings (Off, ARAO.Setup.OA.Multithreaded);
pragma Elaborate_All (ARAO.Setup.OA.Multithreaded);

with PolyORB.Lanes;
with PolyORB.Tasking.Priorities;
with PolyORB.Errors;
with PolyORB.POA;
with PolyORB.POA_Policies;
with PolyORB.Setup;
with PolyORB.Types;
with PolyORB.ORB;
with PolyORB.RT_POA_Policies.Priority_Model_Policy;
with PolyORB.RT_POA_Policies.Thread_Pool_Policy;
with PolyORB.POA_Manager;
with PolyORB.POA_Policies.Implicit_Activation_Policy.No_Activation;
with PolyORB.POA_Policies.Lifespan_Policy.Persistent;

package body ARAO.Setup.OA.Multithreaded.Prio is
   use PolyORB.Tasking.Priorities;

   procedure Init_Lane
     (Lane_R        : PolyORB.Lanes.Lane_Root_Access;
      Priority      : Integer;
      Storage_Size  : Integer;
      Thread_Number : Integer;
      Index         : Integer);

   procedure Create_Servant_POA (Index : Integer);

   ---------------
   -- Init_Lane --
   ---------------

   procedure Init_Lane
     (Lane_R        : PolyORB.Lanes.Lane_Root_Access;
      Priority      : Integer;
      Storage_Size  : Integer;
      Thread_Number : Integer;
      Index         : Integer)
   is
      L : PolyORB.Lanes.Lane_Access;
   begin
      L := PolyORB.Lanes.Create
        (Priority,
         PolyORB.Tasking.Priorities.External_Priority (Priority),
         Thread_Number,
         0,
         Storage_Size,
         False,
         1,
         0);

      PolyORB.Lanes.Add_Lane (PolyORB.Lanes.Lanes_Set (Lane_R.all), L, Index);
   end Init_Lane;

   ------------------------
   -- Create_Servant_POA --
   ------------------------

   procedure Create_Servant_POA (Index : Integer) is
      Error              : PolyORB.Errors.Error_Container;
      Lane_Root          : PolyORB.Lanes.Lane_Root_Access;
      New_POA            : PolyORB.POA.Obj_Adapter_Access;
      RTPOA_Policy       : PolyORB.POA_Policies.Policy_Access;
      Activation_Policy  : PolyORB.POA_Policies.Policy_Access;
      Persistency_Policy : PolyORB.POA_Policies.Policy_Access;
      P_List             : PolyORB.POA_Policies.PolicyList;

   begin
      RTPOA_Policy :=
        PolyORB.RT_POA_Policies.Priority_Model_Policy.Create
        (PolyORB.RT_POA_Policies.Priority_Model_Policy.SERVER_DECLARED,
         PolyORB.Tasking.Priorities.Default_Component_Priority,
         PolyORB.Tasking.Priorities.External_Priority
         (256));
      PolyORB.POA_Policies.Policy_Lists.Append
        (P_List,
         RTPOA_Policy);

      Activation_Policy :=
        PolyORB.POA_Policies.Policy_Access
        (PolyORB.POA_Policies.Implicit_Activation_Policy.No_Activation.Create);
      PolyORB.POA_Policies.Policy_Lists.Append
        (P_List,
         Activation_Policy);

      Persistency_Policy :=
        PolyORB.POA_Policies.Policy_Access
        (PolyORB.POA_Policies.Lifespan_Policy.Persistent.Create);
      PolyORB.POA_Policies.Policy_Lists.Append
        (P_List,
         Persistency_Policy);

      Lane_Root := new PolyORB.Lanes.Lanes_Set (1);
      Init_Lane
        (Lane_R        => Lane_Root,
         Priority      => Data (Index).Priority,
         Storage_Size  => Data (Index).Stack_Size,
         Thread_Number => Data (Index).Src_Count,
         Index => 1);

      RTPOA_Policy :=
        PolyORB.RT_POA_Policies.Thread_Pool_Policy.Create
        (Lane_Root);

      PolyORB.POA_Policies.Policy_Lists.Append
        (P_List,
         RTPOA_Policy);

      PolyORB.POA.Create_POA
        (PolyORB.POA.Obj_Adapter'Class
         (PolyORB.ORB.Object_Adapter (PolyORB.Setup.The_ORB).all)'Access,
         "RTPOA_"
         & PolyORB.Types.To_Standard_String (Data (Index).Thread_Name),
         null,
         P_List,
         New_POA,
         Error);

      if PolyORB.Errors.Found (Error) then
         PolyORB.Errors.Catch (Error);
         raise Program_Error;
      end if;

      PolyORB.POA_Manager.Activate
        (PolyORB.POA_Manager.POAManager_Access
         (PolyORB.POA_Manager.Entity_Of
          (New_POA.POA_Manager)),
         Error);

      if PolyORB.Errors.Found (Error) then
         PolyORB.Errors.Catch (Error);
         raise Program_Error;
      end if;

   end Create_Servant_POA;

   ----------------
   -- Initialize --
   ----------------

   procedure Initialize is
   begin
      for J in Data'Range loop
         Create_Servant_POA (J);
      end loop;

   exception
      when E : others =>
         Ada.Text_IO.Put_Line (Ada.Exceptions.Exception_Message (E));
   end Initialize;

end ARAO.Setup.OA.Multithreaded.Prio;

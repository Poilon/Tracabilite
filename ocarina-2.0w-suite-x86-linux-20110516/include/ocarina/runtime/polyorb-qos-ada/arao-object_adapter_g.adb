------------------------------------------------------------------------------
--                                                                          --
--                          PolyORB HI COMPONENTS                           --
--                                                                          --
--                A R A O . O B J E C T _ A D A P T E R _ G                 --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
--               Copyright (C) 2009-2010, GET-Telecom Paris.                --
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

with Ada.Streams; use Ada.Streams;
with PolyORB.Obj_Adapter_QoS;

package body ARAO.Object_Adapter_G is

   --  IMPORTANT : There is no need for a mutex in the operations that
   --  manipulate the Ocarina object adapter because, by construction,
   --  there is no concurrent write access to this adapter.

   use PolyORB.Errors;

   subtype Ocarina_OA_Oid is Stream_Element_Array
     (1 .. Integer'Size / Stream_Element'Size);

   procedure Find_Entry
     (OA    :        Ocarina_Obj_Adapter;
      Index :        Integer;
      OME   :    out Object_Map_Entry;
      Error : in out PolyORB.Errors.Error_Container);
   --  Check that Index is a valid object Index (associated to a
   --  non-null Servant) for object adapter OA, and return a copy of
   --  the associated entry. If Index is out of range or associated to
   --  a null Servant, Invalid_Object_Id is raised.

   --  Routines to convert Integers to Oids and vice versa
   --  independantly from the platform endianess

   Conversion_Step : constant := 2 ** Stream_Element'Size;

   function Index_To_Oid (Index : Integer) return Ocarina_OA_Oid;
   function Oid_To_Index (Oid : Ocarina_OA_Oid) return Integer;

   ----------------
   -- Find_Entry --
   ----------------

   procedure Find_Entry
     (OA    :        Ocarina_Obj_Adapter;
      Index :        Integer;
      OME   :    out Object_Map_Entry;
      Error : in out PolyORB.Errors.Error_Container)
   is
      use type PolyORB.Servants.Servant_Access;

   begin
      if Index > OA.Object_Map'Last then

         --  Going outside limits of the Object Map implies the
         --  Object_Id we are looking for is not valid.

         OME := (Servant => null);
      else
         OME := OA.Object_Map (Index);
      end if;

      if OME.Servant = null then
         Throw (Error,
                Invalid_Object_Id_E,
                Null_Members'(Null_Member));
         OME := (Servant => null);
      end if;
   end Find_Entry;

   ------------------
   -- Index_To_Oid --
   ------------------

   function Index_To_Oid (Index : Integer) return Ocarina_OA_Oid is
      Oid_Result : Ocarina_OA_Oid;
      Work_Index : Integer := Index;
   begin
      for J in Oid_Result'Range loop
         Oid_Result (J) := Stream_Element (Work_Index mod Conversion_Step);
         Work_Index := Work_Index / Conversion_Step;
      end loop;

      return Oid_Result;
   end Index_To_Oid;

   ------------------
   -- Oid_To_Index --
   ------------------

   function Oid_To_Index (Oid : Ocarina_OA_Oid) return Integer is
      Index_Result : Integer := 0;
   begin
      for J in reverse Oid'Range loop
         Index_Result := Index_Result * Conversion_Step;
         Index_Result := Index_Result + Integer (Oid (J));
      end loop;

      return Index_Result;
   end Oid_To_Index;

   ------------
   -- Create --
   ------------

   procedure Create (OA : access Ocarina_Obj_Adapter) is
      pragma Unreferenced (OA);
   begin
      null;
   end Create;

   ------------
   -- Export --
   ------------

   procedure Export
     (OA    : access Ocarina_Obj_Adapter;
      Obj   :        PolyORB.Servants.Servant_Access;
      Key   :        PolyORB.Objects.Object_Id_Access;
      Oid   :    out PolyORB.Objects.Object_Id_Access;
      Error : in out PolyORB.Errors.Error_Container)
   is
      use type PolyORB.Servants.Servant_Access;
      use type PolyORB.Objects.Object_Id_Access;

   begin
      if Key /= null then
         Throw (Error,
                Invalid_Object_Id_E,
                Null_Members'(Null_Member));
         return;
      end if;

      OA.Last := OA.Last + 1;
      OA.Object_Map (OA.Last) := Object_Map_Entry'(Servant => Obj);

      Oid := new PolyORB.Objects.Object_Id'
        (PolyORB.Objects.Object_Id
         (Index_To_Oid
          (OA.Last - OA.Object_Map'First + 1)));
   end Export;

   --------------
   -- Unexport --
   --------------

   procedure Unexport
     (OA    : access Ocarina_Obj_Adapter;
      Id    :        PolyORB.Objects.Object_Id_Access;
      Error : in out PolyORB.Errors.Error_Container)
   is
      pragma Unreferenced (OA, Id, Error);
   begin
      raise Program_Error;
   end Unexport;

   ----------------
   -- Object_Key --
   ----------------

   procedure Object_Key
     (OA      : access Ocarina_Obj_Adapter;
      Id      :        PolyORB.Objects.Object_Id_Access;
      User_Id :    out PolyORB.Objects.Object_Id_Access;
      Error   : in out PolyORB.Errors.Error_Container)
   is
      pragma Unreferenced (OA, Id);

   begin
      Throw (Error,
             Invalid_Object_Id_E,
             Null_Members'(Null_Member));

      --  The Ocarina Object Adapter does not support user-defined
      --  object identifiers.

      User_Id := null;
   end Object_Key;

   -------------
   -- Get_QoS --
   -------------

   procedure Get_QoS
     (OA    : access Ocarina_Obj_Adapter;
      Id    :        PolyORB.Objects.Object_Id;
      QoS   :    out PolyORB.QoS.QoS_Parameters;
      Error : in out PolyORB.Errors.Error_Container)
   is
      pragma Unreferenced (Id, Error);
   begin
      QoS := PolyORB.Obj_Adapter_QoS.Get_Object_Adapter_QoS (OA);
   end Get_QoS;

   ------------------------
   -- Get_Empty_Arg_List --
   ------------------------

   function Get_Empty_Arg_List
     (OA     : access Ocarina_Obj_Adapter;
      Oid    : access PolyORB.Objects.Object_Id;
      Method : String)
     return PolyORB.Any.NVList.Ref
   is
      pragma Unreferenced (OA, Oid, Method);
      Result : PolyORB.Any.NVList.Ref;
   begin
      return Result;
   end Get_Empty_Arg_List;

   ----------------------
   -- Get_Empty_Result --
   ----------------------

   function Get_Empty_Result
     (OA     : access Ocarina_Obj_Adapter;
      Oid    : access PolyORB.Objects.Object_Id;
      Method : String)
      return PolyORB.Any.Any
   is
      pragma Unreferenced (OA, Oid, Method);

      Result : PolyORB.Any.Any;
   begin
      raise Program_Error;
      return Result;
   end Get_Empty_Result;

   ------------------
   -- Find_Servant --
   ------------------

   procedure Find_Servant
     (OA      : access Ocarina_Obj_Adapter;
      Id      : access PolyORB.Objects.Object_Id;
      Servant :    out PolyORB.Servants.Servant_Access;
      Error   : in out PolyORB.Errors.Error_Container)
   is
      Index : constant Integer := Oid_To_Index (Ocarina_OA_Oid (Id.all));

      OME : Object_Map_Entry;
   begin
      Find_Entry (OA.all, Index, OME, Error);

      if Is_Error (Error) then
         return;
      end if;

      Servant := OME.Servant;
      PolyORB.Servants.Set_Executor (Servant, OA.O_Exec'Access);
   end Find_Servant;

   ---------------------
   -- Release_Servant --
   ---------------------

   procedure Release_Servant
     (OA      : access Ocarina_Obj_Adapter;
      Id      : access PolyORB.Objects.Object_Id;
      Servant : in out PolyORB.Servants.Servant_Access)
   is
      pragma Unreferenced (OA, Id);
   begin
      Servant := null;
      raise Program_Error;
   end Release_Servant;

end ARAO.Object_Adapter_G;

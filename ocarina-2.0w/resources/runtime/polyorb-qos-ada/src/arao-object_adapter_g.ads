------------------------------------------------------------------------------
--                                                                          --
--                          PolyORB HI COMPONENTS                           --
--                                                                          --
--                A R A O . O B J E C T _ A D A P T E R _ G                 --
--                                                                          --
--                                 S p e c                                  --
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

with PolyORB.Obj_Adapters;
with PolyORB.Servants;
with PolyORB.Objects;
with PolyORB.Errors;
with PolyORB.QoS;
with PolyORB.Any.NVList;

generic
   Servant_Number : Integer;
package ARAO.Object_Adapter_G is

   type Ocarina_Obj_Adapter is
     new PolyORB.Obj_Adapters.Obj_Adapter with private;

   procedure Create (OA : access Ocarina_Obj_Adapter);

   procedure Export
     (OA    : access Ocarina_Obj_Adapter;
      Obj   :        PolyORB.Servants.Servant_Access;
      Key   :        PolyORB.Objects.Object_Id_Access;
      Oid   :    out PolyORB.Objects.Object_Id_Access;
      Error : in out PolyORB.Errors.Error_Container);

   procedure Unexport
     (OA    : access Ocarina_Obj_Adapter;
      Id    :        PolyORB.Objects.Object_Id_Access;
      Error : in out PolyORB.Errors.Error_Container);

   procedure Object_Key
     (OA      : access Ocarina_Obj_Adapter;
      Id      :        PolyORB.Objects.Object_Id_Access;
      User_Id :    out PolyORB.Objects.Object_Id_Access;
      Error   : in out PolyORB.Errors.Error_Container);

   procedure Get_QoS
     (OA    : access Ocarina_Obj_Adapter;
      Id    :        PolyORB.Objects.Object_Id;
      QoS   :    out PolyORB.QoS.QoS_Parameters;
      Error : in out PolyORB.Errors.Error_Container);

   function Get_Empty_Arg_List
     (OA     : access Ocarina_Obj_Adapter;
      Oid    : access PolyORB.Objects.Object_Id;
      Method :        String)
     return PolyORB.Any.NVList.Ref;

   function Get_Empty_Result
     (OA     : access Ocarina_Obj_Adapter;
      Oid    : access PolyORB.Objects.Object_Id;
      Method :        String)
     return PolyORB.Any.Any;

   procedure Find_Servant
     (OA      : access Ocarina_Obj_Adapter;
      Id      : access PolyORB.Objects.Object_Id;
      Servant :    out PolyORB.Servants.Servant_Access;
      Error   : in out PolyORB.Errors.Error_Container);

   procedure Release_Servant
     (OA      : access Ocarina_Obj_Adapter;
      Id      : access PolyORB.Objects.Object_Id;
      Servant : in out PolyORB.Servants.Servant_Access);

private

   type Object_Map_Entry is record
      Servant : PolyORB.Servants.Servant_Access;
      --  May be null (for empty entries)
   end record;

   Low_Bound  : constant Integer := 1;
   High_Bound : constant Integer := Servant_Number;

   type Object_Map_Entry_Array is
     array (Low_Bound .. High_Bound) of Object_Map_Entry;

   subtype Ocarina_Executor is PolyORB.Servants.Executor;

   type Ocarina_Obj_Adapter is new PolyORB.Obj_Adapters.Obj_Adapter with record
      Object_Map : Object_Map_Entry_Array;
      --  Object_Ids are simply the indices of the objects within
      --  the object map.

      Last       : Integer := Low_Bound - 1;
      --  The index of the last registered servant

      O_Exec     : aliased Ocarina_Executor;
   end record;

end ARAO.Object_Adapter_G;

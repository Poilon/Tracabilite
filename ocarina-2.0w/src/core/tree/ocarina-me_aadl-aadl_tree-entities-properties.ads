------------------------------------------------------------------------------
--                                                                          --
--                           OCARINA COMPONENTS                             --
--                                                                          --
--              OCARINA.ME_AADL.AADL_TREE.ENTITIES.PROPERTIES               --
--                                                                          --
--                                 S p e c                                  --
--                                                                          --
--               Copyright (C) 2008-2009, GET-Telecom Paris.                --
--                                                                          --
-- Ocarina  is free software;  you  can  redistribute  it and/or  modify    --
-- it under terms of the GNU General Public License as published by the     --
-- Free Software Foundation; either version 2, or (at your option) any      --
-- later version. Ocarina is distributed  in  the  hope  that it will be    --
-- useful, but WITHOUT ANY WARRANTY;  without even the implied warranty of  --
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General --
-- Public License for more details. You should have received  a copy of the --
-- GNU General Public License distributed with Ocarina; see file COPYING.   --
-- If not, write to the Free Software Foundation, 51 Franklin Street, Fifth --
-- Floor, Boston, MA 02111-1301, USA.                                       --
--                                                                          --
-- As a special exception,  if other files  instantiate  generics from this --
-- unit, or you link  this unit with other files  to produce an executable, --
-- this  unit  does not  by itself cause  the resulting  executable to be   --
-- covered  by the  GNU  General  Public  License. This exception does not  --
-- however invalidate  any other reasons why the executable file might be   --
-- covered by the GNU Public License.                                       --
--                                                                          --
--                 Ocarina is maintained by the Ocarina team                --
--                       (ocarina-users@listes.enst.fr)                     --
--                                                                          --
------------------------------------------------------------------------------

--  This package provides functions to create or read property names,
--  types, constants and associations.

with Types;                           use Types;
with Ocarina.AADL_Values;             use Ocarina.AADL_Values;
with Ocarina.ME_AADL.AADL_Tree.Nodes; use Ocarina.ME_AADL.AADL_Tree.Nodes;

package Ocarina.ME_AADL.AADL_Tree.Entities.Properties is

   type Property_Type is
     (PT_Boolean,
      PT_Boolean_Expression,
      PT_Integer,
      PT_Unsigned_Integer,
      PT_Float,
      PT_Unsigned_Float,
      PT_String,
      PT_Enumeration,
      PT_Reference,
      PT_Classifier,
      PT_Range,
      PT_List,
      PT_Other);

   type Named_Element is
     (PO_Error,

      --  This following elements are used only for AADL_V1
      PO_Port_Group,
      PO_Server_Subprogram,
      PO_Parameter,
      PO_Connections,
      PO_Port_Connections,
      PO_Port_Group_Connections,
      PO_Event_Port_Connections,
      PO_Data_Port_Connections,
      PO_Event_Data_Port_Connections,
      PO_Parameter_Connections,

      --  This following elements are used for AADL_V1 and AADL_V2
      PO_Component_Category,
      PO_Mode,
      PO_Flow,
      PO_Port,
      PO_Event_Port,
      PO_Data_Port,
      PO_Event_Data_Port,

      PO_Access_Connection,    --  POC_Access_Connections

      --  This following elements are use only for AADL_V2
      PO_Identifier,

      PO_Named_Element,
      PO_Classifier,
      PO_Instance,
      PO_Subcomponent,

      PO_Component_Implementation,
      PO_Component_Classifier,
      PO_Component_Instance,
      PO_Component_Type,
      PO_Component_Subcomponent,
      PO_Component_Access,
      PO_Component_Access_Connection,

      PO_Feature,
      PO_Feature_Instance,
      PO_Feature_Group,
      PO_Feature_Group_Type,
      PO_Feature_Group_Connection,
      PO_Feature_Group_Instance,

      PO_Connection,
      PO_Connection_Instance,

      PO_Flow_Specification,
      PO_Flow_Specification_Instance,
      PO_Flow_Source_Specification,
      PO_Flow_Sink_Specification,
      PO_Flow_Path_Specification,
      PO_End_To_End_Flow,
      PO_End_To_End_Flow_Instance,

      PO_Access,

      PO_Port_Instance,
      PO_Port_Connection,
      PO_Port_Connection_Instance,
      PO_Access_Instance,
      PO_Access_Connection_Instance,

      PO_Mode_Transition,
      PO_Mode_Instance,
      PO_Mode_Transition_Instance,
      PO_Mode_Transition_Connection_Instance,

      PO_Subprogram_Call_Sequence,
      PO_Provides_Subprogram_Access,

      PO_Prototype,
      PO_Package);

   type Referable_Element_Category is
     (REC_Component_Category,
      REC_Connections,
      REC_Server_Subprogram,       --  only in AADL_V1

      REC_Subprogram_Call_Sequence,
      REC_Identifier);

   -----------------------------
   -- Interrogation functions --
   -----------------------------

   function Value_Of_Property_Association_Is_Undefined
     (Property : Node_Id)
     return Boolean;

   function Type_Of_Property_Is_A_List
     (Property : Node_Id)
     return Boolean;

   function Get_Type_Of_Property
     (Property             : Node_Id;
      Use_Evaluated_Values : Boolean := True)
     return Property_Type;

   function Get_Type_Of_Property_Value
     (Property_Value       : Node_Id;
      Use_Evaluated_Values : Boolean := True)
     return Property_Type;

   function Get_Integer_Of_Property_Value
     (Property_Value : Node_Id)
     return Unsigned_Long_Long;

   function Get_Float_Of_Property_Value
     (Property_Value : Node_Id)
     return Long_Long_Float;

   function Get_String_Of_Property_Value
     (Property_Value : Node_Id)
     return Name_Id;

   function Get_String_Of_Property_Value
     (Property_Value : Node_Id)
     return String;

   function Get_Enumeration_Of_Property_Value
     (Property_Value : Node_Id)
     return Name_Id;

   function Get_Enumeration_Of_Property_Value
     (Property_Value : Node_Id)
     return String;

   function Get_Boolean_Of_Property_Value
     (Property_Value : Node_Id)
     return Boolean;

   function Get_Classifier_Of_Property_Value
     (Property_Value : Node_Id)
     return Node_Id;

   function Get_Reference_Of_Property_Value
     (Property_Value : Node_Id)
     return Node_Id;

   function Get_Value_Of_Property_Association
     (Property : Node_Id)
     return Value_Type;

   function Find_Property_Association_From_Name
     (Property_List : List_Id;
      Property_Name : Name_Id;
      In_Mode       : Name_Id := No_Name)
     return Node_Id;

   function Find_Property_Association_From_Name
     (Property_List : List_Id;
      Property_Name : String;
      In_Mode       : Name_Id := No_Name)
     return Node_Id;

   procedure Resolve_Term_In_Property
     (Property  : Node_Id;
      Value     : Node_Id;
      Kind_Node : Node_Kind);

end Ocarina.ME_AADL.AADL_Tree.Entities.Properties;

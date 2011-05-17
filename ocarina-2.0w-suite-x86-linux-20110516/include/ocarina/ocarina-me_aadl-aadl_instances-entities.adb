------------------------------------------------------------------------------
--                                                                          --
--                           OCARINA COMPONENTS                             --
--                                                                          --
--                 OCARINA.ME_AADL.AADL_INSTANCES.ENTITIES                  --
--                                                                          --
--                                 B o d y                                  --
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

with Namet;
with Output;

with Ocarina.ME_AADL.AADL_Instances.Nodes;
with Ocarina.ME_AADL.AADL_Tree.Nodes;
with Ocarina.ME_AADL.AADL_Tree.Entities;
with Ocarina.ME_AADL.AADL_Instances.Nutils;
with Ocarina.ME_AADL.AADL_Instances.Debug;

package body Ocarina.ME_AADL.AADL_Instances.Entities is

   package ATN renames Ocarina.ME_AADL.AADL_Tree.Nodes;
   package AIN renames Ocarina.ME_AADL.AADL_Instances.Nodes;
   package ATE renames Ocarina.ME_AADL.AADL_Tree.Entities;

   --
   --  This following section is relative to Entities
   --

   ------------------------
   -- Get_Name_Of_Entity --
   ------------------------

   function Get_Name_Of_Entity
     (Entity : Types.Node_Id;
      Get_Display_Name : Boolean := True)
     return Types.Name_Id
   is
      use Types;
      use AIN;

      pragma Assert
        (Kind (Entity) = K_Subcomponent_Instance
           or else Kind (Entity) = K_Call_Instance
           or else Kind (Entity) = K_Call_Sequence_Instance
           or else Kind (Entity) = K_Port_Spec_Instance
           or else Kind (Entity) = K_Feature_Group_Spec_Instance
           or else Kind (Entity) = K_Parameter_Instance
           or else Kind (Entity) = K_Subcomponent_Access_Instance
           or else Kind (Entity) = K_Subprogram_Spec_Instance
           or else Kind (Entity) = K_Connection_Instance
           or else Kind (Entity) = K_Component_Instance
           or else Kind (Entity) = K_Mode_Instance
           or else Kind (Entity) = K_Namespace_Instance
           or else Kind (Entity) = K_Property_Association_Instance
           or else DNKE (Entity));
   begin
      if Identifier (Entity) /= No_Node then
         if Get_Display_Name then
            return Display_Name (Identifier (Entity));
         else
            return Name (Identifier (Entity));
         end if;
      else
         return No_Name;
      end if;
   end Get_Name_Of_Entity;

   ------------------------
   -- Get_Name_Of_Entity --
   ------------------------

   function Get_Name_Of_Entity
     (Entity : Types.Node_Id;
      Get_Display_Name : Boolean := True)
     return String
   is
      use Types;
      use Namet;

      Name : constant Name_Id := Get_Name_Of_Entity (Entity, Get_Display_Name);
   begin
      if Name /= No_Name then
         return Get_Name_String (Name);
      else
         return "";
      end if;
   end Get_Name_Of_Entity;

   ---------------------------
   -- Get_Referenced_Entity --
   ---------------------------

   function Get_Referenced_Entity
     (Entity_Ref : Types.Node_Id)
     return Types.Node_Id
   is
      use Types;
      use AIN;

      pragma Assert (Kind (Entity_Ref) = K_Entity_Reference_Instance
             or else DNKE (Entity_Ref));
   begin
      return AIN.Item (AIN.Last_Node (AIN.Path (Entity_Ref)));
   end Get_Referenced_Entity;

   ------------------------------------------
   -- Add_Path_Element_To_Entity_Reference --
   ------------------------------------------

   procedure Add_Path_Element_To_Entity_Reference
     (Entity_Ref, Item : Types.Node_Id)
   is
      use Types;
      use AIN;
      use Ocarina.Me_AADL.AADL_Instances.Nutils;

      pragma Assert
        (Entity_Ref /= No_Node
         and then (Kind (Entity_Ref) = K_Entity_Reference_Instance
                   or else DNKE (Entity_Ref)));
      pragma Assert (Item /= No_Node);
   begin
      if Path (Entity_Ref) = No_List then
         Set_Path (Entity_Ref, New_List (K_List_Id, Loc (Item)));
      end if;

      Append_Node_To_List (New_Node (K_Node_Container, Loc (Item)),
                           Path (Entity_Ref));
      Set_Item (Last_Node (Path (Entity_Ref)), Item);
   end Add_Path_Element_To_Entity_Reference;

   ------------------------------------------------
   -- Entity_Reference_Path_Has_Several_Elements --
   ------------------------------------------------

   function Entity_Reference_Path_Has_Several_Elements
     (Entity_Ref : Types.Node_Id)
     return Boolean
   is
      use Types;
      use Ocarina.Me_AADL.AADL_Instances.Nodes;

      pragma Assert
        (Entity_Ref /= No_Node
         and then Kind (Entity_Ref) = K_Entity_Reference_Instance);
   begin
      return Path (Entity_Ref) /= No_List
        and then First_Node (Path (Entity_Ref)) /= No_Node
        and then Next_Node (First_Node (Path (Entity_Ref))) /= No_Node;
   end Entity_Reference_Path_Has_Several_Elements;

   --------------------------
   -- Duplicate_Identifier --
   --------------------------

   function Duplicate_Identifier
     (Identifier : Types.Node_Id)
     return Types.Node_Id
   is
      use Types;
      use Ocarina.Me_AADL.AADL_Instances.Nutils;
      use AIN;

      Duplicate : Node_Id;
   begin
      if Identifier = No_Node then
         return No_Node;
      else
         Duplicate := New_Node (K_Identifier, ATN.Loc (Identifier));
         Set_Name (Duplicate, ATN.Name (Identifier));
         Set_Display_Name (Duplicate, ATN.Display_Name (Identifier));
         Set_Corresponding_Entity (Duplicate,
                                   ATN.Corresponding_Entity (Identifier));
         return Duplicate;
      end if;
   end Duplicate_Identifier;

   --
   --  This following section is relative to Entities Components
   --

   -------------------------------
   -- Get_Category_Of_Component --
   -------------------------------

   function Get_Category_Of_Component
     (Component : Types.Node_Id)
     return Component_Category
   is
      use Types;
      use AIN;
      use ATN;

      pragma Assert
        (AIN.Kind (Component) = K_Component_Instance
         or else AIN.Kind (Component) = K_Subcomponent_Instance);
   begin
      if AIN.Kind (Component) = K_Subcomponent_Instance then
         if Present
           (Corresponding_Declaration
              (Corresponding_Instance
                 (Component)))
         then
            return Component_Category'Val
              (ATN.Category
                 (Corresponding_Declaration
                    (Corresponding_Instance
                       (Component))));
         else
            return CC_Unknown;
         end if;
      else
         if Present (Corresponding_Declaration (Component)) then
            return Component_Category'Val
              (ATN.Category
               (Corresponding_Declaration
                (Component)));
         else
            return CC_Unknown;
         end if;
      end if;
   end Get_Category_Of_Component;

   --
   --  This following section is relative to Entities Components Connections
   --

   --------------------------------
   -- Get_Category_Of_Connection --
   --------------------------------

   function Get_Category_Of_Connection
     (Connection : Types.Node_Id)
     return Connection_Type
   is
      use AIN;
      use Types;

      pragma Assert
        (Connection /= No_Node
           and then (Kind (Connection) = K_Connection_Instance
                     or else DNKE (Connection)));
   begin
      if Kind (Connection) = K_Connection_Instance then
         return ATE.Get_Category_Of_Connection
           (Corresponding_Declaration (Connection));
      else
         return CT_Error;
      end if;
   end Get_Category_Of_Connection;

   --
   --  This following section is relative to Entities Components Subcomponents
   --

   ----------------------------------
   -- Get_Category_Of_Subcomponent --
   ----------------------------------

   function Get_Category_Of_Subcomponent
     (Subcomponent : Types.Node_Id)
     return Component_Category
   is
      use Types;
      use AIN;
      use ATN;

      pragma Assert
        (Subcomponent /= No_Node
         and then AIN.Kind (Subcomponent) = K_Subcomponent_Instance);
   begin
      if Corresponding_Declaration (Subcomponent) /= No_Node then
         return Component_Category'Val
           (ATN.Category (Corresponding_Declaration (Subcomponent)));
      else
         return CC_Unknown;
      end if;
   end Get_Category_Of_Subcomponent;

   --
   --  This following section is relative to Entities MEssages
   --
   -----------------------------
   -- Display_Node_Kind_Error --
   -----------------------------

   function Display_Node_Kind_Error
     (Node : Types.Node_Id)
     return Boolean
   is
      use Types;
      use Output;
      use AIN;
      use Ocarina.ME_AADL.AADL_Instances.Debug;
   begin
      Set_Standard_Error;
      W_Str ("Bad node kind: ");

      if Node /= No_Node then
         W_Node_Header (Node);
         W_Line (" " & Node_Kind'Image (Kind (Node)));
      else
         W_Line ("no node");
      end if;

      Set_Standard_Output;
      return False;
   end Display_Node_Kind_Error;

end Ocarina.ME_AADL.AADL_Instances.Entities;

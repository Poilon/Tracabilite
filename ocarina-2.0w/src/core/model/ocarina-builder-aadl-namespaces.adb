------------------------------------------------------------------------------
--                                                                          --
--                           OCARINA COMPONENTS                             --
--                                                                          --
--      O C A R I N A . B U I L D E R . A A D L . N A M E S P A C E S       --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
--                 Copyright (C) 2009, GET-Telecom Paris.                   --
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

with Ocarina.ME_AADL.AADL_Tree.Nodes;
with Ocarina.ME_AADL.AADL_Tree.Nutils;

package body Ocarina.Builder.AADL.Namespaces is

   ----------------------------------
   -- Initialize_Unnamed_Namespace --
   ----------------------------------

   function Initialize_Unnamed_Namespace
     (Loc : Locations.Location)
     return Types.Node_Id
   is
      use Types;
      use Ocarina.ME_AADL.AADL_Tree.Nodes;
      use Ocarina.ME_AADL.AADL_Tree.Nutils;

      Specification : constant Node_Id := New_Node (K_AADL_Specification, Loc);
      Entity_Scop : constant Node_Id := New_Node (K_Scope_Definition, Loc);
   begin
      Set_Entity_Scope (Specification, Entity_Scop);
      Set_Corresponding_Entity (Entity_Scop, Specification);

      Set_Declarations (Specification,
                        New_List (K_AADL_Declarations_List, Loc));

      return Specification;
   end Initialize_Unnamed_Namespace;

   ------------------------------
   -- Add_Property_Association --
   ------------------------------

   function Add_Property_Association
     (Pack : Types.Node_Id;
      Property_Association : Types.Node_Id)
     return Boolean
   is
      use Types;
      use Locations;
      use Ocarina.ME_AADL.AADL_Tree.Nodes;
      use Ocarina.ME_AADL.AADL_Tree.Nutils;

      pragma Assert (Pack /= No_Node
                     and then Kind (Pack) = K_Package_Specification);
      pragma Assert (Property_Association /= No_Node
                     and then Kind (Property_Association) =
                     K_Property_Association);
   begin
      if Is_Empty (Ocarina.ME_AADL.AADL_Tree.Nodes.Properties (Pack)) then
         Set_Properties
           (Pack, New_List (K_List_Id, Loc (Property_Association)));
      end if;

      Append_Node_To_List (Property_Association,
                           Ocarina.ME_AADL.AADL_Tree.Nodes.Properties (Pack));

      return True;
   end Add_Property_Association;

   ---------------------
   -- Add_Declaration --
   ---------------------

   function Add_Declaration
     (Namespace : Types.Node_Id;
      Element   : Types.Node_Id)
     return Boolean
   is
      use Types;
      use Ocarina.ME_AADL.AADL_Tree.Nodes;
      use Ocarina.ME_AADL.AADL_Tree.Nutils;

      pragma Assert
        (Namespace /= No_Node
         and then (Kind (Namespace) = K_Package_Specification
                   or else Kind (Namespace) = K_AADL_Specification));
      pragma Assert (Element /= No_Node);
   begin
      case Kind (Namespace) is
         when K_Package_Specification =>
            case Kind (Element) is
               when K_Feature_Group_Type
                 | K_Annex_Library
                 | K_Component_Type
                 | K_Component_Implementation
                 | K_Name_Visibility_Declaration =>
                  if Is_Empty (Declarations (Namespace)) then
                     Set_Declarations
                       (Namespace, New_List (K_List_Id, Loc (Element)));
                  end if;

                  Append_Node_To_List (Element, Declarations (Namespace));

                  if Is_Private (Element) then
                     Set_Has_Private_Part (Namespace, True);
                  else
                     Set_Has_Public_Part (Namespace, True);
                  end if;

                  return True;

               when others =>
                  raise Program_Error;
            end case;

         when K_AADL_Specification =>
            case Kind (Element) is
               when K_Feature_Group_Type
                 | K_Component_Type
                 | K_Component_Implementation
                 | K_Property_Set
                 | K_Package_Specification =>
                  if Is_Empty (Declarations (Namespace)) then
                     Set_Declarations (Namespace,
                                       New_List (K_List_Id, Loc (Element)));
                  end if;

                  Append_Node_To_List (Element, Declarations (Namespace));
                  return True;

               when others =>
                  raise Program_Error;
            end case;

         when others =>
            raise Program_Error;
      end case;
   end Add_Declaration;

   ---------------------
   -- Add_New_Package --
   ---------------------

   function Add_New_Package
     (Loc : Locations.Location;
      Pack_Name : Types.Node_Id;
      Namespace : Types.Node_Id)
     return Types.Node_Id
   is
      use Types;
      use Namet;
      use Ocarina.ME_AADL.AADL_Tree.Nutils;
      use Ocarina.ME_AADL.AADL_Tree.Nodes;

      pragma Assert (Pack_Name /= No_Node
                     and then Kind (Pack_Name) = K_Package_Name);
      pragma Assert (Namespace /= No_Node
                    and then Kind (Namespace) = K_AADL_Specification);

      Node : constant Node_Id := New_Node (K_Package_Specification, Loc);
      Success : Boolean := True;
      Entity_Scop : constant Node_Id := New_Node (K_Scope_Definition, Loc);
      Property_Scop : constant Node_Id := New_Node (K_Scope_Definition, Loc);
      Identifier : constant Node_Id := New_Node (K_Identifier, Loc);
      List_Node : Node_Id;
   begin
      --  Build Identifier which is the concatenation of identifiers
      --  of package_name (Pck_Id1::Pck_Id2 ...)

      Set_Corresponding_Entity (Identifier, No_Node);
      List_Node := First_Node (Identifiers (Pack_Name));
      Get_Name_String (Name (List_Node));

      List_Node := Next_Node (List_Node);

      while Present (List_Node) loop
         Add_Str_To_Name_Buffer ("::");
         Get_Name_String_And_Append (Name (List_Node));

         List_Node := Next_Node (List_Node);
      end loop;

      Set_Name (Identifier, Name_Find);

      List_Node := First_Node (Identifiers (Pack_Name));
      Get_Name_String (Display_Name (List_Node));

      List_Node := Next_Node (List_Node);

      while Present (List_Node) loop
         Add_Str_To_Name_Buffer ("::");
         Get_Name_String_And_Append (Display_Name (List_Node));

         List_Node := Next_Node (List_Node);
      end loop;

      Set_Display_Name (Identifier, Name_Find);

      Set_Parent (Node, Namespace);
      Set_Package_Name (Node, Pack_Name);
      Set_Identifier (Node, Identifier);
      Set_Corresponding_Entity (Identifier, Node);

      Set_Entity_Scope (Node, Entity_Scop);
      Set_Property_Scope (Node, Property_Scop);

      Set_Corresponding_Entity (Entity_Scop, Node);
      Set_Corresponding_Entity (Property_Scop, Node);

      Set_Declarations (Node, No_List);
      Set_Properties (Node, No_List);
      Set_Has_Private_Part (Node, False);
      Set_Has_Public_Part (Node, False);

      Success := Add_Declaration (Namespace => Namespace,
                                  Element => Node);

      if Success then
         return Node;
      else
         return No_Node;
      end if;
   end Add_New_Package;

   -----------------------------------------
   -- Add_New_Name_Visibility_Declaration --
   -----------------------------------------

   function Add_New_Name_Visibility_Declaration
     (Loc         : Locations.Location;
      Namespace   : Types.Node_Id;
      List_Items  : Types.List_Id;
      Is_Private  : Boolean := False)
     return Types.Node_Id
   is
      use Types;
      use Ocarina.ME_AADL.AADL_Tree.Nutils;
      use Ocarina.ME_AADL.AADL_Tree.Nodes;

      pragma Assert (Kind (Namespace) = K_Package_Specification
                       or else Kind (Namespace) = K_AADL_Specification);

      Node : constant Node_Id := New_Node (K_Name_Visibility_Declaration, Loc);
      Success : Boolean := False;
   begin
      Set_Parent (Node, Namespace);
      Set_List_Items (Node, List_Items);
      Set_Is_Private (Node, Is_Private);

      Success := Add_Declaration (Namespace, Node);

      if Success then
         return Node;
      else
         return No_Node;
      end if;
   end Add_New_Name_Visibility_Declaration;

   --------------------------------
   -- Add_New_Import_Declaration --
   --------------------------------

   function Add_New_Import_Declaration
     (Loc         : Locations.Location;
      Namespace   : Types.Node_Id;
      List_Items  : Types.List_Id;
      Is_Private  : Boolean := False)
     return Types.Node_Id
   is
      use Types;
      use Ocarina.ME_AADL.AADL_Tree.Nutils;
      use Ocarina.ME_AADL.AADL_Tree.Nodes;

      pragma Assert (Kind (Namespace) = K_Package_Specification
                       or else Kind (Namespace) = K_AADL_Specification
                       or else Kind (Namespace) = K_Property_Set);

      Node : constant Node_Id := New_Node (K_Import_Declaration, Loc);
   begin

      Set_List_Items (Node, List_Items);
      Set_Is_Private (Node, Is_Private);

      return Node;

   end Add_New_Import_Declaration;

   -------------------------------
   -- Add_New_Alias_Declaration --
   -------------------------------

   function Add_New_Alias_Declaration
     (Loc            : Locations.Location;
      Namespace      : Types.Node_Id;
      Identifier     : Types.Node_Id;
      Package_Name   : Types.Node_Id;
      Classifier_Ref : Types.Node_Id;
      Entity_Cat     : Ocarina.ME_AADL.Entity_Category;
      Component_Cat  : Ocarina.ME_AADL.Component_Category;
      Is_All         : Boolean := False;
      Is_Private     : Boolean := False)
     return Types.Node_Id
   is
      use Types;
      use Ocarina.ME_AADL.AADL_Tree.Nutils;
      use Ocarina.ME_AADL.AADL_Tree.Nodes;

      pragma Assert (Kind (Namespace) = K_Package_Specification
                       or else Kind (Namespace) = K_AADL_Specification);

      Node : constant Node_Id := New_Node (K_Alias_Declaration, Loc);
   begin

      Set_Parent (Node, Namespace);
      Set_Identifier (Node, Identifier);
      Set_Package_Name (Node, Package_Name);
      Set_Reference (Node, Classifier_Ref);
      Set_Entity_Category (Node,
                           Ocarina.ME_AADL.Entity_Category'Pos (Entity_Cat));
      Set_Category (Node,
                    Ocarina.ME_AADL.Component_Category'Pos (Component_Cat));
      Set_Is_All (Node, Is_All);
      Set_Is_Private (Node, Is_Private);

      return Node;
   end Add_New_Alias_Declaration;

   --------------------------
   -- Add_New_Package_Name --
   --------------------------

   function Add_New_Package_Name
     (Loc            : Locations.Location;
      Identifiers    : Types.List_Id)
     return Types.Node_Id
   is
      use Types;
      use Ocarina.ME_AADL.AADL_Tree.Nutils;
      use Ocarina.ME_AADL.AADL_Tree.Nodes;

      Node : constant Node_Id := New_Node (K_Package_Name, Loc);
   begin

      if not Is_Empty (Identifiers) then
         Set_Identifiers (Node, Identifiers);
      end if;

      return Node;

   end Add_New_Package_Name;

end Ocarina.Builder.AADL.Namespaces;

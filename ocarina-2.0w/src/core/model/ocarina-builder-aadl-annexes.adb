------------------------------------------------------------------------------
--                                                                          --
--                           OCARINA COMPONENTS                             --
--                                                                          --
--         O C A R I N A . B U I L D E R . A A D L . A N N E X E S          --
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

with Ocarina.Builder.AADL.Namespaces;
with Ocarina.Builder.AADL.Components;

with Ocarina.ME_AADL.AADL_Tree.Nodes;
with Ocarina.ME_AADL.AADL_Tree.Nutils;

package body Ocarina.Builder.AADL.Annexes is

   function Add_New_Annex
     (Loc        : Locations.Location;
      Annex_Name : Types.Node_Id;
      Namespace  : Types.Node_Id;
      Annex_Kind : Ocarina.ME_AADL.AADL_Tree.Nodes.Node_Kind;
      In_Modes   : Types.Node_Id := Types.No_Node)
     return Types.Node_Id;

   -------------------
   -- Add_New_Annex --
   -------------------

   function Add_New_Annex
     (Loc        : Locations.Location;
      Annex_Name : Types.Node_Id;
      Namespace  : Types.Node_Id;
      Annex_Kind : Ocarina.ME_AADL.AADL_Tree.Nodes.Node_Kind;
      In_Modes   : Types.Node_Id := Types.No_Node)
     return Types.Node_Id
   is
      use Types;
      use Ocarina.Builder.AADL.Components;
      use Ocarina.Builder.AADL.Namespaces;
      use Ocarina.ME_AADL.AADL_Tree.Nodes;
      use Ocarina.ME_AADL.AADL_Tree.Nutils;

      pragma Assert (Annex_Name /= No_Node
                     and then Kind (Annex_Name) = K_Identifier);
      pragma Assert (Namespace /= No_Node);
      pragma Assert ((Annex_Kind = K_Annex_Subclause
                      and then (Kind (Namespace) = K_Component_Implementation
                                or else Kind (Namespace) = K_Component_Type
                                or else Kind (Namespace) =
                                                        K_Feature_Group_Type))
          or else (Annex_Kind = K_Annex_Library
                  and then (Kind (Namespace) = K_Package_Specification
                           or else Kind (Namespace) = K_AADL_Specification)));

      Node : constant Node_Id := New_Node (Annex_Kind, Loc);
      Success : Boolean := True;
   begin
      Set_Identifier (Node, Annex_Name);
      Set_Corresponding_Entity (Annex_Name, Node);
      Set_Annex_Content (Node, No_Node);
      Set_In_Modes (Node, In_Modes);

      if Kind (Namespace) = K_AADL_Specification
        or else Kind (Namespace) = K_Package_Specification
      then
         Set_Container_Package (Node, Namespace);
         Success := Add_Declaration (Namespace, Node);

      elsif Kind (Namespace) = K_Component_Type
        or else Kind (Namespace) = K_Component_Implementation
        or else Kind (Namespace) = K_Feature_Group_Type
      then
         Set_Container_Component (Node, Namespace);
         Success := Add_Annex (Namespace, Node);
      end if;

      if Success then
         return Node;
      else
         return No_Node;
      end if;
   end Add_New_Annex;

   -----------------------
   -- Set_Annex_Content --
   -----------------------

   function Set_Annex_Content
     (Annex : Types.Node_Id;
      Text  : Types.Name_Id)
     return Boolean
   is
      use Types;
      use Ocarina.ME_AADL.AADL_Tree.Nodes;
      use Ocarina.ME_AADL.AADL_Tree.Nutils;

      pragma Assert (Annex /= No_Node
                     and then (Kind (Annex) = K_Annex_Subclause
                               or else Kind (Annex) = K_Annex_Library));

      Content : constant Node_Id := New_Node (K_Annex_Content, Loc (Annex));
   begin
      Set_Raw_Text (Content, Text);
      Set_Annex_Content (Annex, Content);
      return True;
   end Set_Annex_Content;

   -----------------------------
   -- Add_New_Annex_Subclause --
   -----------------------------

   function Add_New_Annex_Subclause
     (Loc        : Locations.Location;
      Annex_Name : Types.Node_Id;
      Namespace  : Types.Node_Id;
      In_Modes   : Types.Node_Id)
     return Types.Node_Id
   is
      use Types;
      use Ocarina.ME_AADL.AADL_Tree.Nodes;

   begin
      return Add_New_Annex (Loc,
                            Annex_Name,
                            Namespace,
                            K_Annex_Subclause,
                            In_Modes);
   end Add_New_Annex_Subclause;

   ---------------------------
   -- Add_New_Annex_Library --
   ---------------------------

   function Add_New_Annex_Library
     (Loc        : Locations.Location;
      Annex_Name : Types.Node_Id;
      Namespace  : Types.Node_Id;
      Is_Private : Boolean             := False)
     return Types.Node_Id
   is
      use Types;
      use Ocarina.ME_AADL.AADL_Tree.Nodes;

      Node : constant Node_Id := Add_New_Annex (Loc,
                                                Annex_Name,
                                                Namespace,
                                                K_Annex_Library);
   begin
      Set_Is_Private (Node, Is_Private);
      return Node;
   end Add_New_Annex_Library;

   ------------------------
   -- Add_New_Annex_Path --
   ------------------------

   function Add_New_Annex_Path
     (Loc              : Locations.Location;
      Container        : Types.Node_Id;
      Annex_Identifier : Types.Node_Id;
      List_Identifiers : Types.List_Id)
     return Types.Node_Id
   is
      use Types;
      use Ocarina.ME_AADL.AADL_Tree.Nodes;
      use Ocarina.ME_AADL.AADL_Tree.Nutils;

      pragma Assert (Container /= No_Node);
      pragma Assert (not Is_Empty (List_Identifiers));

      Node : constant Node_Id := New_Node (K_Annex_Path, Loc);

   begin

      Set_Container_Component (Node, Container);
      Set_Identifier (Node, Annex_Identifier);
      Set_Identifiers (Node, List_Identifiers);

      return Node;
   end Add_New_Annex_Path;

end Ocarina.Builder.AADL.Annexes;

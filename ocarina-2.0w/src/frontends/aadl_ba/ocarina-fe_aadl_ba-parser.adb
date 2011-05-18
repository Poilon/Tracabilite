------------------------------------------------------------------------------
--                                                                          --
--                           OCARINA COMPONENTS                             --
--                                                                          --
--            O C A R I N A . F E _ A A D L _ B A . P A R S E R             --
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

with Output;

with GNAT.OS_Lib;

with Ocarina.Parser;

with Ocarina.FE_AADL_BA.Lexer;
with Ocarina.FE_AADL_BA.Parser.Specifications;

with Ocarina.ME_AADL_BA.BA_Tree.Nodes;
with Ocarina.ME_AADL_BA.BA_Tree.Nutils;

package body Ocarina.FE_AADL_BA.Parser is

   use Output;
   use Locations;
   use GNAT.OS_Lib;

   use Ocarina.Parser;
   use Ocarina.FE_AADL_BA.Lexer;
   use Ocarina.FE_AADL_BA.Parser.Specifications;
   use Ocarina.ME_AADL_BA.Tokens;
   use Ocarina.ME_AADL_BA.BA_Tree.Nodes;
   use Ocarina.ME_AADL_BA.BA_Tree.Nutils;

   Language : constant String := "behavior_specification";

   procedure Exit_On_Error (Error : Boolean; Reason : String);
   pragma Unreferenced (Exit_On_Error);

   -------------------
   -- Exit_On_Error --
   -------------------

   procedure Exit_On_Error (Error : Boolean; Reason : String) is
   begin
      if Error then
         Set_Standard_Error;
         Write_Line (Reason);
         OS_Exit (1);
      end if;
   end Exit_On_Error;

   ----------
   -- Init --
   ----------

   procedure Init is
   begin
      Ocarina.Parser.Register_Parser (Language, Process'Access);
   end Init;

   ------------------
   -- P_Items_List --
   ------------------

   --  ( { Item }+ | none_statement )

   function P_Items_List
     (Func      : P_Item_Function_Ptr;
      Container : Node_Id;
      Code      : Parsing_Code)
     return Integer
   is
      Loc   : Location;
      Nb_Items : Integer := 0;
      Item  : Node_Id;

   begin
      loop
         Save_Lexer (Loc);
         Item := Func.all (Container);
         if Present (Item) then
            Nb_Items := Nb_Items + 1;
         else
            --  Error when parsing item, restore lexer

            Restore_Lexer (Loc);
            if Nb_Items = 0 then
               --  list must contain at least one element, {Item}+

               Nb_Items := -1;
               DPE (Code, EMC_List_Is_Empty);
            end if;
            exit;
         end if;
      end loop;

      return Nb_Items;
   end P_Items_List;

   ------------------
   -- P_Items_List --
   ------------------

   function P_Items_List
     (Func      : P_Item_Function_Ptr;
      Container : Node_Id;
      Code      : Parsing_Code)
     return List_Id
   is
      Loc   : Location;
      Items : List_Id;
      Item  : Node_Id;

   begin
      Items := New_List (K_List_Id, Token_Location);
      loop
         Save_Lexer (Loc);
         Item := Func.all (Container);
         if Present (Item) then
            Append_Node_To_List (Item, Items);
         else
            --  Error when parsing item, restore lexer
            Restore_Lexer (Loc);
            if Is_Empty (Items) then
               --  list must contain at least one element, { Item }+
               DPE (Code, EMC_List_Is_Empty);
            end if;
            exit;
         end if;
      end loop;

      return Items;
   end P_Items_List;

   ------------------
   -- P_Items_List --
   ------------------

   --  ( { Item Separator }* Item )

   function P_Items_List
     (Func         : P_Item_Function_Ptr;
      Container    : Node_Id;
      Separator    : Ocarina.ME_AADL_BA.Tokens.BA_Token_Type)
     return List_Id
   is
      Item  : Node_Id;
      Items : List_Id;
      Loc   : Location;

   begin
      Items := New_List (K_List_Id, Token_Location);
      loop
         Item := Func.all (Container);
         if Present (Item) then
            Append_Node_To_List (Item, Items);
         else
            return No_List;
         end if;

         Save_Lexer (Loc);
         Scan_Token;
         if Token /= Separator then
            Restore_Lexer (Loc);
            exit;
         end if;
      end loop;

      Set_Loc (Node_Id (Items),
               Ocarina.ME_AADL_BA.BA_Tree.Nodes.Loc (First_Node (Items)));
      return Items;
   end P_Items_List;

   --------------------
   -- P_Element_List --
   --------------------

   --  parse ( { Element }* Element Delimiter )

   function P_Elements_List
     (Func         : P_Item_Function_Ptr;
      Container    : Node_Id;
      Delimiters   : Ocarina.ME_AADL_BA.Tokens.BA_Token_List_Type;
      Code         : Parsing_Code)
     return List_Id
   is
      Element       : Node_Id;
      Elements_List : List_Id;
      Loc           : Location;

      Escape        : Boolean := False;
   begin
      Elements_List := New_List (K_List_Id, Token_Location);
      loop
         Element := Func.all (Container);
         if Present (Element) then
            Append_Node_To_List (Element, Elements_List);
         else
            DPE (Code, EMC_List_Is_Empty);
            Skip_Tokens (Delimiters);
            return No_List;
         end if;

         Save_Lexer (Loc);
         Scan_Token;

         for Index in Delimiters'Range loop
            if Token =  (Delimiters (Index)) then
               Restore_Lexer (Loc);
               Escape := True;
               exit;
            end if;
         end loop;

         if Escape then
            exit;
         else
            Restore_Lexer (Loc);
         end if;
      end loop;

      Set_Loc (Node_Id (Elements_List),
               Ocarina.ME_AADL_BA.BA_Tree.Nodes.Loc (First_Node
                                                       (Elements_List)));
      return Elements_List;
   end P_Elements_List;

   -------------
   -- Process --
   -------------

   function Process
     (AADL_Root     : Node_Id;
      From          : Location;
      To            : Location := No_Location)
     return Node_Id
   is
      Buffer        : Location;
   begin

      Buffer := From;
      if To /= No_Location then
         Buffer.EOF := To.Last_Pos;
      end if;
      Restore_Lexer (Buffer);

      return P_Behavior_Specification (AADL_Root);
   end Process;

end Ocarina.FE_AADL_BA.Parser;

------------------------------------------------------------------------------
--                                                                          --
--                           OCARINA COMPONENTS                             --
--                                                                          --
--                OCARINA.FE_AADL.PARSER.COMPONENTS.ARRAYS                  --
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

--  This package gathers all the functions that are related to prototype
--  parsing.

with Locations;
with Ocarina.ME_AADL.AADL_Tree.Nodes;
with Ocarina.ME_AADL.AADL_Tree.Nutils;
with Ocarina.ME_AADL.Tokens;
with Ocarina.FE_AADL.Lexer;
with Ocarina.FE_AADL.Parser.Identifiers;
with Ocarina.FE_AADL.Parser.Properties.Values;

with Ocarina.Builder.AADL.Components.Arrays;

package body Ocarina.FE_AADL.Parser.Components.Arrays is

   --------------------------
   -- P_Arrays_Dimensions  --
   --------------------------

   --  AADL_V2

   function P_Array_Dimensions (Container : Types.Node_Id)
     return Node_Id
   is

      use Locations;
      use Ocarina.ME_AADL.Tokens;
      use Lexer;
      use Ocarina.ME_AADL.AADL_Tree.Nodes;
      use Ocarina.ME_AADL.AADL_Tree.Nutils;

      pragma Assert (Container /= No_Node
                     and then (Kind (Container) = K_Subcomponent));

      Loc            : Location;
      List_Array_Dim : List_Id := No_List;
      Node_Array     : constant Node_Id := New_Node (K_Array_Dimensions,
                                                     Token_Location);

   begin
      Save_Lexer (Loc);

      if Token /= T_Left_Square_Bracket then
         DPE (PC_Array_Dimensions, T_Left_Square_Bracket);
         Skip_Tokens (T_Semicolon);
         return No_Node;
      end if;

      if Node_Array = No_Node then
         DPE (PC_Array_Dimensions);
         Skip_Tokens (T_Semicolon);
         return No_Node;
      end if;

      List_Array_Dim := P_Items_List (P_Array_Dimension_Size'Access,
                                      Node_Array,
                                      T_Left_Square_Bracket);

      Set_Array_List_Dim (Node_Array, List_Array_Dim);

      return Node_Array;

   end P_Array_Dimensions;

   ----------------------------
   -- P_Array_Dimension_Size --
   ----------------------------

   --  AADL_V2
   --  array_dimensions ::= { [ [ array_dimension_size ] ] }*
   --  array_dimension_size ::= numeral | unique_property_constant_identifier

   function P_Array_Dimension_Size
   (Container : Types.Node_Id)
     return Node_Id
   is
      use Locations;
      use Ocarina.ME_AADL.AADL_Tree.Nodes;
      use Ocarina.ME_AADL.Tokens;
      use Lexer;
      use Parser.Identifiers;
      use Parser.Properties.Values;
      use Builder.AADL.Components.Arrays;

      Loc  : Location;
      Size : Node_Id;
      Node : Node_Id;

   begin
      Save_Lexer (Loc);
      Scan_Token;

      case Token is
         when T_Identifier =>
            Restore_Lexer (Loc);
            Size := P_Identifier (Container);

         when T_Integer_Literal =>
            Restore_Lexer (Loc);
            Size := P_Signed_AADLNumber (NC_Integer, PC_Array_Dimension_Size);

         when T_Right_Square_Bracket =>
            Size := No_Node;

         when others =>
            DPE (PC_Array_Dimension_Size, (T_Integer_Literal, T_Identifier));
            Skip_Tokens (T_Semicolon);
            return No_Node;
      end case;

      if Present (Size) then
         Scan_Token;
      end if;

      Node := Add_New_Array_Dimension_Size (Loc, Container, Size);
      if Node = No_Node then
         DPE (PC_Array_Dimension_Size);
         Skip_Tokens (T_Semicolon);
         return No_Node;
      end if;

      return Node;

   end P_Array_Dimension_Size;

   -----------------------
   -- P_Array_Selection --
   -----------------------

   --  AADL_V2
   --  array_selection_identifier ::= identifier array_selection
   --  array_selection ::= {[range_selection]}*
   --  range_selection ::= numeral [ .. numeral ]

   function P_Array_Selection
     (Container : Types.Node_Id)
     return Node_Id
   is
      use Lexer;
      use Locations;
      use Ocarina.ME_AADL.AADL_Tree.Nodes;
      use Ocarina.ME_AADL.AADL_Tree.Nutils;
      use Ocarina.FE_AADL.Parser.Identifiers;
      use Ocarina.FE_AADL.Parser.Properties.Values;
      use Ocarina.ME_AADL.Tokens;
      use Ocarina.Builder.AADL.Components.Arrays;

      Loc             : Location;
      Start_Loc       : Location;
      Identifier      : Node_Id;
      Array_Selection : Node_Id;
      Range_Selection : Node_Id   := No_Node;
      First_Term      : Node_Id;
      Second_Term     : Node_Id   := No_Node;
      Range_List      : List_Id   := No_List;
   begin
      Save_Lexer (Start_Loc);

      Identifier := P_Identifier (Container);

      if No (Identifier) then
         DPE (PC_Array_Selection);
         Skip_Tokens (T_Semicolon);
         return No_Node;
      end if;

      Save_Lexer (Loc);
      Range_List := New_List (K_List_Id, Loc);

      loop
         Save_Lexer (Loc);
         Scan_Token;
         if Token = T_Left_Square_Bracket then
            First_Term := P_Numeric_Term (PC_Array_Selection);
            Save_Lexer (Loc);
            Scan_Token;

            if Token /= T_Interval then
               Restore_Lexer (Loc);
            else
               Second_Term := P_Numeric_Term (PC_Array_Selection);

               if No (Second_Term) then
                  DPE (PC_Array_Selection);
                  Skip_Tokens (T_Semicolon);
                  return No_Node;
               end if;

               Scan_Token;
               if Token /= T_Right_Square_Bracket then
                  DPE (PC_Array_Selection, T_Right_Square_Bracket);
                  Skip_Tokens (T_Semicolon);
                  return No_Node;
               else
                  Range_Selection := Add_New_Range_Selection (Container,
                                                              First_Term,
                                                              Second_Term);

                  if No (Range_Selection) then
                     DPE (PC_Array_Selection);
                     Skip_Tokens (T_Semicolon);
                     return No_Node;
                  else
                     Append_Node_To_List (Range_Selection, Range_List);
                  end if;
               end if;
            end if;
         else
            Restore_Lexer (Loc);
            exit;
         end if;
      end loop;

      if Is_Empty (Range_List) then
         Range_List := No_List;
      end if;

      Array_Selection := Add_New_Array_Selection (Start_Loc,
                                                  Container,
                                                  Identifier,
                                                  Range_List);
      if No (Array_Selection) then
         DPE (PC_Array_Selection);
         Skip_Tokens (T_Semicolon);
         return No_Node;
      end if;

      return Array_Selection;

   end P_Array_Selection;

end Ocarina.FE_AADL.Parser.Components.Arrays;

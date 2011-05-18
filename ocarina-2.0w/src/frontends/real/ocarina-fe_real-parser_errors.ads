------------------------------------------------------------------------------
--                                                                          --
--                           OCARINA COMPONENTS                             --
--                                                                          --
--        O C A R I N A . F E _ R E A L . P A R S E R _ E R R O R S         --
--                                                                          --
--                                 S p e c                                  --
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

--  Primitives to display and handle errors in REAL parsing

with Ocarina.ME_REAL.Tokens; use Ocarina.ME_REAL.Tokens;

package Ocarina.FE_REAL.Parser_Errors is

   --  Parsing Codes

   type Parsing_Code is
     (PC_Main,
      PC_Theorem,
      PC_Function,
      PC_Set_Declarations,
      PC_Identifier_Declaration,
      PC_Create_Check_Expression,
      PC_Ternary_Expression,
      PC_Declarations_List,
      PC_Requirements_List,
      PC_Requirement_Definition,
      PC_Single_Set_Declaration,
      PC_Single_Variable_Declaration,
      PC_Create_Set_Identifier,
      PC_Make_Literal,
      PC_Check_Subprogram_Call,
      PC_Check_Expression,
      PC_Set_Expression);

   --  Error Message Code

   type Error_Message_Code is
     (EMC_Syntax_Error,
      EMC_Testing_Token_Expected,
      EMC_Used_Keyword,
      EMC_Declaration_Parameter,
      EMC_Wrong_List_Connector,
      EMC_Unexpected_Error,
      EMC_Variable_Declaration,
      EMC_Subtheorem_Parameter,
      EMC_Unexpected_Token,
      EMC_Expected_Literal_Value,
      EMC_Expected_Predefined_Function_Name,
      EMC_Expected_Valid_Function_Parameter,
      EMC_Cannot_Parse_Check_Expression,
      EMC_Cannot_Parse_Set_Expression,
      EMC_Expected_Valid_Operator,
      EMC_Unexpected_Operator,
      EMC_Non_Matching_Theorem_Name);

   procedure Display_Parsing_Error
     (Code      : Parsing_Code;
      Error_Msg : Error_Message_Code);
   procedure DPE (Code : Parsing_Code; Error_Msg : Error_Message_Code)
     renames Display_Parsing_Error;
   --  Display an output message:
   --     Location: parsing ..., <Msg>

   procedure Display_Parsing_Error (Code : Parsing_Code);
   procedure DPE (Code : Parsing_Code) renames Display_Parsing_Error;
   --  Display an output error message:
   --     Location: parsing ..., unexpected `Current_Token_Image`

   procedure Display_Parsing_Error (Code           : Parsing_Code;
                                    Expected_Token : Token_Type);
   procedure DPE (Code           : Parsing_Code;
                  Expected_Token : Token_Type) renames Display_Parsing_Error;
   --  Display an output error message:
   --     Location: parsing ..., token ... expected, found Current_Token_Image

   function Image (Code : Parsing_Code) return String;
   --  Return corresponding string of given parsing code

   function Image (Code : Error_Message_Code) return String;
   --  Return corresponding string of given error message code

   procedure Display_And_Exit (Str : String);

end Ocarina.FE_REAL.Parser_Errors;

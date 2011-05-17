------------------------------------------------------------------------------
--                                                                          --
--                           OCARINA COMPONENTS                             --
--                                                                          --
--                OCARINA.FE_AADL_BA.PARSER.THREAD_DISPATCH                 --
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

with Ocarina.FE_AADL_BA.Lexer;
with Ocarina.FE_AADL_BA.Parser.Identifiers;
with Ocarina.FE_AADL_BA.Parser.Expressions;

with Ocarina.ME_AADL_BA;
with Ocarina.ME_AADL_BA.Tokens;
with Ocarina.ME_AADL_BA.BA_Tree.Nutils;

with Ocarina.Builder.Aadl_Ba.Thread_Dispatch;

package body Ocarina.FE_AADL_BA.Parser.Thread_Dispatch is

   use Locations;
   use Ocarina.FE_AADL_BA.Lexer;
   use Ocarina.FE_AADL_BA.Parser.Identifiers;
   use Ocarina.FE_AADL_BA.Parser.Expressions;

   use Ocarina.ME_AADL_BA;
   use Ocarina.ME_AADL_BA.Tokens;
   use Ocarina.ME_AADL_BA.BA_Tree.Nutils;

   use Ocarina.Builder.Aadl_Ba.Thread_Dispatch;

   function P_Dispatch_Trigger
     (Container : Types.Node_Id)
    return Node_Id;

   function P_Dispatch_Trigger_Conjunction
     (Container : Types.Node_Id;
      Start_Loc : Location)
     return Node_Id;

   --------------------------
   -- P_Dispatch_Condition --
   --------------------------

   --  dispatch_condition ::=
   --    on dispatch dispatch_logical_expression [ frozen frozen_ports ]

   --  dispatch_logical_expression ::=
   --    dispatch_trigger { or dispatch_trigger }*

   function P_Dispatch_Condition (Container : Types.Node_Id)
     return Node_Id
   is
      Start_Loc             : Location;
      Loc                   : Location;

      Frozen_Port_List      : List_Id   := No_List;
      Dispatch_Logical_List : List_Id;
      Dispatch_Condition    : Node_Id;
   begin
      Save_Lexer (Start_Loc);
      Scan_Token;  -- consume T_On

      Dispatch_Condition := Add_New_Dispatch_Condition (Start_Loc,
                                                        Container,
                                                        No_List,
                                                        No_List);

      if No (Dispatch_Condition) then
         DPE (PC_Dispatch_Condition, EMC_Failed);
         Skip_Tokens (T_Semicolon);
         return No_Node;
      end if;

      Scan_Token;
      if Token /= T_Dispatch then
         Restore_Lexer (Start_Loc);
         DPE (PC_Dispatch_Condition,
              Expected_Token => T_Dispatch);
         Skip_Tokens (T_Semicolon);
         return No_Node;
      end if;

      Dispatch_Logical_List := P_Items_List (P_Dispatch_Trigger'Access,
                                             Dispatch_Condition,
                                             T_Or);

      if Is_Empty (Dispatch_Logical_List) then
         DPE (PC_Dispatch_Condition, EMC_List_Is_Empty);
         Skip_Tokens (T_Semicolon);
         return No_Node;
      end if;

      Save_Lexer (Loc);
      Scan_Token;
      if Token = T_Frozen then
         Frozen_Port_List := P_Items_List (P_Identifier'Access,
                                           Dispatch_Condition,
                                           T_Comma);

         if Is_Empty (Frozen_Port_List) then
            DPE (PC_Dispatch_Condition, EMC_List_Is_Empty);
            Skip_Tokens (T_Semicolon);
            return No_Node;
         end if;
      else
         Restore_Lexer (Loc);
      end if;

      Add_New_Dispatch_Condition (Dispatch_Condition,
                                  Container,
                                  Dispatch_Logical_List,
                                  Frozen_Port_List);

      return Dispatch_Condition;
   end P_Dispatch_Condition;

   ------------------------
   -- P_Dispatch_Trigger --
   ------------------------

   --  dispatch_trigger ::=
   --    dispatch_trigger_conjunction
   --  | timeout [ behavior_time ]
   --  | stop
   --  | abort

   function P_Dispatch_Trigger (Container : Types.Node_Id)
    return Node_Id
   is
      Start_Loc             : Location;
      Loc                   : Location;
      Dispatch_Trigger_Node : Node_Id;
      Behavior_Time         : Node_Id                := No_Node;
      Trigger_Conjunction   : Node_Id                := No_Node;
      Trig_Kind             : Dispatch_Trigger_Kind;
   begin
      Save_Lexer (Start_Loc);

      Scan_Token;
      case Token is
         when T_Timeout =>
            Trig_Kind := TRI_Timeout;

            Save_Lexer (Loc);
            Scan_Token;
            if Token = T_Real_Literal
              or else Token = T_Integer_Literal
            then
               Restore_Lexer (Loc);
               Behavior_Time := P_Behavior_Time (No_Node);

               if No (Behavior_Time) then
                  DPE (PC_Dispatch_Trigger, EMC_Failed);
                  Skip_Tokens (T_Semicolon);
                  return No_Node;
               end if;
            else
               Restore_Lexer (Loc);
            end if;

         when T_Stop =>
            Trig_Kind := TRI_Stop;

         when T_Abort =>
            Trig_Kind := TRI_Abort;

         when T_Identifier
           | T_Integer_Literal
           | T_Real_Literal
           | T_Left_Parenthesis =>
            Trig_Kind := TRI_No_Kind;

            Trigger_Conjunction := P_Dispatch_Trigger_Conjunction (No_Node,
                                                                   Start_Loc);
            if No (Trigger_Conjunction) then
               DPE (PC_Dispatch_Trigger,
                    EMC_Trigger_Conjunction_Failed);
               Skip_Tokens (T_Semicolon);
               return No_Node;
            end if;

         when others =>
            Restore_Lexer (Start_Loc);
            DPE (PC_Dispatch_Trigger,
                 Expected_Tokens => (T_Timeout, T_Stop,
                                     T_Abort, T_Identifier));
            Skip_Tokens (T_Semicolon);
            return No_Node;
      end case;

      Dispatch_Trigger_Node := Add_New_Dispatch_Trigger (Start_Loc,
                                                         Container,
                                                         Trig_Kind,
                                                         Trigger_Conjunction,
                                                         Behavior_Time);

      if No (Dispatch_Trigger_Node) then
         DPE (PC_Dispatch_Trigger, EMC_Failed);
         Skip_Tokens (T_Semicolon);
         return No_Node;
      else
         return Dispatch_Trigger_Node;
      end if;

   end P_Dispatch_Trigger;

   ------------------------------------
   -- P_Dispatch_Trigger_Conjunction --
   ------------------------------------

   --  dispatch_trigger_conjunction ::=
   --    dispatch_trigger_event         --  fixme add in 2.9 todo
   --    ( dispatch_trigger_event { and dispatch_trigger_event } * )
   --  | numeral [ ormore | orless ]
   --      ( dispatch_trigger_event { , dispatch_trigger_event } * )

   --  dispatch_trigger_event ::=
   --    in_event_port_identifier
   --  | in_event_data_port_identifier
   --  | in_event_data_port_identifier ( ( value_constant | others ) )
   --  | provides_subprogram_access_identifier

   function P_Dispatch_Trigger_Conjunction
     (Container : Types.Node_Id;
      Start_Loc : Location)
     return Node_Id
   is
      Loc            : Location;
      Numeral        : Node_Id  := No_Node;
      Trigger_Conj   : Node_Id;
      Trigger_Event  : Node_Id  := No_Node;
      Trigger_Events : List_Id  := No_List;
      Has_Numeral    : Boolean  := False;
      Is_Ormore      : Boolean  := False;
      Is_Orless      : Boolean  := False;
   begin
      Restore_Lexer (Start_Loc);
      Scan_Token;

      if Token = T_Integer_Literal
        or else Token = T_Real_Literal
      then
         Restore_Lexer (Start_Loc);
         Has_Numeral := True;
         Numeral := P_Integer_Value (No_Node);

         if not Has_Numeral then
            DPE (PC_Dispatch_Trigger_Conjunction,
                 EMC_Numeral_Failed);
            Skip_Tokens (T_Semicolon);
            return No_Node;
         end if;

         Save_Lexer (Loc);
         Scan_Token;

         if Token = T_Ormore then
            Is_Ormore := True;
         elsif Token = T_Orless then
            Is_Orless := True;
         else
            Restore_Lexer (Loc);
         end if;
      else
         Restore_Lexer (Start_Loc);
      end if;

      Save_Lexer (Loc);
      Scan_Token;

      if Token = T_Identifier then
         Restore_Lexer (Loc);
         Trigger_Event := P_Identifier_With_Value (No_Node);

         if No (Trigger_Event) then
            DPE (PC_Dispatch_Trigger_Conjunction, EMC_Failed);
            Skip_Tokens (T_Semicolon);
            return No_Node;
         end if;

      elsif Token = T_Left_Parenthesis then
         Save_Lexer (Loc);
         Scan_Token;

         if Token /= T_Identifier then
            DPE (PC_Dispatch_Trigger_Conjunction,
                 Expected_Token => T_Identifier);
            Skip_Tokens (T_Semicolon);
            return No_Node;
         else
            Restore_Lexer (Loc);

            if not Has_Numeral then
               Trigger_Events := P_Items_List (P_Identifier_With_Value'Access,
                                               No_Node,
                                               T_And);
            else
               Trigger_Events := P_Items_List (P_Identifier_With_Value'Access,
                                               No_Node,
                                               T_Comma);
            end if;

            if Is_Empty (Trigger_Events) then
               DPE (PC_Dispatch_Trigger_Event,
                    EMC_List_Is_Empty);
               Skip_Tokens (T_Semicolon);
               return No_Node;
            end if;
         end if;

         Scan_Token;
         if Token /= T_Right_Parenthesis then
            DPE (PC_Dispatch_Trigger_Conjunction,
                 Expected_Token => T_Right_Parenthesis);
            Skip_Tokens (T_Semicolon);
            return No_Node;
         end if;

      else
         DPE (PC_Dispatch_Trigger_Conjunction,
              Expected_Tokens => (T_Left_Parenthesis, T_Identifier));
         Skip_Tokens (T_Semicolon);
         return No_Node;
      end if;

      Trigger_Conj := Add_New_Dispatch_Trigger_Conjunction (Start_Loc,
                                                            Container,
                                                            Trigger_Event,
                                                            Trigger_Events,
                                                            Numeral,
                                                            Is_Ormore,
                                                            Is_Orless);
      if No (Trigger_Conj) then
         DPE (PC_Dispatch_Trigger_Event, EMC_Failed);
         Skip_Tokens (T_Semicolon);
         return No_Node;
      else
         return Trigger_Conj;
      end if;

   end P_Dispatch_Trigger_Conjunction;

end Ocarina.FE_AADL_BA.Parser.Thread_Dispatch;

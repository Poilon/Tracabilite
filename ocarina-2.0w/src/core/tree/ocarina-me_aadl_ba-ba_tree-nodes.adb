pragma Style_Checks ("NM32766");

--  This file has been generated automatically by `mknodes'. Do not
--  hand modify this file since your changes will be overridden.

with Ocarina.ME_AADL_BA.BA_Tree.Debug; use Ocarina.ME_AADL_BA.BA_Tree.Debug;

package body Ocarina.ME_AADL_BA.BA_Tree.Nodes is

   pragma Warnings (Off);
   use Entries;

   function Kind (N : Node_Id) return Node_Kind is
   begin
      return Table (Types.Node_Id (N)).Kind;
   end Kind;

   procedure Set_Kind (N : Node_Id; V : Node_Kind) is
   begin
      Table (Types.Node_Id (N)).Kind := V;
   end Set_Kind;

   function Loc (N : Node_Id) return Location is
   begin
      return Table (Types.Node_Id (N)).Loc;
   end Loc;

   procedure Set_Loc (N : Node_Id; V : Location) is
   begin
      Table (Types.Node_Id (N)).Loc := V;
   end Set_Loc;

   function Next_Node (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Node_Id
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Entity
        or else Table (Types.Node_Id (N)).Kind = K_Named_Behavior_Entity
        or else Table (Types.Node_Id (N)).Kind = K_Identifier
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Annex
        or else Table (Types.Node_Id (N)).Kind = K_Component_Classifier_Ref
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Variable
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_State
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Transition
        or else Table (Types.Node_Id (N)).Kind = K_Execution_Behavior_Transition
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Condition
        or else Table (Types.Node_Id (N)).Kind = K_Mode_Transition
        or else Table (Types.Node_Id (N)).Kind = K_Dispatch_Condition
        or else Table (Types.Node_Id (N)).Kind = K_Dispatch_Trigger
        or else Table (Types.Node_Id (N)).Kind = K_Dispatch_Trigger_Conjunction
        or else Table (Types.Node_Id (N)).Kind = K_Identifier_With_Value
        or else Table (Types.Node_Id (N)).Kind = K_Logical_Expression
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Action
        or else Table (Types.Node_Id (N)).Kind = K_Conditional_Statement
        or else Table (Types.Node_Id (N)).Kind = K_If_Cond_Struct
        or else Table (Types.Node_Id (N)).Kind = K_For_Cond_Struct
        or else Table (Types.Node_Id (N)).Kind = K_While_Cond_Struct
        or else Table (Types.Node_Id (N)).Kind = K_Range
        or else Table (Types.Node_Id (N)).Kind = K_Assignment_Action
        or else Table (Types.Node_Id (N)).Kind = K_Communication_Action
        or else Table (Types.Node_Id (N)).Kind = K_Timed_Action
        or else Table (Types.Node_Id (N)).Kind = K_Parameter_Label
        or else Table (Types.Node_Id (N)).Kind = K_Data_Component_Reference
        or else Table (Types.Node_Id (N)).Kind = K_Id
        or else Table (Types.Node_Id (N)).Kind = K_Value_Holder
        or else Table (Types.Node_Id (N)).Kind = K_Value_Expression
        or else Table (Types.Node_Id (N)).Kind = K_Relation
        or else Table (Types.Node_Id (N)).Kind = K_Simple_Expression
        or else Table (Types.Node_Id (N)).Kind = K_Term
        or else Table (Types.Node_Id (N)).Kind = K_Factor
        or else Table (Types.Node_Id (N)).Kind = K_Property_Constant
        or else Table (Types.Node_Id (N)).Kind = K_Operator
        or else Table (Types.Node_Id (N)).Kind = K_Boolean_Literal
        or else Table (Types.Node_Id (N)).Kind = K_Integer_Range
        or else Table (Types.Node_Id (N)).Kind = K_Integer_Value
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Time
        or else Table (Types.Node_Id (N)).Kind = K_Literal);

      return Node_Id (Table (Types.Node_Id (N)).L (4));
   end Next_Node;

   procedure Set_Next_Node (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Node_Id
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Entity
        or else Table (Types.Node_Id (N)).Kind = K_Named_Behavior_Entity
        or else Table (Types.Node_Id (N)).Kind = K_Identifier
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Annex
        or else Table (Types.Node_Id (N)).Kind = K_Component_Classifier_Ref
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Variable
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_State
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Transition
        or else Table (Types.Node_Id (N)).Kind = K_Execution_Behavior_Transition
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Condition
        or else Table (Types.Node_Id (N)).Kind = K_Mode_Transition
        or else Table (Types.Node_Id (N)).Kind = K_Dispatch_Condition
        or else Table (Types.Node_Id (N)).Kind = K_Dispatch_Trigger
        or else Table (Types.Node_Id (N)).Kind = K_Dispatch_Trigger_Conjunction
        or else Table (Types.Node_Id (N)).Kind = K_Identifier_With_Value
        or else Table (Types.Node_Id (N)).Kind = K_Logical_Expression
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Action
        or else Table (Types.Node_Id (N)).Kind = K_Conditional_Statement
        or else Table (Types.Node_Id (N)).Kind = K_If_Cond_Struct
        or else Table (Types.Node_Id (N)).Kind = K_For_Cond_Struct
        or else Table (Types.Node_Id (N)).Kind = K_While_Cond_Struct
        or else Table (Types.Node_Id (N)).Kind = K_Range
        or else Table (Types.Node_Id (N)).Kind = K_Assignment_Action
        or else Table (Types.Node_Id (N)).Kind = K_Communication_Action
        or else Table (Types.Node_Id (N)).Kind = K_Timed_Action
        or else Table (Types.Node_Id (N)).Kind = K_Parameter_Label
        or else Table (Types.Node_Id (N)).Kind = K_Data_Component_Reference
        or else Table (Types.Node_Id (N)).Kind = K_Id
        or else Table (Types.Node_Id (N)).Kind = K_Value_Holder
        or else Table (Types.Node_Id (N)).Kind = K_Value_Expression
        or else Table (Types.Node_Id (N)).Kind = K_Relation
        or else Table (Types.Node_Id (N)).Kind = K_Simple_Expression
        or else Table (Types.Node_Id (N)).Kind = K_Term
        or else Table (Types.Node_Id (N)).Kind = K_Factor
        or else Table (Types.Node_Id (N)).Kind = K_Property_Constant
        or else Table (Types.Node_Id (N)).Kind = K_Operator
        or else Table (Types.Node_Id (N)).Kind = K_Boolean_Literal
        or else Table (Types.Node_Id (N)).Kind = K_Integer_Range
        or else Table (Types.Node_Id (N)).Kind = K_Integer_Value
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Time
        or else Table (Types.Node_Id (N)).Kind = K_Literal);

      Table (Types.Node_Id (N)).L (4) := Int (V);
   end Set_Next_Node;

   function First_Node (N : List_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_List_Id);

      return Node_Id (Table (Types.Node_Id (N)).L (1));
   end First_Node;

   procedure Set_First_Node (N : List_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_List_Id);

      Table (Types.Node_Id (N)).L (1) := Int (V);
   end Set_First_Node;

   function Last_Node (N : List_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_List_Id);

      return Node_Id (Table (Types.Node_Id (N)).L (2));
   end Last_Node;

   procedure Set_Last_Node (N : List_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_List_Id);

      Table (Types.Node_Id (N)).L (2) := Int (V);
   end Set_Last_Node;

   function BE_Container (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Entity
        or else Table (Types.Node_Id (N)).Kind = K_Named_Behavior_Entity
        or else Table (Types.Node_Id (N)).Kind = K_Identifier
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Annex
        or else Table (Types.Node_Id (N)).Kind = K_Component_Classifier_Ref
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Variable
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_State
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Transition
        or else Table (Types.Node_Id (N)).Kind = K_Execution_Behavior_Transition
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Condition
        or else Table (Types.Node_Id (N)).Kind = K_Mode_Transition
        or else Table (Types.Node_Id (N)).Kind = K_Dispatch_Condition
        or else Table (Types.Node_Id (N)).Kind = K_Dispatch_Trigger
        or else Table (Types.Node_Id (N)).Kind = K_Dispatch_Trigger_Conjunction
        or else Table (Types.Node_Id (N)).Kind = K_Identifier_With_Value
        or else Table (Types.Node_Id (N)).Kind = K_Logical_Expression
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Action
        or else Table (Types.Node_Id (N)).Kind = K_Conditional_Statement
        or else Table (Types.Node_Id (N)).Kind = K_If_Cond_Struct
        or else Table (Types.Node_Id (N)).Kind = K_For_Cond_Struct
        or else Table (Types.Node_Id (N)).Kind = K_While_Cond_Struct
        or else Table (Types.Node_Id (N)).Kind = K_Range
        or else Table (Types.Node_Id (N)).Kind = K_Assignment_Action
        or else Table (Types.Node_Id (N)).Kind = K_Communication_Action
        or else Table (Types.Node_Id (N)).Kind = K_Timed_Action
        or else Table (Types.Node_Id (N)).Kind = K_Parameter_Label
        or else Table (Types.Node_Id (N)).Kind = K_Data_Component_Reference
        or else Table (Types.Node_Id (N)).Kind = K_Id
        or else Table (Types.Node_Id (N)).Kind = K_Value_Holder
        or else Table (Types.Node_Id (N)).Kind = K_Value_Expression
        or else Table (Types.Node_Id (N)).Kind = K_Relation
        or else Table (Types.Node_Id (N)).Kind = K_Simple_Expression
        or else Table (Types.Node_Id (N)).Kind = K_Term
        or else Table (Types.Node_Id (N)).Kind = K_Factor
        or else Table (Types.Node_Id (N)).Kind = K_Property_Constant
        or else Table (Types.Node_Id (N)).Kind = K_Operator
        or else Table (Types.Node_Id (N)).Kind = K_Integer_Range
        or else Table (Types.Node_Id (N)).Kind = K_Integer_Value
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Time
        or else Table (Types.Node_Id (N)).Kind = K_Literal);

      return Node_Id (Table (Types.Node_Id (N)).L (5));
   end BE_Container;

   procedure Set_BE_Container (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Entity
        or else Table (Types.Node_Id (N)).Kind = K_Named_Behavior_Entity
        or else Table (Types.Node_Id (N)).Kind = K_Identifier
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Annex
        or else Table (Types.Node_Id (N)).Kind = K_Component_Classifier_Ref
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Variable
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_State
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Transition
        or else Table (Types.Node_Id (N)).Kind = K_Execution_Behavior_Transition
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Condition
        or else Table (Types.Node_Id (N)).Kind = K_Mode_Transition
        or else Table (Types.Node_Id (N)).Kind = K_Dispatch_Condition
        or else Table (Types.Node_Id (N)).Kind = K_Dispatch_Trigger
        or else Table (Types.Node_Id (N)).Kind = K_Dispatch_Trigger_Conjunction
        or else Table (Types.Node_Id (N)).Kind = K_Identifier_With_Value
        or else Table (Types.Node_Id (N)).Kind = K_Logical_Expression
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Action
        or else Table (Types.Node_Id (N)).Kind = K_Conditional_Statement
        or else Table (Types.Node_Id (N)).Kind = K_If_Cond_Struct
        or else Table (Types.Node_Id (N)).Kind = K_For_Cond_Struct
        or else Table (Types.Node_Id (N)).Kind = K_While_Cond_Struct
        or else Table (Types.Node_Id (N)).Kind = K_Range
        or else Table (Types.Node_Id (N)).Kind = K_Assignment_Action
        or else Table (Types.Node_Id (N)).Kind = K_Communication_Action
        or else Table (Types.Node_Id (N)).Kind = K_Timed_Action
        or else Table (Types.Node_Id (N)).Kind = K_Parameter_Label
        or else Table (Types.Node_Id (N)).Kind = K_Data_Component_Reference
        or else Table (Types.Node_Id (N)).Kind = K_Id
        or else Table (Types.Node_Id (N)).Kind = K_Value_Holder
        or else Table (Types.Node_Id (N)).Kind = K_Value_Expression
        or else Table (Types.Node_Id (N)).Kind = K_Relation
        or else Table (Types.Node_Id (N)).Kind = K_Simple_Expression
        or else Table (Types.Node_Id (N)).Kind = K_Term
        or else Table (Types.Node_Id (N)).Kind = K_Factor
        or else Table (Types.Node_Id (N)).Kind = K_Property_Constant
        or else Table (Types.Node_Id (N)).Kind = K_Operator
        or else Table (Types.Node_Id (N)).Kind = K_Integer_Range
        or else Table (Types.Node_Id (N)).Kind = K_Integer_Value
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Time
        or else Table (Types.Node_Id (N)).Kind = K_Literal);

      Table (Types.Node_Id (N)).L (5) := Int (V);
   end Set_BE_Container;

   function Next_Entity (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Entity
        or else Table (Types.Node_Id (N)).Kind = K_Named_Behavior_Entity
        or else Table (Types.Node_Id (N)).Kind = K_Identifier
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Annex
        or else Table (Types.Node_Id (N)).Kind = K_Component_Classifier_Ref
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Variable
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_State
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Transition
        or else Table (Types.Node_Id (N)).Kind = K_Execution_Behavior_Transition
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Condition
        or else Table (Types.Node_Id (N)).Kind = K_Mode_Transition
        or else Table (Types.Node_Id (N)).Kind = K_Dispatch_Condition
        or else Table (Types.Node_Id (N)).Kind = K_Dispatch_Trigger
        or else Table (Types.Node_Id (N)).Kind = K_Dispatch_Trigger_Conjunction
        or else Table (Types.Node_Id (N)).Kind = K_Identifier_With_Value
        or else Table (Types.Node_Id (N)).Kind = K_Logical_Expression
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Action
        or else Table (Types.Node_Id (N)).Kind = K_Conditional_Statement
        or else Table (Types.Node_Id (N)).Kind = K_If_Cond_Struct
        or else Table (Types.Node_Id (N)).Kind = K_For_Cond_Struct
        or else Table (Types.Node_Id (N)).Kind = K_While_Cond_Struct
        or else Table (Types.Node_Id (N)).Kind = K_Range
        or else Table (Types.Node_Id (N)).Kind = K_Assignment_Action
        or else Table (Types.Node_Id (N)).Kind = K_Communication_Action
        or else Table (Types.Node_Id (N)).Kind = K_Timed_Action
        or else Table (Types.Node_Id (N)).Kind = K_Parameter_Label
        or else Table (Types.Node_Id (N)).Kind = K_Data_Component_Reference
        or else Table (Types.Node_Id (N)).Kind = K_Id
        or else Table (Types.Node_Id (N)).Kind = K_Value_Holder
        or else Table (Types.Node_Id (N)).Kind = K_Value_Expression
        or else Table (Types.Node_Id (N)).Kind = K_Relation
        or else Table (Types.Node_Id (N)).Kind = K_Simple_Expression
        or else Table (Types.Node_Id (N)).Kind = K_Term
        or else Table (Types.Node_Id (N)).Kind = K_Factor
        or else Table (Types.Node_Id (N)).Kind = K_Property_Constant
        or else Table (Types.Node_Id (N)).Kind = K_Operator
        or else Table (Types.Node_Id (N)).Kind = K_Integer_Range
        or else Table (Types.Node_Id (N)).Kind = K_Integer_Value
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Time
        or else Table (Types.Node_Id (N)).Kind = K_Literal);

      return Node_Id (Table (Types.Node_Id (N)).L (6));
   end Next_Entity;

   procedure Set_Next_Entity (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Entity
        or else Table (Types.Node_Id (N)).Kind = K_Named_Behavior_Entity
        or else Table (Types.Node_Id (N)).Kind = K_Identifier
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Annex
        or else Table (Types.Node_Id (N)).Kind = K_Component_Classifier_Ref
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Variable
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_State
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Transition
        or else Table (Types.Node_Id (N)).Kind = K_Execution_Behavior_Transition
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Condition
        or else Table (Types.Node_Id (N)).Kind = K_Mode_Transition
        or else Table (Types.Node_Id (N)).Kind = K_Dispatch_Condition
        or else Table (Types.Node_Id (N)).Kind = K_Dispatch_Trigger
        or else Table (Types.Node_Id (N)).Kind = K_Dispatch_Trigger_Conjunction
        or else Table (Types.Node_Id (N)).Kind = K_Identifier_With_Value
        or else Table (Types.Node_Id (N)).Kind = K_Logical_Expression
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Action
        or else Table (Types.Node_Id (N)).Kind = K_Conditional_Statement
        or else Table (Types.Node_Id (N)).Kind = K_If_Cond_Struct
        or else Table (Types.Node_Id (N)).Kind = K_For_Cond_Struct
        or else Table (Types.Node_Id (N)).Kind = K_While_Cond_Struct
        or else Table (Types.Node_Id (N)).Kind = K_Range
        or else Table (Types.Node_Id (N)).Kind = K_Assignment_Action
        or else Table (Types.Node_Id (N)).Kind = K_Communication_Action
        or else Table (Types.Node_Id (N)).Kind = K_Timed_Action
        or else Table (Types.Node_Id (N)).Kind = K_Parameter_Label
        or else Table (Types.Node_Id (N)).Kind = K_Data_Component_Reference
        or else Table (Types.Node_Id (N)).Kind = K_Id
        or else Table (Types.Node_Id (N)).Kind = K_Value_Holder
        or else Table (Types.Node_Id (N)).Kind = K_Value_Expression
        or else Table (Types.Node_Id (N)).Kind = K_Relation
        or else Table (Types.Node_Id (N)).Kind = K_Simple_Expression
        or else Table (Types.Node_Id (N)).Kind = K_Term
        or else Table (Types.Node_Id (N)).Kind = K_Factor
        or else Table (Types.Node_Id (N)).Kind = K_Property_Constant
        or else Table (Types.Node_Id (N)).Kind = K_Operator
        or else Table (Types.Node_Id (N)).Kind = K_Integer_Range
        or else Table (Types.Node_Id (N)).Kind = K_Integer_Value
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Time
        or else Table (Types.Node_Id (N)).Kind = K_Literal);

      Table (Types.Node_Id (N)).L (6) := Int (V);
   end Set_Next_Entity;

   function Identifier (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Named_Behavior_Entity
        or else Table (Types.Node_Id (N)).Kind = K_Communication_Action
        or else Table (Types.Node_Id (N)).Kind = K_Id
        or else Table (Types.Node_Id (N)).Kind = K_Value_Holder
        or else Table (Types.Node_Id (N)).Kind = K_Property_Constant);

      return Node_Id (Table (Types.Node_Id (N)).L (7));
   end Identifier;

   procedure Set_Identifier (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Named_Behavior_Entity
        or else Table (Types.Node_Id (N)).Kind = K_Communication_Action
        or else Table (Types.Node_Id (N)).Kind = K_Id
        or else Table (Types.Node_Id (N)).Kind = K_Value_Holder
        or else Table (Types.Node_Id (N)).Kind = K_Property_Constant);

      Table (Types.Node_Id (N)).L (7) := Int (V);
   end Set_Identifier;

   function Name (N : Node_Id) return Name_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Identifier
        or else Table (Types.Node_Id (N)).Kind = K_Identifier_With_Value);

      return Name_Id (Table (Types.Node_Id (N)).L (2));
   end Name;

   procedure Set_Name (N : Node_Id; V : Name_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Identifier
        or else Table (Types.Node_Id (N)).Kind = K_Identifier_With_Value);

      Table (Types.Node_Id (N)).L (2) := Int (V);
   end Set_Name;

   function Display_Name (N : Node_Id) return Name_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Identifier
        or else Table (Types.Node_Id (N)).Kind = K_Identifier_With_Value);

      return Name_Id (Table (Types.Node_Id (N)).L (3));
   end Display_Name;

   procedure Set_Display_Name (N : Node_Id; V : Name_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Identifier
        or else Table (Types.Node_Id (N)).Kind = K_Identifier_With_Value);

      Table (Types.Node_Id (N)).L (3) := Int (V);
   end Set_Display_Name;

   function Corresponding_Entity (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Identifier
        or else Table (Types.Node_Id (N)).Kind = K_Identifier_With_Value);

      return Node_Id (Table (Types.Node_Id (N)).L (7));
   end Corresponding_Entity;

   procedure Set_Corresponding_Entity (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Identifier
        or else Table (Types.Node_Id (N)).Kind = K_Identifier_With_Value);

      Table (Types.Node_Id (N)).L (7) := Int (V);
   end Set_Corresponding_Entity;

   function Scope_Entity (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Identifier
        or else Table (Types.Node_Id (N)).Kind = K_Identifier_With_Value);

      return Node_Id (Table (Types.Node_Id (N)).L (8));
   end Scope_Entity;

   procedure Set_Scope_Entity (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Identifier
        or else Table (Types.Node_Id (N)).Kind = K_Identifier_With_Value);

      Table (Types.Node_Id (N)).L (8) := Int (V);
   end Set_Scope_Entity;

   function Homonym (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Identifier
        or else Table (Types.Node_Id (N)).Kind = K_Identifier_With_Value);

      return Node_Id (Table (Types.Node_Id (N)).L (9));
   end Homonym;

   procedure Set_Homonym (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Identifier
        or else Table (Types.Node_Id (N)).Kind = K_Identifier_With_Value);

      Table (Types.Node_Id (N)).L (9) := Int (V);
   end Set_Homonym;

   function Variables (N : Node_Id) return List_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Annex);

      return List_Id (Table (Types.Node_Id (N)).L (1));
   end Variables;

   procedure Set_Variables (N : Node_Id; V : List_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Annex);

      Table (Types.Node_Id (N)).L (1) := Int (V);
   end Set_Variables;

   function States (N : Node_Id) return List_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Annex);

      return List_Id (Table (Types.Node_Id (N)).L (2));
   end States;

   procedure Set_States (N : Node_Id; V : List_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Annex);

      Table (Types.Node_Id (N)).L (2) := Int (V);
   end Set_States;

   function Transitions (N : Node_Id) return List_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Annex);

      return List_Id (Table (Types.Node_Id (N)).L (3));
   end Transitions;

   procedure Set_Transitions (N : Node_Id; V : List_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Annex);

      Table (Types.Node_Id (N)).L (3) := Int (V);
   end Set_Transitions;

   function Package_Name (N : Node_Id) return List_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Component_Classifier_Ref);

      return List_Id (Table (Types.Node_Id (N)).L (1));
   end Package_Name;

   procedure Set_Package_Name (N : Node_Id; V : List_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Component_Classifier_Ref);

      Table (Types.Node_Id (N)).L (1) := Int (V);
   end Set_Package_Name;

   function Component_Type (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Component_Classifier_Ref);

      return Node_Id (Table (Types.Node_Id (N)).L (2));
   end Component_Type;

   procedure Set_Component_Type (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Component_Classifier_Ref);

      Table (Types.Node_Id (N)).L (2) := Int (V);
   end Set_Component_Type;

   function Component_Impl (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Component_Classifier_Ref);

      return Node_Id (Table (Types.Node_Id (N)).L (3));
   end Component_Impl;

   procedure Set_Component_Impl (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Component_Classifier_Ref);

      Table (Types.Node_Id (N)).L (3) := Int (V);
   end Set_Component_Impl;

   function Full_Identifier (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Component_Classifier_Ref);

      return Node_Id (Table (Types.Node_Id (N)).L (7));
   end Full_Identifier;

   procedure Set_Full_Identifier (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Component_Classifier_Ref);

      Table (Types.Node_Id (N)).L (7) := Int (V);
   end Set_Full_Identifier;

   function Identifiers (N : Node_Id) return List_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Variable
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_State
        or else Table (Types.Node_Id (N)).Kind = K_Data_Component_Reference);

      return List_Id (Table (Types.Node_Id (N)).L (2));
   end Identifiers;

   procedure Set_Identifiers (N : Node_Id; V : List_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Variable
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_State
        or else Table (Types.Node_Id (N)).Kind = K_Data_Component_Reference);

      Table (Types.Node_Id (N)).L (2) := Int (V);
   end Set_Identifiers;

   function Classifier_Ref (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Variable);

      return Node_Id (Table (Types.Node_Id (N)).L (1));
   end Classifier_Ref;

   procedure Set_Classifier_Ref (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Variable);

      Table (Types.Node_Id (N)).L (1) := Int (V);
   end Set_Classifier_Ref;

   function State_Kind (N : Node_Id) return Byte is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_State);

      return Byte (Table (Types.Node_Id (N)).O (1));
   end State_Kind;

   procedure Set_State_Kind (N : Node_Id; V : Byte) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_State);

      Table (Types.Node_Id (N)).O (1) := Byte (V);
   end Set_State_Kind;

   function Transition (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Transition);

      return Node_Id (Table (Types.Node_Id (N)).L (1));
   end Transition;

   procedure Set_Transition (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Transition);

      Table (Types.Node_Id (N)).L (1) := Int (V);
   end Set_Transition;

   function Sources (N : Node_Id) return List_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Execution_Behavior_Transition);

      return List_Id (Table (Types.Node_Id (N)).L (1));
   end Sources;

   procedure Set_Sources (N : Node_Id; V : List_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Execution_Behavior_Transition);

      Table (Types.Node_Id (N)).L (1) := Int (V);
   end Set_Sources;

   function Destination (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Execution_Behavior_Transition
        or else Table (Types.Node_Id (N)).Kind = K_Mode_Transition);

      return Node_Id (Table (Types.Node_Id (N)).L (2));
   end Destination;

   procedure Set_Destination (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Execution_Behavior_Transition
        or else Table (Types.Node_Id (N)).Kind = K_Mode_Transition);

      Table (Types.Node_Id (N)).L (2) := Int (V);
   end Set_Destination;

   function Behavior_Condition (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Execution_Behavior_Transition);

      return Node_Id (Table (Types.Node_Id (N)).L (3));
   end Behavior_Condition;

   procedure Set_Behavior_Condition (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Execution_Behavior_Transition);

      Table (Types.Node_Id (N)).L (3) := Int (V);
   end Set_Behavior_Condition;

   function Behavior_Actions (N : Node_Id) return List_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Execution_Behavior_Transition
        or else Table (Types.Node_Id (N)).Kind = K_Mode_Transition
        or else Table (Types.Node_Id (N)).Kind = K_Conditional_Statement
        or else Table (Types.Node_Id (N)).Kind = K_For_Cond_Struct);

      return List_Id (Table (Types.Node_Id (N)).L (7));
   end Behavior_Actions;

   procedure Set_Behavior_Actions (N : Node_Id; V : List_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Execution_Behavior_Transition
        or else Table (Types.Node_Id (N)).Kind = K_Mode_Transition
        or else Table (Types.Node_Id (N)).Kind = K_Conditional_Statement
        or else Table (Types.Node_Id (N)).Kind = K_For_Cond_Struct);

      Table (Types.Node_Id (N)).L (7) := Int (V);
   end Set_Behavior_Actions;

   function Behavior_Transition_Idt (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Execution_Behavior_Transition);

      return Node_Id (Table (Types.Node_Id (N)).L (8));
   end Behavior_Transition_Idt;

   procedure Set_Behavior_Transition_Idt (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Execution_Behavior_Transition);

      Table (Types.Node_Id (N)).L (8) := Int (V);
   end Set_Behavior_Transition_Idt;

   function Behavior_Transition_Priority (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Execution_Behavior_Transition);

      return Node_Id (Table (Types.Node_Id (N)).L (9));
   end Behavior_Transition_Priority;

   procedure Set_Behavior_Transition_Priority (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Execution_Behavior_Transition);

      Table (Types.Node_Id (N)).L (9) := Int (V);
   end Set_Behavior_Transition_Priority;

   function Condition (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Condition);

      return Node_Id (Table (Types.Node_Id (N)).L (1));
   end Condition;

   procedure Set_Condition (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Condition);

      Table (Types.Node_Id (N)).L (1) := Int (V);
   end Set_Condition;

   function Source (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Mode_Transition);

      return Node_Id (Table (Types.Node_Id (N)).L (1));
   end Source;

   procedure Set_Source (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Mode_Transition);

      Table (Types.Node_Id (N)).L (1) := Int (V);
   end Set_Source;

   function Mode_Transition_Condition (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Mode_Transition);

      return Node_Id (Table (Types.Node_Id (N)).L (3));
   end Mode_Transition_Condition;

   procedure Set_Mode_Transition_Condition (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Mode_Transition);

      Table (Types.Node_Id (N)).L (3) := Int (V);
   end Set_Mode_Transition_Condition;

   function Dispatch_Logical_Expressions (N : Node_Id) return List_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Dispatch_Condition);

      return List_Id (Table (Types.Node_Id (N)).L (1));
   end Dispatch_Logical_Expressions;

   procedure Set_Dispatch_Logical_Expressions (N : Node_Id; V : List_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Dispatch_Condition);

      Table (Types.Node_Id (N)).L (1) := Int (V);
   end Set_Dispatch_Logical_Expressions;

   function Frozen_Ports (N : Node_Id) return List_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Dispatch_Condition);

      return List_Id (Table (Types.Node_Id (N)).L (2));
   end Frozen_Ports;

   procedure Set_Frozen_Ports (N : Node_Id; V : List_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Dispatch_Condition);

      Table (Types.Node_Id (N)).L (2) := Int (V);
   end Set_Frozen_Ports;

   function Dispatch_Trigger_Conjunction (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Dispatch_Trigger);

      return Node_Id (Table (Types.Node_Id (N)).L (2));
   end Dispatch_Trigger_Conjunction;

   procedure Set_Dispatch_Trigger_Conjunction (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Dispatch_Trigger);

      Table (Types.Node_Id (N)).L (2) := Int (V);
   end Set_Dispatch_Trigger_Conjunction;

   function Trigger_Kind (N : Node_Id) return Byte is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Dispatch_Trigger);

      return Byte (Table (Types.Node_Id (N)).O (1));
   end Trigger_Kind;

   procedure Set_Trigger_Kind (N : Node_Id; V : Byte) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Dispatch_Trigger);

      Table (Types.Node_Id (N)).O (1) := Byte (V);
   end Set_Trigger_Kind;

   function Behavior_Time (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Dispatch_Trigger);

      return Node_Id (Table (Types.Node_Id (N)).L (3));
   end Behavior_Time;

   procedure Set_Behavior_Time (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Dispatch_Trigger);

      Table (Types.Node_Id (N)).L (3) := Int (V);
   end Set_Behavior_Time;

   function Dispatch_Trigger_Event (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Dispatch_Trigger_Conjunction);

      return Node_Id (Table (Types.Node_Id (N)).L (3));
   end Dispatch_Trigger_Event;

   procedure Set_Dispatch_Trigger_Event (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Dispatch_Trigger_Conjunction);

      Table (Types.Node_Id (N)).L (3) := Int (V);
   end Set_Dispatch_Trigger_Event;

   function Dispatch_Trigger_Events (N : Node_Id) return List_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Dispatch_Trigger_Conjunction);

      return List_Id (Table (Types.Node_Id (N)).L (7));
   end Dispatch_Trigger_Events;

   procedure Set_Dispatch_Trigger_Events (N : Node_Id; V : List_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Dispatch_Trigger_Conjunction);

      Table (Types.Node_Id (N)).L (7) := Int (V);
   end Set_Dispatch_Trigger_Events;

   function Numeral (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Dispatch_Trigger_Conjunction);

      return Node_Id (Table (Types.Node_Id (N)).L (8));
   end Numeral;

   procedure Set_Numeral (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Dispatch_Trigger_Conjunction);

      Table (Types.Node_Id (N)).L (8) := Int (V);
   end Set_Numeral;

   function Is_Ormore (N : Node_Id) return Boolean is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Dispatch_Trigger_Conjunction);

      return Boolean (Table (Types.Node_Id (N)).B (1));
   end Is_Ormore;

   procedure Set_Is_Ormore (N : Node_Id; V : Boolean) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Dispatch_Trigger_Conjunction);

      Table (Types.Node_Id (N)).B (1) := Boolean (V);
   end Set_Is_Ormore;

   function Is_Orless (N : Node_Id) return Boolean is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Dispatch_Trigger_Conjunction);

      return Boolean (Table (Types.Node_Id (N)).B (2));
   end Is_Orless;

   procedure Set_Is_Orless (N : Node_Id; V : Boolean) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Dispatch_Trigger_Conjunction);

      Table (Types.Node_Id (N)).B (2) := Boolean (V);
   end Set_Is_Orless;

   function Is_Others (N : Node_Id) return Boolean is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Identifier_With_Value);

      return Boolean (Table (Types.Node_Id (N)).B (1));
   end Is_Others;

   procedure Set_Is_Others (N : Node_Id; V : Boolean) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Identifier_With_Value);

      Table (Types.Node_Id (N)).B (1) := Boolean (V);
   end Set_Is_Others;

   function Value_Constant (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Identifier_With_Value);

      return Node_Id (Table (Types.Node_Id (N)).L (10));
   end Value_Constant;

   procedure Set_Value_Constant (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Identifier_With_Value);

      Table (Types.Node_Id (N)).L (10) := Int (V);
   end Set_Value_Constant;

   function Action (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Action);

      return Node_Id (Table (Types.Node_Id (N)).L (1));
   end Action;

   procedure Set_Action (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Action);

      Table (Types.Node_Id (N)).L (1) := Int (V);
   end Set_Action;

   function Logical_Expr (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Conditional_Statement);

      return Node_Id (Table (Types.Node_Id (N)).L (1));
   end Logical_Expr;

   procedure Set_Logical_Expr (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Conditional_Statement);

      Table (Types.Node_Id (N)).L (1) := Int (V);
   end Set_Logical_Expr;

   function If_Statement (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_If_Cond_Struct);

      return Node_Id (Table (Types.Node_Id (N)).L (1));
   end If_Statement;

   procedure Set_If_Statement (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_If_Cond_Struct);

      Table (Types.Node_Id (N)).L (1) := Int (V);
   end Set_If_Statement;

   function Elsif_Statement (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_If_Cond_Struct);

      return Node_Id (Table (Types.Node_Id (N)).L (2));
   end Elsif_Statement;

   procedure Set_Elsif_Statement (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_If_Cond_Struct);

      Table (Types.Node_Id (N)).L (2) := Int (V);
   end Set_Elsif_Statement;

   function Else_Statement (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_If_Cond_Struct);

      return Node_Id (Table (Types.Node_Id (N)).L (3));
   end Else_Statement;

   procedure Set_Else_Statement (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_If_Cond_Struct);

      Table (Types.Node_Id (N)).L (3) := Int (V);
   end Set_Else_Statement;

   function Var_Identifier (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_For_Cond_Struct);

      return Node_Id (Table (Types.Node_Id (N)).L (1));
   end Var_Identifier;

   procedure Set_Var_Identifier (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_For_Cond_Struct);

      Table (Types.Node_Id (N)).L (1) := Int (V);
   end Set_Var_Identifier;

   function In_Range (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_For_Cond_Struct);

      return Node_Id (Table (Types.Node_Id (N)).L (2));
   end In_Range;

   procedure Set_In_Range (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_For_Cond_Struct);

      Table (Types.Node_Id (N)).L (2) := Int (V);
   end Set_In_Range;

   function While_Statement (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_While_Cond_Struct);

      return Node_Id (Table (Types.Node_Id (N)).L (1));
   end While_Statement;

   procedure Set_While_Statement (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_While_Cond_Struct);

      Table (Types.Node_Id (N)).L (1) := Int (V);
   end Set_While_Statement;

   function Entity (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Range
        or else Table (Types.Node_Id (N)).Kind = K_Integer_Value);

      return Node_Id (Table (Types.Node_Id (N)).L (1));
   end Entity;

   procedure Set_Entity (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Range
        or else Table (Types.Node_Id (N)).Kind = K_Integer_Value);

      Table (Types.Node_Id (N)).L (1) := Int (V);
   end Set_Entity;

   function Target (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Assignment_Action
        or else Table (Types.Node_Id (N)).Kind = K_Communication_Action
        or else Table (Types.Node_Id (N)).Kind = K_Value_Holder);

      return Node_Id (Table (Types.Node_Id (N)).L (8));
   end Target;

   procedure Set_Target (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Assignment_Action
        or else Table (Types.Node_Id (N)).Kind = K_Communication_Action
        or else Table (Types.Node_Id (N)).Kind = K_Value_Holder);

      Table (Types.Node_Id (N)).L (8) := Int (V);
   end Set_Target;

   function Value_Expression (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Assignment_Action);

      return Node_Id (Table (Types.Node_Id (N)).L (2));
   end Value_Expression;

   procedure Set_Value_Expression (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Assignment_Action);

      Table (Types.Node_Id (N)).L (2) := Int (V);
   end Set_Value_Expression;

   function Is_Any (N : Node_Id) return Boolean is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Assignment_Action);

      return Boolean (Table (Types.Node_Id (N)).B (1));
   end Is_Any;

   procedure Set_Is_Any (N : Node_Id; V : Boolean) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Assignment_Action);

      Table (Types.Node_Id (N)).B (1) := Boolean (V);
   end Set_Is_Any;

   function Subprogram_Parameter_List (N : Node_Id) return List_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Communication_Action);

      return List_Id (Table (Types.Node_Id (N)).L (2));
   end Subprogram_Parameter_List;

   procedure Set_Subprogram_Parameter_List (N : Node_Id; V : List_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Communication_Action);

      Table (Types.Node_Id (N)).L (2) := Int (V);
   end Set_Subprogram_Parameter_List;

   function Comm_Kind (N : Node_Id) return Byte is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Communication_Action);

      return Byte (Table (Types.Node_Id (N)).O (1));
   end Comm_Kind;

   procedure Set_Comm_Kind (N : Node_Id; V : Byte) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Communication_Action);

      Table (Types.Node_Id (N)).O (1) := Byte (V);
   end Set_Comm_Kind;

   function Is_Computation (N : Node_Id) return Boolean is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Timed_Action);

      return Boolean (Table (Types.Node_Id (N)).B (1));
   end Is_Computation;

   procedure Set_Is_Computation (N : Node_Id; V : Boolean) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Timed_Action);

      Table (Types.Node_Id (N)).B (1) := Boolean (V);
   end Set_Is_Computation;

   function Fst_Behavior_Time (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Timed_Action);

      return Node_Id (Table (Types.Node_Id (N)).L (3));
   end Fst_Behavior_Time;

   procedure Set_Fst_Behavior_Time (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Timed_Action);

      Table (Types.Node_Id (N)).L (3) := Int (V);
   end Set_Fst_Behavior_Time;

   function Scd_Behavior_Time (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Timed_Action);

      return Node_Id (Table (Types.Node_Id (N)).L (7));
   end Scd_Behavior_Time;

   procedure Set_Scd_Behavior_Time (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Timed_Action);

      Table (Types.Node_Id (N)).L (7) := Int (V);
   end Set_Scd_Behavior_Time;

   function Distrib_Kind (N : Node_Id) return Byte is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Timed_Action);

      return Byte (Table (Types.Node_Id (N)).O (2));
   end Distrib_Kind;

   procedure Set_Distrib_Kind (N : Node_Id; V : Byte) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Timed_Action);

      Table (Types.Node_Id (N)).O (2) := Byte (V);
   end Set_Distrib_Kind;

   function Parameter (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Parameter_Label);

      return Node_Id (Table (Types.Node_Id (N)).L (1));
   end Parameter;

   procedure Set_Parameter (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Parameter_Label);

      Table (Types.Node_Id (N)).L (1) := Int (V);
   end Set_Parameter;

   function Int_Value_Holder (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Id);

      return Node_Id (Table (Types.Node_Id (N)).L (1));
   end Int_Value_Holder;

   procedure Set_Int_Value_Holder (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Id);

      Table (Types.Node_Id (N)).L (1) := Int (V);
   end Set_Int_Value_Holder;

   function Is_Count (N : Node_Id) return Boolean is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Value_Holder);

      return Boolean (Table (Types.Node_Id (N)).B (1));
   end Is_Count;

   procedure Set_Is_Count (N : Node_Id; V : Boolean) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Value_Holder);

      Table (Types.Node_Id (N)).B (1) := Boolean (V);
   end Set_Is_Count;

   function Is_Fresh (N : Node_Id) return Boolean is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Value_Holder);

      return Boolean (Table (Types.Node_Id (N)).B (2));
   end Is_Fresh;

   procedure Set_Is_Fresh (N : Node_Id; V : Boolean) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Value_Holder);

      Table (Types.Node_Id (N)).B (2) := Boolean (V);
   end Set_Is_Fresh;

   function Is_Interrogative (N : Node_Id) return Boolean is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Value_Holder);

      return Boolean (Table (Types.Node_Id (N)).B (3));
   end Is_Interrogative;

   procedure Set_Is_Interrogative (N : Node_Id; V : Boolean) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Value_Holder);

      Table (Types.Node_Id (N)).B (3) := Boolean (V);
   end Set_Is_Interrogative;

   function Relations (N : Node_Id) return List_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Value_Expression);

      return List_Id (Table (Types.Node_Id (N)).L (1));
   end Relations;

   procedure Set_Relations (N : Node_Id; V : List_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Value_Expression);

      Table (Types.Node_Id (N)).L (1) := Int (V);
   end Set_Relations;

   function Boolean_Value (N : Node_Id) return Boolean is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Relation);

      return Boolean (Table (Types.Node_Id (N)).B (1));
   end Boolean_Value;

   procedure Set_Boolean_Value (N : Node_Id; V : Boolean) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Relation);

      Table (Types.Node_Id (N)).B (1) := Boolean (V);
   end Set_Boolean_Value;

   function Simple_Exprs (N : Node_Id) return List_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Relation);

      return List_Id (Table (Types.Node_Id (N)).L (2));
   end Simple_Exprs;

   procedure Set_Simple_Exprs (N : Node_Id; V : List_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Relation);

      Table (Types.Node_Id (N)).L (2) := Int (V);
   end Set_Simple_Exprs;

   function Term_And_Operator (N : Node_Id) return List_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Simple_Expression);

      return List_Id (Table (Types.Node_Id (N)).L (1));
   end Term_And_Operator;

   procedure Set_Term_And_Operator (N : Node_Id; V : List_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Simple_Expression);

      Table (Types.Node_Id (N)).L (1) := Int (V);
   end Set_Term_And_Operator;

   function Factors (N : Node_Id) return List_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Term);

      return List_Id (Table (Types.Node_Id (N)).L (1));
   end Factors;

   procedure Set_Factors (N : Node_Id; V : List_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Term);

      Table (Types.Node_Id (N)).L (1) := Int (V);
   end Set_Factors;

   function Is_Abs (N : Node_Id) return Boolean is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Factor);

      return Boolean (Table (Types.Node_Id (N)).B (1));
   end Is_Abs;

   procedure Set_Is_Abs (N : Node_Id; V : Boolean) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Factor);

      Table (Types.Node_Id (N)).B (1) := Boolean (V);
   end Set_Is_Abs;

   function Is_Not (N : Node_Id) return Boolean is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Factor);

      return Boolean (Table (Types.Node_Id (N)).B (2));
   end Is_Not;

   procedure Set_Is_Not (N : Node_Id; V : Boolean) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Factor);

      Table (Types.Node_Id (N)).B (2) := Boolean (V);
   end Set_Is_Not;

   function Lower_Primary (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Factor);

      return Node_Id (Table (Types.Node_Id (N)).L (3));
   end Lower_Primary;

   procedure Set_Lower_Primary (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Factor);

      Table (Types.Node_Id (N)).L (3) := Int (V);
   end Set_Lower_Primary;

   function Upper_Primary (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Factor);

      return Node_Id (Table (Types.Node_Id (N)).L (7));
   end Upper_Primary;

   procedure Set_Upper_Primary (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Factor);

      Table (Types.Node_Id (N)).L (7) := Int (V);
   end Set_Upper_Primary;

   function Property_Set (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Property_Constant);

      return Node_Id (Table (Types.Node_Id (N)).L (1));
   end Property_Set;

   procedure Set_Property_Set (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Property_Constant);

      Table (Types.Node_Id (N)).L (1) := Int (V);
   end Set_Property_Set;

   function Operator_Category (N : Node_Id) return Byte is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Operator);

      return Byte (Table (Types.Node_Id (N)).O (1));
   end Operator_Category;

   procedure Set_Operator_Category (N : Node_Id; V : Byte) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Operator);

      Table (Types.Node_Id (N)).O (1) := Byte (V);
   end Set_Operator_Category;

   function Is_True (N : Node_Id) return Boolean is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Boolean_Literal);

      return Boolean (Table (Types.Node_Id (N)).B (1));
   end Is_True;

   procedure Set_Is_True (N : Node_Id; V : Boolean) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Boolean_Literal);

      Table (Types.Node_Id (N)).B (1) := Boolean (V);
   end Set_Is_True;

   function Lower_Int_Val (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Integer_Range);

      return Node_Id (Table (Types.Node_Id (N)).L (1));
   end Lower_Int_Val;

   procedure Set_Lower_Int_Val (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Integer_Range);

      Table (Types.Node_Id (N)).L (1) := Int (V);
   end Set_Lower_Int_Val;

   function Upper_Int_Val (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Integer_Range);

      return Node_Id (Table (Types.Node_Id (N)).L (2));
   end Upper_Int_Val;

   procedure Set_Upper_Int_Val (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Integer_Range);

      Table (Types.Node_Id (N)).L (2) := Int (V);
   end Set_Upper_Int_Val;

   function Integer_Value (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Time);

      return Node_Id (Table (Types.Node_Id (N)).L (1));
   end Integer_Value;

   procedure Set_Integer_Value (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Time);

      Table (Types.Node_Id (N)).L (1) := Int (V);
   end Set_Integer_Value;

   function Unit_Identifier (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Time);

      return Node_Id (Table (Types.Node_Id (N)).L (2));
   end Unit_Identifier;

   procedure Set_Unit_Identifier (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Behavior_Time);

      Table (Types.Node_Id (N)).L (2) := Int (V);
   end Set_Unit_Identifier;

   function Value (N : Node_Id) return Value_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Literal);

      return Value_Id (Table (Types.Node_Id (N)).L (1));
   end Value;

   procedure Set_Value (N : Node_Id; V : Value_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Literal);

      Table (Types.Node_Id (N)).L (1) := Int (V);
   end Set_Value;

   procedure W_Node (N : Node_Id) is
   begin
      case Kind (N) is
         when K_Behavior_Entity =>
            W_Behavior_Entity
              (Node_Id (N));
         when K_Named_Behavior_Entity =>
            W_Named_Behavior_Entity
              (Node_Id (N));
         when K_Identifier =>
            W_Identifier
              (Node_Id (N));
         when K_Behavior_Annex =>
            W_Behavior_Annex
              (Node_Id (N));
         when K_Component_Classifier_Ref =>
            W_Component_Classifier_Ref
              (Node_Id (N));
         when K_Behavior_Variable =>
            W_Behavior_Variable
              (Node_Id (N));
         when K_Behavior_State =>
            W_Behavior_State
              (Node_Id (N));
         when K_Behavior_Transition =>
            W_Behavior_Transition
              (Node_Id (N));
         when K_Execution_Behavior_Transition =>
            W_Execution_Behavior_Transition
              (Node_Id (N));
         when K_Behavior_Condition =>
            W_Behavior_Condition
              (Node_Id (N));
         when K_Mode_Transition =>
            W_Mode_Transition
              (Node_Id (N));
         when K_Dispatch_Condition =>
            W_Dispatch_Condition
              (Node_Id (N));
         when K_Dispatch_Trigger =>
            W_Dispatch_Trigger
              (Node_Id (N));
         when K_Dispatch_Trigger_Conjunction =>
            W_Dispatch_Trigger_Conjunction
              (Node_Id (N));
         when K_Identifier_With_Value =>
            W_Identifier_With_Value
              (Node_Id (N));
         when K_Logical_Expression =>
            W_Logical_Expression
              (Node_Id (N));
         when K_Behavior_Action =>
            W_Behavior_Action
              (Node_Id (N));
         when K_Conditional_Statement =>
            W_Conditional_Statement
              (Node_Id (N));
         when K_If_Cond_Struct =>
            W_If_Cond_Struct
              (Node_Id (N));
         when K_For_Cond_Struct =>
            W_For_Cond_Struct
              (Node_Id (N));
         when K_While_Cond_Struct =>
            W_While_Cond_Struct
              (Node_Id (N));
         when K_Range =>
            W_Range
              (Node_Id (N));
         when K_Assignment_Action =>
            W_Assignment_Action
              (Node_Id (N));
         when K_Communication_Action =>
            W_Communication_Action
              (Node_Id (N));
         when K_Timed_Action =>
            W_Timed_Action
              (Node_Id (N));
         when K_Parameter_Label =>
            W_Parameter_Label
              (Node_Id (N));
         when K_Data_Component_Reference =>
            W_Data_Component_Reference
              (Node_Id (N));
         when K_Id =>
            W_Id
              (Node_Id (N));
         when K_Value_Holder =>
            W_Value_Holder
              (Node_Id (N));
         when K_Value_Expression =>
            W_Value_Expression
              (Node_Id (N));
         when K_Relation =>
            W_Relation
              (Node_Id (N));
         when K_Simple_Expression =>
            W_Simple_Expression
              (Node_Id (N));
         when K_Term =>
            W_Term
              (Node_Id (N));
         when K_Factor =>
            W_Factor
              (Node_Id (N));
         when K_Property_Constant =>
            W_Property_Constant
              (Node_Id (N));
         when K_Operator =>
            W_Operator
              (Node_Id (N));
         when K_Boolean_Literal =>
            W_Boolean_Literal
              (Node_Id (N));
         when K_Integer_Range =>
            W_Integer_Range
              (Node_Id (N));
         when K_Integer_Value =>
            W_Integer_Value
              (Node_Id (N));
         when K_Behavior_Time =>
            W_Behavior_Time
              (Node_Id (N));
         when K_Literal =>
            W_Literal
              (Node_Id (N));
         when others =>
            null;
      end case;
   end W_Node;

   procedure W_Behavior_Entity (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("BE_Container",
         "Node_Id",
         Image (BE_Container (N)),
         Int (BE_Container (N)));
      W_Node_Attribute
        ("Next_Entity",
         "Node_Id",
         Image (Next_Entity (N)),
         Int (Next_Entity (N)));
   end W_Behavior_Entity;

   procedure W_Named_Behavior_Entity (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("BE_Container",
         "Node_Id",
         Image (BE_Container (N)),
         Int (BE_Container (N)));
      W_Node_Attribute
        ("Next_Entity",
         "Node_Id",
         Image (Next_Entity (N)),
         Int (Next_Entity (N)));
      W_Node_Attribute
        ("Identifier",
         "Node_Id",
         Image (Identifier (N)),
         Int (Identifier (N)));
   end W_Named_Behavior_Entity;

   procedure W_Identifier (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("BE_Container",
         "Node_Id",
         Image (BE_Container (N)),
         Int (BE_Container (N)));
      W_Node_Attribute
        ("Next_Entity",
         "Node_Id",
         Image (Next_Entity (N)),
         Int (Next_Entity (N)));
      W_Node_Attribute
        ("Name",
         "Name_Id",
         Image (Name (N)));
      W_Node_Attribute
        ("Display_Name",
         "Name_Id",
         Image (Display_Name (N)));
      W_Node_Attribute
        ("Corresponding_Entity",
         "Node_Id",
         Image (Corresponding_Entity (N)),
         Int (Corresponding_Entity (N)));
      W_Node_Attribute
        ("Scope_Entity",
         "Node_Id",
         Image (Scope_Entity (N)),
         Int (Scope_Entity (N)));
      W_Node_Attribute
        ("Homonym",
         "Node_Id",
         Image (Homonym (N)),
         Int (Homonym (N)));
   end W_Identifier;

   procedure W_Behavior_Annex (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("BE_Container",
         "Node_Id",
         Image (BE_Container (N)),
         Int (BE_Container (N)));
      W_Node_Attribute
        ("Next_Entity",
         "Node_Id",
         Image (Next_Entity (N)),
         Int (Next_Entity (N)));
      W_Node_Attribute
        ("Variables",
         "List_Id",
         Image (Variables (N)),
         Int (Variables (N)));
      W_Node_Attribute
        ("States",
         "List_Id",
         Image (States (N)),
         Int (States (N)));
      W_Node_Attribute
        ("Transitions",
         "List_Id",
         Image (Transitions (N)),
         Int (Transitions (N)));
   end W_Behavior_Annex;

   procedure W_Component_Classifier_Ref (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("BE_Container",
         "Node_Id",
         Image (BE_Container (N)),
         Int (BE_Container (N)));
      W_Node_Attribute
        ("Next_Entity",
         "Node_Id",
         Image (Next_Entity (N)),
         Int (Next_Entity (N)));
      W_Node_Attribute
        ("Package_Name",
         "List_Id",
         Image (Package_Name (N)),
         Int (Package_Name (N)));
      W_Node_Attribute
        ("Component_Type",
         "Node_Id",
         Image (Component_Type (N)),
         Int (Component_Type (N)));
      W_Node_Attribute
        ("Component_Impl",
         "Node_Id",
         Image (Component_Impl (N)),
         Int (Component_Impl (N)));
      W_Node_Attribute
        ("Full_Identifier",
         "Node_Id",
         Image (Full_Identifier (N)),
         Int (Full_Identifier (N)));
   end W_Component_Classifier_Ref;

   procedure W_Behavior_Variable (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("BE_Container",
         "Node_Id",
         Image (BE_Container (N)),
         Int (BE_Container (N)));
      W_Node_Attribute
        ("Next_Entity",
         "Node_Id",
         Image (Next_Entity (N)),
         Int (Next_Entity (N)));
      W_Node_Attribute
        ("Identifiers",
         "List_Id",
         Image (Identifiers (N)),
         Int (Identifiers (N)));
      W_Node_Attribute
        ("Classifier_Ref",
         "Node_Id",
         Image (Classifier_Ref (N)),
         Int (Classifier_Ref (N)));
   end W_Behavior_Variable;

   procedure W_Behavior_State (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("BE_Container",
         "Node_Id",
         Image (BE_Container (N)),
         Int (BE_Container (N)));
      W_Node_Attribute
        ("Next_Entity",
         "Node_Id",
         Image (Next_Entity (N)),
         Int (Next_Entity (N)));
      W_Node_Attribute
        ("Identifiers",
         "List_Id",
         Image (Identifiers (N)),
         Int (Identifiers (N)));
      W_Node_Attribute
        ("State_Kind",
         "Byte",
         Image (State_Kind (N)));
   end W_Behavior_State;

   procedure W_Behavior_Transition (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("BE_Container",
         "Node_Id",
         Image (BE_Container (N)),
         Int (BE_Container (N)));
      W_Node_Attribute
        ("Next_Entity",
         "Node_Id",
         Image (Next_Entity (N)),
         Int (Next_Entity (N)));
      W_Node_Attribute
        ("Transition",
         "Node_Id",
         Image (Transition (N)),
         Int (Transition (N)));
   end W_Behavior_Transition;

   procedure W_Execution_Behavior_Transition (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("BE_Container",
         "Node_Id",
         Image (BE_Container (N)),
         Int (BE_Container (N)));
      W_Node_Attribute
        ("Next_Entity",
         "Node_Id",
         Image (Next_Entity (N)),
         Int (Next_Entity (N)));
      W_Node_Attribute
        ("Sources",
         "List_Id",
         Image (Sources (N)),
         Int (Sources (N)));
      W_Node_Attribute
        ("Destination",
         "Node_Id",
         Image (Destination (N)),
         Int (Destination (N)));
      W_Node_Attribute
        ("Behavior_Condition",
         "Node_Id",
         Image (Behavior_Condition (N)),
         Int (Behavior_Condition (N)));
      W_Node_Attribute
        ("Behavior_Actions",
         "List_Id",
         Image (Behavior_Actions (N)),
         Int (Behavior_Actions (N)));
      W_Node_Attribute
        ("Behavior_Transition_Idt",
         "Node_Id",
         Image (Behavior_Transition_Idt (N)),
         Int (Behavior_Transition_Idt (N)));
      W_Node_Attribute
        ("Behavior_Transition_Priority",
         "Node_Id",
         Image (Behavior_Transition_Priority (N)),
         Int (Behavior_Transition_Priority (N)));
   end W_Execution_Behavior_Transition;

   procedure W_Behavior_Condition (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("BE_Container",
         "Node_Id",
         Image (BE_Container (N)),
         Int (BE_Container (N)));
      W_Node_Attribute
        ("Next_Entity",
         "Node_Id",
         Image (Next_Entity (N)),
         Int (Next_Entity (N)));
      W_Node_Attribute
        ("Condition",
         "Node_Id",
         Image (Condition (N)),
         Int (Condition (N)));
   end W_Behavior_Condition;

   procedure W_Mode_Transition (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("BE_Container",
         "Node_Id",
         Image (BE_Container (N)),
         Int (BE_Container (N)));
      W_Node_Attribute
        ("Next_Entity",
         "Node_Id",
         Image (Next_Entity (N)),
         Int (Next_Entity (N)));
      W_Node_Attribute
        ("Destination",
         "Node_Id",
         Image (Destination (N)),
         Int (Destination (N)));
      W_Node_Attribute
        ("Behavior_Actions",
         "List_Id",
         Image (Behavior_Actions (N)),
         Int (Behavior_Actions (N)));
      W_Node_Attribute
        ("Source",
         "Node_Id",
         Image (Source (N)),
         Int (Source (N)));
      W_Node_Attribute
        ("Mode_Transition_Condition",
         "Node_Id",
         Image (Mode_Transition_Condition (N)),
         Int (Mode_Transition_Condition (N)));
   end W_Mode_Transition;

   procedure W_Dispatch_Condition (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("BE_Container",
         "Node_Id",
         Image (BE_Container (N)),
         Int (BE_Container (N)));
      W_Node_Attribute
        ("Next_Entity",
         "Node_Id",
         Image (Next_Entity (N)),
         Int (Next_Entity (N)));
      W_Node_Attribute
        ("Dispatch_Logical_Expressions",
         "List_Id",
         Image (Dispatch_Logical_Expressions (N)),
         Int (Dispatch_Logical_Expressions (N)));
      W_Node_Attribute
        ("Frozen_Ports",
         "List_Id",
         Image (Frozen_Ports (N)),
         Int (Frozen_Ports (N)));
   end W_Dispatch_Condition;

   procedure W_Dispatch_Trigger (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("BE_Container",
         "Node_Id",
         Image (BE_Container (N)),
         Int (BE_Container (N)));
      W_Node_Attribute
        ("Next_Entity",
         "Node_Id",
         Image (Next_Entity (N)),
         Int (Next_Entity (N)));
      W_Node_Attribute
        ("Dispatch_Trigger_Conjunction",
         "Node_Id",
         Image (Dispatch_Trigger_Conjunction (N)),
         Int (Dispatch_Trigger_Conjunction (N)));
      W_Node_Attribute
        ("Trigger_Kind",
         "Byte",
         Image (Trigger_Kind (N)));
      W_Node_Attribute
        ("Behavior_Time",
         "Node_Id",
         Image (Behavior_Time (N)),
         Int (Behavior_Time (N)));
   end W_Dispatch_Trigger;

   procedure W_Dispatch_Trigger_Conjunction (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("BE_Container",
         "Node_Id",
         Image (BE_Container (N)),
         Int (BE_Container (N)));
      W_Node_Attribute
        ("Next_Entity",
         "Node_Id",
         Image (Next_Entity (N)),
         Int (Next_Entity (N)));
      W_Node_Attribute
        ("Dispatch_Trigger_Event",
         "Node_Id",
         Image (Dispatch_Trigger_Event (N)),
         Int (Dispatch_Trigger_Event (N)));
      W_Node_Attribute
        ("Dispatch_Trigger_Events",
         "List_Id",
         Image (Dispatch_Trigger_Events (N)),
         Int (Dispatch_Trigger_Events (N)));
      W_Node_Attribute
        ("Numeral",
         "Node_Id",
         Image (Numeral (N)),
         Int (Numeral (N)));
      W_Node_Attribute
        ("Is_Ormore",
         "Boolean",
         Image (Is_Ormore (N)));
      W_Node_Attribute
        ("Is_Orless",
         "Boolean",
         Image (Is_Orless (N)));
   end W_Dispatch_Trigger_Conjunction;

   procedure W_Identifier_With_Value (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("BE_Container",
         "Node_Id",
         Image (BE_Container (N)),
         Int (BE_Container (N)));
      W_Node_Attribute
        ("Next_Entity",
         "Node_Id",
         Image (Next_Entity (N)),
         Int (Next_Entity (N)));
      W_Node_Attribute
        ("Name",
         "Name_Id",
         Image (Name (N)));
      W_Node_Attribute
        ("Display_Name",
         "Name_Id",
         Image (Display_Name (N)));
      W_Node_Attribute
        ("Corresponding_Entity",
         "Node_Id",
         Image (Corresponding_Entity (N)),
         Int (Corresponding_Entity (N)));
      W_Node_Attribute
        ("Scope_Entity",
         "Node_Id",
         Image (Scope_Entity (N)),
         Int (Scope_Entity (N)));
      W_Node_Attribute
        ("Homonym",
         "Node_Id",
         Image (Homonym (N)),
         Int (Homonym (N)));
      W_Node_Attribute
        ("Is_Others",
         "Boolean",
         Image (Is_Others (N)));
      W_Node_Attribute
        ("Value_Constant",
         "Node_Id",
         Image (Value_Constant (N)),
         Int (Value_Constant (N)));
   end W_Identifier_With_Value;

   procedure W_Logical_Expression (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("BE_Container",
         "Node_Id",
         Image (BE_Container (N)),
         Int (BE_Container (N)));
      W_Node_Attribute
        ("Next_Entity",
         "Node_Id",
         Image (Next_Entity (N)),
         Int (Next_Entity (N)));
   end W_Logical_Expression;

   procedure W_Behavior_Action (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("BE_Container",
         "Node_Id",
         Image (BE_Container (N)),
         Int (BE_Container (N)));
      W_Node_Attribute
        ("Next_Entity",
         "Node_Id",
         Image (Next_Entity (N)),
         Int (Next_Entity (N)));
      W_Node_Attribute
        ("Action",
         "Node_Id",
         Image (Action (N)),
         Int (Action (N)));
   end W_Behavior_Action;

   procedure W_Conditional_Statement (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("BE_Container",
         "Node_Id",
         Image (BE_Container (N)),
         Int (BE_Container (N)));
      W_Node_Attribute
        ("Next_Entity",
         "Node_Id",
         Image (Next_Entity (N)),
         Int (Next_Entity (N)));
      W_Node_Attribute
        ("Behavior_Actions",
         "List_Id",
         Image (Behavior_Actions (N)),
         Int (Behavior_Actions (N)));
      W_Node_Attribute
        ("Logical_Expr",
         "Node_Id",
         Image (Logical_Expr (N)),
         Int (Logical_Expr (N)));
   end W_Conditional_Statement;

   procedure W_If_Cond_Struct (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("BE_Container",
         "Node_Id",
         Image (BE_Container (N)),
         Int (BE_Container (N)));
      W_Node_Attribute
        ("Next_Entity",
         "Node_Id",
         Image (Next_Entity (N)),
         Int (Next_Entity (N)));
      W_Node_Attribute
        ("If_Statement",
         "Node_Id",
         Image (If_Statement (N)),
         Int (If_Statement (N)));
      W_Node_Attribute
        ("Elsif_Statement",
         "Node_Id",
         Image (Elsif_Statement (N)),
         Int (Elsif_Statement (N)));
      W_Node_Attribute
        ("Else_Statement",
         "Node_Id",
         Image (Else_Statement (N)),
         Int (Else_Statement (N)));
   end W_If_Cond_Struct;

   procedure W_For_Cond_Struct (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("BE_Container",
         "Node_Id",
         Image (BE_Container (N)),
         Int (BE_Container (N)));
      W_Node_Attribute
        ("Next_Entity",
         "Node_Id",
         Image (Next_Entity (N)),
         Int (Next_Entity (N)));
      W_Node_Attribute
        ("Behavior_Actions",
         "List_Id",
         Image (Behavior_Actions (N)),
         Int (Behavior_Actions (N)));
      W_Node_Attribute
        ("Var_Identifier",
         "Node_Id",
         Image (Var_Identifier (N)),
         Int (Var_Identifier (N)));
      W_Node_Attribute
        ("In_Range",
         "Node_Id",
         Image (In_Range (N)),
         Int (In_Range (N)));
   end W_For_Cond_Struct;

   procedure W_While_Cond_Struct (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("BE_Container",
         "Node_Id",
         Image (BE_Container (N)),
         Int (BE_Container (N)));
      W_Node_Attribute
        ("Next_Entity",
         "Node_Id",
         Image (Next_Entity (N)),
         Int (Next_Entity (N)));
      W_Node_Attribute
        ("While_Statement",
         "Node_Id",
         Image (While_Statement (N)),
         Int (While_Statement (N)));
   end W_While_Cond_Struct;

   procedure W_Range (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("BE_Container",
         "Node_Id",
         Image (BE_Container (N)),
         Int (BE_Container (N)));
      W_Node_Attribute
        ("Next_Entity",
         "Node_Id",
         Image (Next_Entity (N)),
         Int (Next_Entity (N)));
      W_Node_Attribute
        ("Entity",
         "Node_Id",
         Image (Entity (N)),
         Int (Entity (N)));
   end W_Range;

   procedure W_Assignment_Action (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("BE_Container",
         "Node_Id",
         Image (BE_Container (N)),
         Int (BE_Container (N)));
      W_Node_Attribute
        ("Next_Entity",
         "Node_Id",
         Image (Next_Entity (N)),
         Int (Next_Entity (N)));
      W_Node_Attribute
        ("Target",
         "Node_Id",
         Image (Target (N)),
         Int (Target (N)));
      W_Node_Attribute
        ("Value_Expression",
         "Node_Id",
         Image (Value_Expression (N)),
         Int (Value_Expression (N)));
      W_Node_Attribute
        ("Is_Any",
         "Boolean",
         Image (Is_Any (N)));
   end W_Assignment_Action;

   procedure W_Communication_Action (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("BE_Container",
         "Node_Id",
         Image (BE_Container (N)),
         Int (BE_Container (N)));
      W_Node_Attribute
        ("Next_Entity",
         "Node_Id",
         Image (Next_Entity (N)),
         Int (Next_Entity (N)));
      W_Node_Attribute
        ("Identifier",
         "Node_Id",
         Image (Identifier (N)),
         Int (Identifier (N)));
      W_Node_Attribute
        ("Target",
         "Node_Id",
         Image (Target (N)),
         Int (Target (N)));
      W_Node_Attribute
        ("Subprogram_Parameter_List",
         "List_Id",
         Image (Subprogram_Parameter_List (N)),
         Int (Subprogram_Parameter_List (N)));
      W_Node_Attribute
        ("Comm_Kind",
         "Byte",
         Image (Comm_Kind (N)));
   end W_Communication_Action;

   procedure W_Timed_Action (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("BE_Container",
         "Node_Id",
         Image (BE_Container (N)),
         Int (BE_Container (N)));
      W_Node_Attribute
        ("Next_Entity",
         "Node_Id",
         Image (Next_Entity (N)),
         Int (Next_Entity (N)));
      W_Node_Attribute
        ("Is_Computation",
         "Boolean",
         Image (Is_Computation (N)));
      W_Node_Attribute
        ("Fst_Behavior_Time",
         "Node_Id",
         Image (Fst_Behavior_Time (N)),
         Int (Fst_Behavior_Time (N)));
      W_Node_Attribute
        ("Scd_Behavior_Time",
         "Node_Id",
         Image (Scd_Behavior_Time (N)),
         Int (Scd_Behavior_Time (N)));
      W_Node_Attribute
        ("Distrib_Kind",
         "Byte",
         Image (Distrib_Kind (N)));
   end W_Timed_Action;

   procedure W_Parameter_Label (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("BE_Container",
         "Node_Id",
         Image (BE_Container (N)),
         Int (BE_Container (N)));
      W_Node_Attribute
        ("Next_Entity",
         "Node_Id",
         Image (Next_Entity (N)),
         Int (Next_Entity (N)));
      W_Node_Attribute
        ("Parameter",
         "Node_Id",
         Image (Parameter (N)),
         Int (Parameter (N)));
   end W_Parameter_Label;

   procedure W_Data_Component_Reference (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("BE_Container",
         "Node_Id",
         Image (BE_Container (N)),
         Int (BE_Container (N)));
      W_Node_Attribute
        ("Next_Entity",
         "Node_Id",
         Image (Next_Entity (N)),
         Int (Next_Entity (N)));
      W_Node_Attribute
        ("Identifiers",
         "List_Id",
         Image (Identifiers (N)),
         Int (Identifiers (N)));
   end W_Data_Component_Reference;

   procedure W_Id (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("BE_Container",
         "Node_Id",
         Image (BE_Container (N)),
         Int (BE_Container (N)));
      W_Node_Attribute
        ("Next_Entity",
         "Node_Id",
         Image (Next_Entity (N)),
         Int (Next_Entity (N)));
      W_Node_Attribute
        ("Identifier",
         "Node_Id",
         Image (Identifier (N)),
         Int (Identifier (N)));
      W_Node_Attribute
        ("Int_Value_Holder",
         "Node_Id",
         Image (Int_Value_Holder (N)),
         Int (Int_Value_Holder (N)));
   end W_Id;

   procedure W_Value_Holder (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("BE_Container",
         "Node_Id",
         Image (BE_Container (N)),
         Int (BE_Container (N)));
      W_Node_Attribute
        ("Next_Entity",
         "Node_Id",
         Image (Next_Entity (N)),
         Int (Next_Entity (N)));
      W_Node_Attribute
        ("Identifier",
         "Node_Id",
         Image (Identifier (N)),
         Int (Identifier (N)));
      W_Node_Attribute
        ("Target",
         "Node_Id",
         Image (Target (N)),
         Int (Target (N)));
      W_Node_Attribute
        ("Is_Count",
         "Boolean",
         Image (Is_Count (N)));
      W_Node_Attribute
        ("Is_Fresh",
         "Boolean",
         Image (Is_Fresh (N)));
      W_Node_Attribute
        ("Is_Interrogative",
         "Boolean",
         Image (Is_Interrogative (N)));
   end W_Value_Holder;

   procedure W_Value_Expression (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("BE_Container",
         "Node_Id",
         Image (BE_Container (N)),
         Int (BE_Container (N)));
      W_Node_Attribute
        ("Next_Entity",
         "Node_Id",
         Image (Next_Entity (N)),
         Int (Next_Entity (N)));
      W_Node_Attribute
        ("Relations",
         "List_Id",
         Image (Relations (N)),
         Int (Relations (N)));
   end W_Value_Expression;

   procedure W_Relation (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("BE_Container",
         "Node_Id",
         Image (BE_Container (N)),
         Int (BE_Container (N)));
      W_Node_Attribute
        ("Next_Entity",
         "Node_Id",
         Image (Next_Entity (N)),
         Int (Next_Entity (N)));
      W_Node_Attribute
        ("Boolean_Value",
         "Boolean",
         Image (Boolean_Value (N)));
      W_Node_Attribute
        ("Simple_Exprs",
         "List_Id",
         Image (Simple_Exprs (N)),
         Int (Simple_Exprs (N)));
   end W_Relation;

   procedure W_Simple_Expression (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("BE_Container",
         "Node_Id",
         Image (BE_Container (N)),
         Int (BE_Container (N)));
      W_Node_Attribute
        ("Next_Entity",
         "Node_Id",
         Image (Next_Entity (N)),
         Int (Next_Entity (N)));
      W_Node_Attribute
        ("Term_And_Operator",
         "List_Id",
         Image (Term_And_Operator (N)),
         Int (Term_And_Operator (N)));
   end W_Simple_Expression;

   procedure W_Term (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("BE_Container",
         "Node_Id",
         Image (BE_Container (N)),
         Int (BE_Container (N)));
      W_Node_Attribute
        ("Next_Entity",
         "Node_Id",
         Image (Next_Entity (N)),
         Int (Next_Entity (N)));
      W_Node_Attribute
        ("Factors",
         "List_Id",
         Image (Factors (N)),
         Int (Factors (N)));
   end W_Term;

   procedure W_Factor (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("BE_Container",
         "Node_Id",
         Image (BE_Container (N)),
         Int (BE_Container (N)));
      W_Node_Attribute
        ("Next_Entity",
         "Node_Id",
         Image (Next_Entity (N)),
         Int (Next_Entity (N)));
      W_Node_Attribute
        ("Is_Abs",
         "Boolean",
         Image (Is_Abs (N)));
      W_Node_Attribute
        ("Is_Not",
         "Boolean",
         Image (Is_Not (N)));
      W_Node_Attribute
        ("Lower_Primary",
         "Node_Id",
         Image (Lower_Primary (N)),
         Int (Lower_Primary (N)));
      W_Node_Attribute
        ("Upper_Primary",
         "Node_Id",
         Image (Upper_Primary (N)),
         Int (Upper_Primary (N)));
   end W_Factor;

   procedure W_Property_Constant (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("BE_Container",
         "Node_Id",
         Image (BE_Container (N)),
         Int (BE_Container (N)));
      W_Node_Attribute
        ("Next_Entity",
         "Node_Id",
         Image (Next_Entity (N)),
         Int (Next_Entity (N)));
      W_Node_Attribute
        ("Identifier",
         "Node_Id",
         Image (Identifier (N)),
         Int (Identifier (N)));
      W_Node_Attribute
        ("Property_Set",
         "Node_Id",
         Image (Property_Set (N)),
         Int (Property_Set (N)));
   end W_Property_Constant;

   procedure W_Operator (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("BE_Container",
         "Node_Id",
         Image (BE_Container (N)),
         Int (BE_Container (N)));
      W_Node_Attribute
        ("Next_Entity",
         "Node_Id",
         Image (Next_Entity (N)),
         Int (Next_Entity (N)));
      W_Node_Attribute
        ("Operator_Category",
         "Byte",
         Image (Operator_Category (N)));
   end W_Operator;

   procedure W_Boolean_Literal (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("Is_True",
         "Boolean",
         Image (Is_True (N)));
   end W_Boolean_Literal;

   procedure W_Integer_Range (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("BE_Container",
         "Node_Id",
         Image (BE_Container (N)),
         Int (BE_Container (N)));
      W_Node_Attribute
        ("Next_Entity",
         "Node_Id",
         Image (Next_Entity (N)),
         Int (Next_Entity (N)));
      W_Node_Attribute
        ("Lower_Int_Val",
         "Node_Id",
         Image (Lower_Int_Val (N)),
         Int (Lower_Int_Val (N)));
      W_Node_Attribute
        ("Upper_Int_Val",
         "Node_Id",
         Image (Upper_Int_Val (N)),
         Int (Upper_Int_Val (N)));
   end W_Integer_Range;

   procedure W_Integer_Value (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("BE_Container",
         "Node_Id",
         Image (BE_Container (N)),
         Int (BE_Container (N)));
      W_Node_Attribute
        ("Next_Entity",
         "Node_Id",
         Image (Next_Entity (N)),
         Int (Next_Entity (N)));
      W_Node_Attribute
        ("Entity",
         "Node_Id",
         Image (Entity (N)),
         Int (Entity (N)));
   end W_Integer_Value;

   procedure W_Behavior_Time (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("BE_Container",
         "Node_Id",
         Image (BE_Container (N)),
         Int (BE_Container (N)));
      W_Node_Attribute
        ("Next_Entity",
         "Node_Id",
         Image (Next_Entity (N)),
         Int (Next_Entity (N)));
      W_Node_Attribute
        ("Integer_Value",
         "Node_Id",
         Image (Integer_Value (N)),
         Int (Integer_Value (N)));
      W_Node_Attribute
        ("Unit_Identifier",
         "Node_Id",
         Image (Unit_Identifier (N)),
         Int (Unit_Identifier (N)));
   end W_Behavior_Time;

   procedure W_Literal (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("BE_Container",
         "Node_Id",
         Image (BE_Container (N)),
         Int (BE_Container (N)));
      W_Node_Attribute
        ("Next_Entity",
         "Node_Id",
         Image (Next_Entity (N)),
         Int (Next_Entity (N)));
      W_Node_Attribute
        ("Value",
         "Value_Id",
         Image (Value (N)));
   end W_Literal;

end Ocarina.ME_AADL_BA.BA_Tree.Nodes;

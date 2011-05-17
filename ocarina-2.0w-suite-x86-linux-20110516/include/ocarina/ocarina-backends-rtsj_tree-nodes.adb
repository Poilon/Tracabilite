pragma Style_Checks ("NM32766");

--  This file has been generated automatically by `mknodes'. Do not
--  hand modify this file since your changes will be overridden.

with Ocarina.Backends.RTSJ_Tree.Debug; use Ocarina.Backends.RTSJ_Tree.Debug;

package body Ocarina.Backends.RTSJ_Tree.Nodes is

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
        or else Table (Types.Node_Id (N)).Kind = K_Definition
        or else Table (Types.Node_Id (N)).Kind = K_Defining_Identifier
        or else Table (Types.Node_Id (N)).Kind = K_Function_Specification
        or else Table (Types.Node_Id (N)).Kind = K_Function_Implementation
        or else Table (Types.Node_Id (N)).Kind = K_Call_Function
        or else Table (Types.Node_Id (N)).Kind = K_Parameter_Specification
        or else Table (Types.Node_Id (N)).Kind = K_String_Declaration
        or else Table (Types.Node_Id (N)).Kind = K_Implementation
        or else Table (Types.Node_Id (N)).Kind = K_Java_Comment
        or else Table (Types.Node_Id (N)).Kind = K_Package_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Import_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Switch_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Case_Statement
        or else Table (Types.Node_Id (N)).Kind = K_For_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Assignment_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Return_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Null_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Cast_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Array_Declaration
        or else Table (Types.Node_Id (N)).Kind = K_Array_Value
        or else Table (Types.Node_Id (N)).Kind = K_Full_Array_Declaration
        or else Table (Types.Node_Id (N)).Kind = K_Class_Statement
        or else Table (Types.Node_Id (N)).Kind = K_New_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Try_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Catch_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Throw_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Variable_Declaration
        or else Table (Types.Node_Id (N)).Kind = K_Literal
        or else Table (Types.Node_Id (N)).Kind = K_Pointed_Notation
        or else Table (Types.Node_Id (N)).Kind = K_Expression
        or else Table (Types.Node_Id (N)).Kind = K_Visibility
        or else Table (Types.Node_Id (N)).Kind = K_Public
        or else Table (Types.Node_Id (N)).Kind = K_Protected
        or else Table (Types.Node_Id (N)).Kind = K_Private
        or else Table (Types.Node_Id (N)).Kind = K_Abstract
        or else Table (Types.Node_Id (N)).Kind = K_Static
        or else Table (Types.Node_Id (N)).Kind = K_Final
        or else Table (Types.Node_Id (N)).Kind = K_Enumerator
        or else Table (Types.Node_Id (N)).Kind = K_Tree_Bindings
        or else Table (Types.Node_Id (N)).Kind = K_HI_Tree_Bindings
        or else Table (Types.Node_Id (N)).Kind = K_HI_Distributed_Application
        or else Table (Types.Node_Id (N)).Kind = K_HI_Node
        or else Table (Types.Node_Id (N)).Kind = K_Source_File
        or else Table (Types.Node_Id (N)).Kind = K_API_Unit
        or else Table (Types.Node_Id (N)).Kind = K_HI_Unit);

      return Node_Id (Table (Types.Node_Id (N)).L (2));
   end Next_Node;

   procedure Set_Next_Node (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Node_Id
        or else Table (Types.Node_Id (N)).Kind = K_Definition
        or else Table (Types.Node_Id (N)).Kind = K_Defining_Identifier
        or else Table (Types.Node_Id (N)).Kind = K_Function_Specification
        or else Table (Types.Node_Id (N)).Kind = K_Function_Implementation
        or else Table (Types.Node_Id (N)).Kind = K_Call_Function
        or else Table (Types.Node_Id (N)).Kind = K_Parameter_Specification
        or else Table (Types.Node_Id (N)).Kind = K_String_Declaration
        or else Table (Types.Node_Id (N)).Kind = K_Implementation
        or else Table (Types.Node_Id (N)).Kind = K_Java_Comment
        or else Table (Types.Node_Id (N)).Kind = K_Package_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Import_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Switch_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Case_Statement
        or else Table (Types.Node_Id (N)).Kind = K_For_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Assignment_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Return_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Null_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Cast_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Array_Declaration
        or else Table (Types.Node_Id (N)).Kind = K_Array_Value
        or else Table (Types.Node_Id (N)).Kind = K_Full_Array_Declaration
        or else Table (Types.Node_Id (N)).Kind = K_Class_Statement
        or else Table (Types.Node_Id (N)).Kind = K_New_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Try_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Catch_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Throw_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Variable_Declaration
        or else Table (Types.Node_Id (N)).Kind = K_Literal
        or else Table (Types.Node_Id (N)).Kind = K_Pointed_Notation
        or else Table (Types.Node_Id (N)).Kind = K_Expression
        or else Table (Types.Node_Id (N)).Kind = K_Visibility
        or else Table (Types.Node_Id (N)).Kind = K_Public
        or else Table (Types.Node_Id (N)).Kind = K_Protected
        or else Table (Types.Node_Id (N)).Kind = K_Private
        or else Table (Types.Node_Id (N)).Kind = K_Abstract
        or else Table (Types.Node_Id (N)).Kind = K_Static
        or else Table (Types.Node_Id (N)).Kind = K_Final
        or else Table (Types.Node_Id (N)).Kind = K_Enumerator
        or else Table (Types.Node_Id (N)).Kind = K_Tree_Bindings
        or else Table (Types.Node_Id (N)).Kind = K_HI_Tree_Bindings
        or else Table (Types.Node_Id (N)).Kind = K_HI_Distributed_Application
        or else Table (Types.Node_Id (N)).Kind = K_HI_Node
        or else Table (Types.Node_Id (N)).Kind = K_Source_File
        or else Table (Types.Node_Id (N)).Kind = K_API_Unit
        or else Table (Types.Node_Id (N)).Kind = K_HI_Unit);

      Table (Types.Node_Id (N)).L (2) := Int (V);
   end Set_Next_Node;

   function Frontend_Node (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Node_Id
        or else Table (Types.Node_Id (N)).Kind = K_Definition
        or else Table (Types.Node_Id (N)).Kind = K_Defining_Identifier
        or else Table (Types.Node_Id (N)).Kind = K_Function_Specification
        or else Table (Types.Node_Id (N)).Kind = K_Function_Implementation
        or else Table (Types.Node_Id (N)).Kind = K_Call_Function
        or else Table (Types.Node_Id (N)).Kind = K_Parameter_Specification
        or else Table (Types.Node_Id (N)).Kind = K_String_Declaration
        or else Table (Types.Node_Id (N)).Kind = K_Implementation
        or else Table (Types.Node_Id (N)).Kind = K_Java_Comment
        or else Table (Types.Node_Id (N)).Kind = K_Package_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Import_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Switch_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Case_Statement
        or else Table (Types.Node_Id (N)).Kind = K_For_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Assignment_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Return_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Null_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Cast_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Array_Declaration
        or else Table (Types.Node_Id (N)).Kind = K_Array_Value
        or else Table (Types.Node_Id (N)).Kind = K_Full_Array_Declaration
        or else Table (Types.Node_Id (N)).Kind = K_Class_Statement
        or else Table (Types.Node_Id (N)).Kind = K_New_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Try_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Catch_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Throw_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Variable_Declaration
        or else Table (Types.Node_Id (N)).Kind = K_Literal
        or else Table (Types.Node_Id (N)).Kind = K_Pointed_Notation
        or else Table (Types.Node_Id (N)).Kind = K_Expression
        or else Table (Types.Node_Id (N)).Kind = K_Visibility
        or else Table (Types.Node_Id (N)).Kind = K_Public
        or else Table (Types.Node_Id (N)).Kind = K_Protected
        or else Table (Types.Node_Id (N)).Kind = K_Private
        or else Table (Types.Node_Id (N)).Kind = K_Abstract
        or else Table (Types.Node_Id (N)).Kind = K_Static
        or else Table (Types.Node_Id (N)).Kind = K_Final
        or else Table (Types.Node_Id (N)).Kind = K_Enumerator
        or else Table (Types.Node_Id (N)).Kind = K_Tree_Bindings
        or else Table (Types.Node_Id (N)).Kind = K_HI_Tree_Bindings
        or else Table (Types.Node_Id (N)).Kind = K_HI_Distributed_Application
        or else Table (Types.Node_Id (N)).Kind = K_HI_Node
        or else Table (Types.Node_Id (N)).Kind = K_Source_File
        or else Table (Types.Node_Id (N)).Kind = K_API_Unit
        or else Table (Types.Node_Id (N)).Kind = K_HI_Unit);

      return Node_Id (Table (Types.Node_Id (N)).L (3));
   end Frontend_Node;

   procedure Set_Frontend_Node (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Node_Id
        or else Table (Types.Node_Id (N)).Kind = K_Definition
        or else Table (Types.Node_Id (N)).Kind = K_Defining_Identifier
        or else Table (Types.Node_Id (N)).Kind = K_Function_Specification
        or else Table (Types.Node_Id (N)).Kind = K_Function_Implementation
        or else Table (Types.Node_Id (N)).Kind = K_Call_Function
        or else Table (Types.Node_Id (N)).Kind = K_Parameter_Specification
        or else Table (Types.Node_Id (N)).Kind = K_String_Declaration
        or else Table (Types.Node_Id (N)).Kind = K_Implementation
        or else Table (Types.Node_Id (N)).Kind = K_Java_Comment
        or else Table (Types.Node_Id (N)).Kind = K_Package_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Import_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Switch_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Case_Statement
        or else Table (Types.Node_Id (N)).Kind = K_For_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Assignment_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Return_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Null_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Cast_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Array_Declaration
        or else Table (Types.Node_Id (N)).Kind = K_Array_Value
        or else Table (Types.Node_Id (N)).Kind = K_Full_Array_Declaration
        or else Table (Types.Node_Id (N)).Kind = K_Class_Statement
        or else Table (Types.Node_Id (N)).Kind = K_New_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Try_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Catch_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Throw_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Variable_Declaration
        or else Table (Types.Node_Id (N)).Kind = K_Literal
        or else Table (Types.Node_Id (N)).Kind = K_Pointed_Notation
        or else Table (Types.Node_Id (N)).Kind = K_Expression
        or else Table (Types.Node_Id (N)).Kind = K_Visibility
        or else Table (Types.Node_Id (N)).Kind = K_Public
        or else Table (Types.Node_Id (N)).Kind = K_Protected
        or else Table (Types.Node_Id (N)).Kind = K_Private
        or else Table (Types.Node_Id (N)).Kind = K_Abstract
        or else Table (Types.Node_Id (N)).Kind = K_Static
        or else Table (Types.Node_Id (N)).Kind = K_Final
        or else Table (Types.Node_Id (N)).Kind = K_Enumerator
        or else Table (Types.Node_Id (N)).Kind = K_Tree_Bindings
        or else Table (Types.Node_Id (N)).Kind = K_HI_Tree_Bindings
        or else Table (Types.Node_Id (N)).Kind = K_HI_Distributed_Application
        or else Table (Types.Node_Id (N)).Kind = K_HI_Node
        or else Table (Types.Node_Id (N)).Kind = K_Source_File
        or else Table (Types.Node_Id (N)).Kind = K_API_Unit
        or else Table (Types.Node_Id (N)).Kind = K_HI_Unit);

      Table (Types.Node_Id (N)).L (3) := Int (V);
   end Set_Frontend_Node;

   function First_Node (N : List_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_List_Id
        or else Table (Types.Node_Id (N)).Kind = K_Declaration_List
        or else Table (Types.Node_Id (N)).Kind = K_Statement_List
        or else Table (Types.Node_Id (N)).Kind = K_Method_List
        or else Table (Types.Node_Id (N)).Kind = K_Parameter_List
        or else Table (Types.Node_Id (N)).Kind = K_Attribute_List
        or else Table (Types.Node_Id (N)).Kind = K_Class_List
        or else Table (Types.Node_Id (N)).Kind = K_Header_List
        or else Table (Types.Node_Id (N)).Kind = K_Enumeration_Literals
        or else Table (Types.Node_Id (N)).Kind = K_Source_Files);

      return Node_Id (Table (Types.Node_Id (N)).L (1));
   end First_Node;

   procedure Set_First_Node (N : List_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_List_Id
        or else Table (Types.Node_Id (N)).Kind = K_Declaration_List
        or else Table (Types.Node_Id (N)).Kind = K_Statement_List
        or else Table (Types.Node_Id (N)).Kind = K_Method_List
        or else Table (Types.Node_Id (N)).Kind = K_Parameter_List
        or else Table (Types.Node_Id (N)).Kind = K_Attribute_List
        or else Table (Types.Node_Id (N)).Kind = K_Class_List
        or else Table (Types.Node_Id (N)).Kind = K_Header_List
        or else Table (Types.Node_Id (N)).Kind = K_Enumeration_Literals
        or else Table (Types.Node_Id (N)).Kind = K_Source_Files);

      Table (Types.Node_Id (N)).L (1) := Int (V);
   end Set_First_Node;

   function Last_Node (N : List_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_List_Id
        or else Table (Types.Node_Id (N)).Kind = K_Declaration_List
        or else Table (Types.Node_Id (N)).Kind = K_Statement_List
        or else Table (Types.Node_Id (N)).Kind = K_Method_List
        or else Table (Types.Node_Id (N)).Kind = K_Parameter_List
        or else Table (Types.Node_Id (N)).Kind = K_Attribute_List
        or else Table (Types.Node_Id (N)).Kind = K_Class_List
        or else Table (Types.Node_Id (N)).Kind = K_Header_List
        or else Table (Types.Node_Id (N)).Kind = K_Enumeration_Literals
        or else Table (Types.Node_Id (N)).Kind = K_Source_Files);

      return Node_Id (Table (Types.Node_Id (N)).L (2));
   end Last_Node;

   procedure Set_Last_Node (N : List_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_List_Id
        or else Table (Types.Node_Id (N)).Kind = K_Declaration_List
        or else Table (Types.Node_Id (N)).Kind = K_Statement_List
        or else Table (Types.Node_Id (N)).Kind = K_Method_List
        or else Table (Types.Node_Id (N)).Kind = K_Parameter_List
        or else Table (Types.Node_Id (N)).Kind = K_Attribute_List
        or else Table (Types.Node_Id (N)).Kind = K_Class_List
        or else Table (Types.Node_Id (N)).Kind = K_Header_List
        or else Table (Types.Node_Id (N)).Kind = K_Enumeration_Literals
        or else Table (Types.Node_Id (N)).Kind = K_Source_Files);

      Table (Types.Node_Id (N)).L (2) := Int (V);
   end Set_Last_Node;

   function Defining_Identifier (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Definition
        or else Table (Types.Node_Id (N)).Kind = K_Function_Specification
        or else Table (Types.Node_Id (N)).Kind = K_Call_Function
        or else Table (Types.Node_Id (N)).Kind = K_Parameter_Specification
        or else Table (Types.Node_Id (N)).Kind = K_String_Declaration
        or else Table (Types.Node_Id (N)).Kind = K_Java_Comment
        or else Table (Types.Node_Id (N)).Kind = K_Package_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Assignment_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Cast_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Array_Declaration
        or else Table (Types.Node_Id (N)).Kind = K_Array_Value
        or else Table (Types.Node_Id (N)).Kind = K_Class_Statement
        or else Table (Types.Node_Id (N)).Kind = K_New_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Throw_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Variable_Declaration
        or else Table (Types.Node_Id (N)).Kind = K_Pointed_Notation
        or else Table (Types.Node_Id (N)).Kind = K_Enumerator
        or else Table (Types.Node_Id (N)).Kind = K_Source_File);

      return Node_Id (Table (Types.Node_Id (N)).L (4));
   end Defining_Identifier;

   procedure Set_Defining_Identifier (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Definition
        or else Table (Types.Node_Id (N)).Kind = K_Function_Specification
        or else Table (Types.Node_Id (N)).Kind = K_Call_Function
        or else Table (Types.Node_Id (N)).Kind = K_Parameter_Specification
        or else Table (Types.Node_Id (N)).Kind = K_String_Declaration
        or else Table (Types.Node_Id (N)).Kind = K_Java_Comment
        or else Table (Types.Node_Id (N)).Kind = K_Package_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Assignment_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Cast_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Array_Declaration
        or else Table (Types.Node_Id (N)).Kind = K_Array_Value
        or else Table (Types.Node_Id (N)).Kind = K_Class_Statement
        or else Table (Types.Node_Id (N)).Kind = K_New_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Throw_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Variable_Declaration
        or else Table (Types.Node_Id (N)).Kind = K_Pointed_Notation
        or else Table (Types.Node_Id (N)).Kind = K_Enumerator
        or else Table (Types.Node_Id (N)).Kind = K_Source_File);

      Table (Types.Node_Id (N)).L (4) := Int (V);
   end Set_Defining_Identifier;

   function Name (N : Node_Id) return Name_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Defining_Identifier
        or else Table (Types.Node_Id (N)).Kind = K_HI_Distributed_Application
        or else Table (Types.Node_Id (N)).Kind = K_HI_Node);

      return Name_Id (Table (Types.Node_Id (N)).L (1));
   end Name;

   procedure Set_Name (N : Node_Id; V : Name_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Defining_Identifier
        or else Table (Types.Node_Id (N)).Kind = K_HI_Distributed_Application
        or else Table (Types.Node_Id (N)).Kind = K_HI_Node);

      Table (Types.Node_Id (N)).L (1) := Int (V);
   end Set_Name;

   function Corresponding_Node (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Defining_Identifier);

      return Node_Id (Table (Types.Node_Id (N)).L (4));
   end Corresponding_Node;

   procedure Set_Corresponding_Node (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Defining_Identifier);

      Table (Types.Node_Id (N)).L (4) := Int (V);
   end Set_Corresponding_Node;

   function Parent_Unit_Name (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Defining_Identifier);

      return Node_Id (Table (Types.Node_Id (N)).L (5));
   end Parent_Unit_Name;

   procedure Set_Parent_Unit_Name (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Defining_Identifier);

      Table (Types.Node_Id (N)).L (5) := Int (V);
   end Set_Parent_Unit_Name;

   function Visibility (N : Node_Id) return List_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Function_Specification
        or else Table (Types.Node_Id (N)).Kind = K_Class_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Variable_Declaration);

      return List_Id (Table (Types.Node_Id (N)).L (1));
   end Visibility;

   procedure Set_Visibility (N : Node_Id; V : List_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Function_Specification
        or else Table (Types.Node_Id (N)).Kind = K_Class_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Variable_Declaration);

      Table (Types.Node_Id (N)).L (1) := Int (V);
   end Set_Visibility;

   function Return_Type (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Function_Specification);

      return Node_Id (Table (Types.Node_Id (N)).L (5));
   end Return_Type;

   procedure Set_Return_Type (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Function_Specification);

      Table (Types.Node_Id (N)).L (5) := Int (V);
   end Set_Return_Type;

   function Parameters (N : Node_Id) return List_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Function_Specification
        or else Table (Types.Node_Id (N)).Kind = K_Call_Function
        or else Table (Types.Node_Id (N)).Kind = K_New_Statement);

      return List_Id (Table (Types.Node_Id (N)).L (6));
   end Parameters;

   procedure Set_Parameters (N : Node_Id; V : List_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Function_Specification
        or else Table (Types.Node_Id (N)).Kind = K_Call_Function
        or else Table (Types.Node_Id (N)).Kind = K_New_Statement);

      Table (Types.Node_Id (N)).L (6) := Int (V);
   end Set_Parameters;

   function Throws (N : Node_Id) return List_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Function_Specification);

      return List_Id (Table (Types.Node_Id (N)).L (7));
   end Throws;

   procedure Set_Throws (N : Node_Id; V : List_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Function_Specification);

      Table (Types.Node_Id (N)).L (7) := Int (V);
   end Set_Throws;

   function Specification (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Function_Implementation);

      return Node_Id (Table (Types.Node_Id (N)).L (1));
   end Specification;

   procedure Set_Specification (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Function_Implementation);

      Table (Types.Node_Id (N)).L (1) := Int (V);
   end Set_Specification;

   function Declarations (N : Node_Id) return List_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Function_Implementation
        or else Table (Types.Node_Id (N)).Kind = K_Source_File);

      return List_Id (Table (Types.Node_Id (N)).L (5));
   end Declarations;

   procedure Set_Declarations (N : Node_Id; V : List_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Function_Implementation
        or else Table (Types.Node_Id (N)).Kind = K_Source_File);

      Table (Types.Node_Id (N)).L (5) := Int (V);
   end Set_Declarations;

   function Statements (N : Node_Id) return List_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Function_Implementation
        or else Table (Types.Node_Id (N)).Kind = K_Case_Statement
        or else Table (Types.Node_Id (N)).Kind = K_For_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Try_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Catch_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Source_File);

      return List_Id (Table (Types.Node_Id (N)).L (6));
   end Statements;

   procedure Set_Statements (N : Node_Id; V : List_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Function_Implementation
        or else Table (Types.Node_Id (N)).Kind = K_Case_Statement
        or else Table (Types.Node_Id (N)).Kind = K_For_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Try_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Catch_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Source_File);

      Table (Types.Node_Id (N)).L (6) := Int (V);
   end Set_Statements;

   function Parameter_Type (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Parameter_Specification);

      return Node_Id (Table (Types.Node_Id (N)).L (1));
   end Parameter_Type;

   procedure Set_Parameter_Type (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Parameter_Specification);

      Table (Types.Node_Id (N)).L (1) := Int (V);
   end Set_Parameter_Type;

   function Package_Name (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Implementation);

      return Node_Id (Table (Types.Node_Id (N)).L (1));
   end Package_Name;

   procedure Set_Package_Name (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Implementation);

      Table (Types.Node_Id (N)).L (1) := Int (V);
   end Set_Package_Name;

   function Import (N : Node_Id) return List_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Implementation);

      return List_Id (Table (Types.Node_Id (N)).L (4));
   end Import;

   procedure Set_Import (N : Node_Id; V : List_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Implementation);

      Table (Types.Node_Id (N)).L (4) := Int (V);
   end Set_Import;

   function Class (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Implementation);

      return Node_Id (Table (Types.Node_Id (N)).L (5));
   end Class;

   procedure Set_Class (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Implementation);

      Table (Types.Node_Id (N)).L (5) := Int (V);
   end Set_Class;

   function Has_Header_Spaces (N : Node_Id) return Boolean is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Java_Comment);

      return Boolean (Table (Types.Node_Id (N)).B (1));
   end Has_Header_Spaces;

   procedure Set_Has_Header_Spaces (N : Node_Id; V : Boolean) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Java_Comment);

      Table (Types.Node_Id (N)).B (1) := Boolean (V);
   end Set_Has_Header_Spaces;

   function Import_Name (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Import_Statement);

      return Node_Id (Table (Types.Node_Id (N)).L (1));
   end Import_Name;

   procedure Set_Import_Name (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Import_Statement);

      Table (Types.Node_Id (N)).L (1) := Int (V);
   end Set_Import_Name;

   function Expr (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Switch_Statement);

      return Node_Id (Table (Types.Node_Id (N)).L (1));
   end Expr;

   procedure Set_Expr (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Switch_Statement);

      Table (Types.Node_Id (N)).L (1) := Int (V);
   end Set_Expr;

   function Case_Statements (N : Node_Id) return List_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Switch_Statement);

      return List_Id (Table (Types.Node_Id (N)).L (4));
   end Case_Statements;

   procedure Set_Case_Statements (N : Node_Id; V : List_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Switch_Statement);

      Table (Types.Node_Id (N)).L (4) := Int (V);
   end Set_Case_Statements;

   function Labels (N : Node_Id) return List_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Case_Statement);

      return List_Id (Table (Types.Node_Id (N)).L (1));
   end Labels;

   procedure Set_Labels (N : Node_Id; V : List_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Case_Statement);

      Table (Types.Node_Id (N)).L (1) := Int (V);
   end Set_Labels;

   function Init_Statement (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_For_Statement);

      return Node_Id (Table (Types.Node_Id (N)).L (1));
   end Init_Statement;

   procedure Set_Init_Statement (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_For_Statement);

      Table (Types.Node_Id (N)).L (1) := Int (V);
   end Set_Init_Statement;

   function Iteration_Condition (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_For_Statement);

      return Node_Id (Table (Types.Node_Id (N)).L (4));
   end Iteration_Condition;

   procedure Set_Iteration_Condition (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_For_Statement);

      Table (Types.Node_Id (N)).L (4) := Int (V);
   end Set_Iteration_Condition;

   function Step_Expression (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_For_Statement);

      return Node_Id (Table (Types.Node_Id (N)).L (5));
   end Step_Expression;

   procedure Set_Step_Expression (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_For_Statement);

      Table (Types.Node_Id (N)).L (5) := Int (V);
   end Set_Step_Expression;

   function Expression (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Assignment_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Return_Statement);

      return Node_Id (Table (Types.Node_Id (N)).L (1));
   end Expression;

   procedure Set_Expression (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Assignment_Statement
        or else Table (Types.Node_Id (N)).Kind = K_Return_Statement);

      Table (Types.Node_Id (N)).L (1) := Int (V);
   end Set_Expression;

   function Cast_Type (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Cast_Statement);

      return Node_Id (Table (Types.Node_Id (N)).L (1));
   end Cast_Type;

   procedure Set_Cast_Type (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Cast_Statement);

      Table (Types.Node_Id (N)).L (1) := Int (V);
   end Set_Cast_Type;

   function Array_Size (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Array_Declaration);

      return Node_Id (Table (Types.Node_Id (N)).L (1));
   end Array_Size;

   procedure Set_Array_Size (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Array_Declaration);

      Table (Types.Node_Id (N)).L (1) := Int (V);
   end Set_Array_Size;

   function Array_Item (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Array_Value);

      return Node_Id (Table (Types.Node_Id (N)).L (1));
   end Array_Item;

   procedure Set_Array_Item (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Array_Value);

      Table (Types.Node_Id (N)).L (1) := Int (V);
   end Set_Array_Item;

   function Array_Declaration (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Full_Array_Declaration);

      return Node_Id (Table (Types.Node_Id (N)).L (1));
   end Array_Declaration;

   procedure Set_Array_Declaration (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Full_Array_Declaration);

      Table (Types.Node_Id (N)).L (1) := Int (V);
   end Set_Array_Declaration;

   function Array_Assignments (N : Node_Id) return List_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Full_Array_Declaration);

      return List_Id (Table (Types.Node_Id (N)).L (4));
   end Array_Assignments;

   procedure Set_Array_Assignments (N : Node_Id; V : List_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Full_Array_Declaration);

      Table (Types.Node_Id (N)).L (4) := Int (V);
   end Set_Array_Assignments;

   function Extends_Statement (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Class_Statement);

      return Node_Id (Table (Types.Node_Id (N)).L (5));
   end Extends_Statement;

   procedure Set_Extends_Statement (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Class_Statement);

      Table (Types.Node_Id (N)).L (5) := Int (V);
   end Set_Extends_Statement;

   function Implements_Statement (N : Node_Id) return List_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Class_Statement);

      return List_Id (Table (Types.Node_Id (N)).L (6));
   end Implements_Statement;

   procedure Set_Implements_Statement (N : Node_Id; V : List_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Class_Statement);

      Table (Types.Node_Id (N)).L (6) := Int (V);
   end Set_Implements_Statement;

   function Throws_Statement (N : Node_Id) return List_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Class_Statement);

      return List_Id (Table (Types.Node_Id (N)).L (7));
   end Throws_Statement;

   procedure Set_Throws_Statement (N : Node_Id; V : List_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Class_Statement);

      Table (Types.Node_Id (N)).L (7) := Int (V);
   end Set_Throws_Statement;

   function Attributes (N : Node_Id) return List_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Class_Statement);

      return List_Id (Table (Types.Node_Id (N)).L (8));
   end Attributes;

   procedure Set_Attributes (N : Node_Id; V : List_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Class_Statement);

      Table (Types.Node_Id (N)).L (8) := Int (V);
   end Set_Attributes;

   function Methods (N : Node_Id) return List_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Class_Statement);

      return List_Id (Table (Types.Node_Id (N)).L (9));
   end Methods;

   procedure Set_Methods (N : Node_Id; V : List_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Class_Statement);

      Table (Types.Node_Id (N)).L (9) := Int (V);
   end Set_Methods;

   function Classes (N : Node_Id) return List_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Class_Statement);

      return List_Id (Table (Types.Node_Id (N)).L (10));
   end Classes;

   procedure Set_Classes (N : Node_Id; V : List_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Class_Statement);

      Table (Types.Node_Id (N)).L (10) := Int (V);
   end Set_Classes;

   function Is_Array (N : Node_Id) return Boolean is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_New_Statement);

      return Boolean (Table (Types.Node_Id (N)).B (1));
   end Is_Array;

   procedure Set_Is_Array (N : Node_Id; V : Boolean) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_New_Statement);

      Table (Types.Node_Id (N)).B (1) := Boolean (V);
   end Set_Is_Array;

   function Catch_Statements (N : Node_Id) return List_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Try_Statement);

      return List_Id (Table (Types.Node_Id (N)).L (1));
   end Catch_Statements;

   procedure Set_Catch_Statements (N : Node_Id; V : List_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Try_Statement);

      Table (Types.Node_Id (N)).L (1) := Int (V);
   end Set_Catch_Statements;

   function Exception_Caught (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Catch_Statement);

      return Node_Id (Table (Types.Node_Id (N)).L (1));
   end Exception_Caught;

   procedure Set_Exception_Caught (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Catch_Statement);

      Table (Types.Node_Id (N)).L (1) := Int (V);
   end Set_Exception_Caught;

   function Used_Type (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Variable_Declaration);

      return Node_Id (Table (Types.Node_Id (N)).L (5));
   end Used_Type;

   procedure Set_Used_Type (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Variable_Declaration);

      Table (Types.Node_Id (N)).L (5) := Int (V);
   end Set_Used_Type;

   function Value (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Variable_Declaration);

      return Node_Id (Table (Types.Node_Id (N)).L (6));
   end Value;

   procedure Set_Value (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Variable_Declaration);

      Table (Types.Node_Id (N)).L (6) := Int (V);
   end Set_Value;

   function Value_Literal (N : Node_Id) return Value_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Literal);

      return Value_Id (Table (Types.Node_Id (N)).L (1));
   end Value_Literal;

   procedure Set_Value_Literal (N : Node_Id; V : Value_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Literal);

      Table (Types.Node_Id (N)).L (1) := Int (V);
   end Set_Value_Literal;

   function Right_Member (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Pointed_Notation);

      return Node_Id (Table (Types.Node_Id (N)).L (1));
   end Right_Member;

   procedure Set_Right_Member (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Pointed_Notation);

      Table (Types.Node_Id (N)).L (1) := Int (V);
   end Set_Right_Member;

   function Left_Expression (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Expression);

      return Node_Id (Table (Types.Node_Id (N)).L (4));
   end Left_Expression;

   procedure Set_Left_Expression (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Expression);

      Table (Types.Node_Id (N)).L (4) := Int (V);
   end Set_Left_Expression;

   function Operator_Expression (N : Node_Id) return Operator_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Expression);

      return Operator_Id (Table (Types.Node_Id (N)).O (1));
   end Operator_Expression;

   procedure Set_Operator_Expression (N : Node_Id; V : Operator_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Expression);

      Table (Types.Node_Id (N)).O (1) := Byte (V);
   end Set_Operator_Expression;

   function Right_Expression (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Expression);

      return Node_Id (Table (Types.Node_Id (N)).L (5));
   end Right_Expression;

   procedure Set_Right_Expression (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Expression);

      Table (Types.Node_Id (N)).L (5) := Int (V);
   end Set_Right_Expression;

   function Enum_Members (N : Node_Id) return List_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Enumerator);

      return List_Id (Table (Types.Node_Id (N)).L (1));
   end Enum_Members;

   procedure Set_Enum_Members (N : Node_Id; V : List_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Enumerator);

      Table (Types.Node_Id (N)).L (1) := Int (V);
   end Set_Enum_Members;

   function Image (N : Base_Type) return Name_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Base_Type
        or else Table (Types.Node_Id (N)).Kind = K_Int
        or else Table (Types.Node_Id (N)).Kind = K_Short
        or else Table (Types.Node_Id (N)).Kind = K_Float
        or else Table (Types.Node_Id (N)).Kind = K_Double
        or else Table (Types.Node_Id (N)).Kind = K_Char
        or else Table (Types.Node_Id (N)).Kind = K_String
        or else Table (Types.Node_Id (N)).Kind = K_Boolean
        or else Table (Types.Node_Id (N)).Kind = K_Byte
        or else Table (Types.Node_Id (N)).Kind = K_Void);

      return Name_Id (Table (Types.Node_Id (N)).L (1));
   end Image;

   procedure Set_Image (N : Base_Type; V : Name_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Base_Type
        or else Table (Types.Node_Id (N)).Kind = K_Int
        or else Table (Types.Node_Id (N)).Kind = K_Short
        or else Table (Types.Node_Id (N)).Kind = K_Float
        or else Table (Types.Node_Id (N)).Kind = K_Double
        or else Table (Types.Node_Id (N)).Kind = K_Char
        or else Table (Types.Node_Id (N)).Kind = K_String
        or else Table (Types.Node_Id (N)).Kind = K_Boolean
        or else Table (Types.Node_Id (N)).Kind = K_Byte
        or else Table (Types.Node_Id (N)).Kind = K_Void);

      Table (Types.Node_Id (N)).L (1) := Int (V);
   end Set_Image;

   function Main_Node (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Tree_Bindings
        or else Table (Types.Node_Id (N)).Kind = K_HI_Tree_Bindings);

      return Node_Id (Table (Types.Node_Id (N)).L (1));
   end Main_Node;

   procedure Set_Main_Node (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Tree_Bindings
        or else Table (Types.Node_Id (N)).Kind = K_HI_Tree_Bindings);

      Table (Types.Node_Id (N)).L (1) := Int (V);
   end Set_Main_Node;

   function Type_Definition_Node (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Tree_Bindings);

      return Node_Id (Table (Types.Node_Id (N)).L (4));
   end Type_Definition_Node;

   procedure Set_Type_Definition_Node (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Tree_Bindings);

      Table (Types.Node_Id (N)).L (4) := Int (V);
   end Set_Type_Definition_Node;

   function Feature_Subprogram_Node (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Tree_Bindings);

      return Node_Id (Table (Types.Node_Id (N)).L (5));
   end Feature_Subprogram_Node;

   procedure Set_Feature_Subprogram_Node (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Tree_Bindings);

      Table (Types.Node_Id (N)).L (5) := Int (V);
   end Set_Feature_Subprogram_Node;

   function Subprogram_Node (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Tree_Bindings);

      return Node_Id (Table (Types.Node_Id (N)).L (6));
   end Subprogram_Node;

   procedure Set_Subprogram_Node (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Tree_Bindings);

      Table (Types.Node_Id (N)).L (6) := Int (V);
   end Set_Subprogram_Node;

   function Activity_Node (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_HI_Tree_Bindings);

      return Node_Id (Table (Types.Node_Id (N)).L (4));
   end Activity_Node;

   procedure Set_Activity_Node (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_HI_Tree_Bindings);

      Table (Types.Node_Id (N)).L (4) := Int (V);
   end Set_Activity_Node;

   function Subprograms_Node (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_HI_Tree_Bindings);

      return Node_Id (Table (Types.Node_Id (N)).L (5));
   end Subprograms_Node;

   procedure Set_Subprograms_Node (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_HI_Tree_Bindings);

      Table (Types.Node_Id (N)).L (5) := Int (V);
   end Set_Subprograms_Node;

   function Generated_Types_Node (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_HI_Tree_Bindings);

      return Node_Id (Table (Types.Node_Id (N)).L (6));
   end Generated_Types_Node;

   procedure Set_Generated_Types_Node (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_HI_Tree_Bindings);

      Table (Types.Node_Id (N)).L (6) := Int (V);
   end Set_Generated_Types_Node;

   function Transport_Node (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_HI_Tree_Bindings);

      return Node_Id (Table (Types.Node_Id (N)).L (7));
   end Transport_Node;

   procedure Set_Transport_Node (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_HI_Tree_Bindings);

      Table (Types.Node_Id (N)).L (7) := Int (V);
   end Set_Transport_Node;

   function Deployment_Node (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_HI_Tree_Bindings);

      return Node_Id (Table (Types.Node_Id (N)).L (8));
   end Deployment_Node;

   procedure Set_Deployment_Node (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_HI_Tree_Bindings);

      Table (Types.Node_Id (N)).L (8) := Int (V);
   end Set_Deployment_Node;

   function Naming_Node (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_HI_Tree_Bindings);

      return Node_Id (Table (Types.Node_Id (N)).L (9));
   end Naming_Node;

   procedure Set_Naming_Node (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_HI_Tree_Bindings);

      Table (Types.Node_Id (N)).L (9) := Int (V);
   end Set_Naming_Node;

   function Transport_High_Level_Node (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_HI_Tree_Bindings);

      return Node_Id (Table (Types.Node_Id (N)).L (10));
   end Transport_High_Level_Node;

   procedure Set_Transport_High_Level_Node (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_HI_Tree_Bindings);

      Table (Types.Node_Id (N)).L (10) := Int (V);
   end Set_Transport_High_Level_Node;

   function Enumerator_Node (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_HI_Tree_Bindings);

      return Node_Id (Table (Types.Node_Id (N)).L (11));
   end Enumerator_Node;

   procedure Set_Enumerator_Node (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_HI_Tree_Bindings);

      Table (Types.Node_Id (N)).L (11) := Int (V);
   end Set_Enumerator_Node;

   function Units (N : Node_Id) return List_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_HI_Distributed_Application
        or else Table (Types.Node_Id (N)).Kind = K_HI_Node);

      return List_Id (Table (Types.Node_Id (N)).L (4));
   end Units;

   procedure Set_Units (N : Node_Id; V : List_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_HI_Distributed_Application
        or else Table (Types.Node_Id (N)).Kind = K_HI_Node);

      Table (Types.Node_Id (N)).L (4) := Int (V);
   end Set_Units;

   function HI_Nodes (N : Node_Id) return List_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_HI_Distributed_Application);

      return List_Id (Table (Types.Node_Id (N)).L (5));
   end HI_Nodes;

   procedure Set_HI_Nodes (N : Node_Id; V : List_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_HI_Distributed_Application);

      Table (Types.Node_Id (N)).L (5) := Int (V);
   end Set_HI_Nodes;

   function Distributed_Application (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_HI_Node);

      return Node_Id (Table (Types.Node_Id (N)).L (5));
   end Distributed_Application;

   procedure Set_Distributed_Application (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_HI_Node);

      Table (Types.Node_Id (N)).L (5) := Int (V);
   end Set_Distributed_Application;

   function Distributed_Application_Unit (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Source_File);

      return Node_Id (Table (Types.Node_Id (N)).L (1));
   end Distributed_Application_Unit;

   procedure Set_Distributed_Application_Unit (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Source_File);

      Table (Types.Node_Id (N)).L (1) := Int (V);
   end Set_Distributed_Application_Unit;

   function Imported_Headers (N : Node_Id) return List_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Source_File);

      return List_Id (Table (Types.Node_Id (N)).L (7));
   end Imported_Headers;

   procedure Set_Imported_Headers (N : Node_Id; V : List_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_Source_File);

      Table (Types.Node_Id (N)).L (7) := Int (V);
   end Set_Imported_Headers;

   function Sources (N : Node_Id) return List_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_API_Unit
        or else Table (Types.Node_Id (N)).Kind = K_HI_Unit);

      return List_Id (Table (Types.Node_Id (N)).L (1));
   end Sources;

   procedure Set_Sources (N : Node_Id; V : List_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_API_Unit
        or else Table (Types.Node_Id (N)).Kind = K_HI_Unit);

      Table (Types.Node_Id (N)).L (1) := Int (V);
   end Set_Sources;

   function Entity (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_API_Unit
        or else Table (Types.Node_Id (N)).Kind = K_HI_Unit);

      return Node_Id (Table (Types.Node_Id (N)).L (4));
   end Entity;

   procedure Set_Entity (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_API_Unit
        or else Table (Types.Node_Id (N)).Kind = K_HI_Unit);

      Table (Types.Node_Id (N)).L (4) := Int (V);
   end Set_Entity;

   function Main_Source (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_HI_Unit);

      return Node_Id (Table (Types.Node_Id (N)).L (5));
   end Main_Source;

   procedure Set_Main_Source (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_HI_Unit);

      Table (Types.Node_Id (N)).L (5) := Int (V);
   end Set_Main_Source;

   function Activity_Source (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_HI_Unit);

      return Node_Id (Table (Types.Node_Id (N)).L (6));
   end Activity_Source;

   procedure Set_Activity_Source (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_HI_Unit);

      Table (Types.Node_Id (N)).L (6) := Int (V);
   end Set_Activity_Source;

   function Deployment_Source (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_HI_Unit);

      return Node_Id (Table (Types.Node_Id (N)).L (7));
   end Deployment_Source;

   procedure Set_Deployment_Source (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_HI_Unit);

      Table (Types.Node_Id (N)).L (7) := Int (V);
   end Set_Deployment_Source;

   function Subprograms_Source (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_HI_Unit);

      return Node_Id (Table (Types.Node_Id (N)).L (8));
   end Subprograms_Source;

   procedure Set_Subprograms_Source (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_HI_Unit);

      Table (Types.Node_Id (N)).L (8) := Int (V);
   end Set_Subprograms_Source;

   function Marshallers_Source (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_HI_Unit);

      return Node_Id (Table (Types.Node_Id (N)).L (9));
   end Marshallers_Source;

   procedure Set_Marshallers_Source (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_HI_Unit);

      Table (Types.Node_Id (N)).L (9) := Int (V);
   end Set_Marshallers_Source;

   function Naming_Source (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_HI_Unit);

      return Node_Id (Table (Types.Node_Id (N)).L (10));
   end Naming_Source;

   procedure Set_Naming_Source (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_HI_Unit);

      Table (Types.Node_Id (N)).L (10) := Int (V);
   end Set_Naming_Source;

   function Request_Source (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_HI_Unit);

      return Node_Id (Table (Types.Node_Id (N)).L (11));
   end Request_Source;

   procedure Set_Request_Source (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_HI_Unit);

      Table (Types.Node_Id (N)).L (11) := Int (V);
   end Set_Request_Source;

   function Generated_Types_Source (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_HI_Unit);

      return Node_Id (Table (Types.Node_Id (N)).L (12));
   end Generated_Types_Source;

   procedure Set_Generated_Types_Source (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_HI_Unit);

      Table (Types.Node_Id (N)).L (12) := Int (V);
   end Set_Generated_Types_Source;

   function Transport_High_Level_Source (N : Node_Id) return Node_Id is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_HI_Unit);

      return Node_Id (Table (Types.Node_Id (N)).L (13));
   end Transport_High_Level_Source;

   procedure Set_Transport_High_Level_Source (N : Node_Id; V : Node_Id) is
   begin
      pragma Assert (False
        or else Table (Types.Node_Id (N)).Kind = K_HI_Unit);

      Table (Types.Node_Id (N)).L (13) := Int (V);
   end Set_Transport_High_Level_Source;

   procedure W_Node (N : Node_Id) is
   begin
      case Kind (N) is
         when K_Definition =>
            W_Definition
              (Node_Id (N));
         when K_Defining_Identifier =>
            W_Defining_Identifier
              (Node_Id (N));
         when K_Declaration_List =>
            W_Declaration_List
              (List_Id (N));
         when K_Statement_List =>
            W_Statement_List
              (List_Id (N));
         when K_Method_List =>
            W_Method_List
              (List_Id (N));
         when K_Parameter_List =>
            W_Parameter_List
              (List_Id (N));
         when K_Attribute_List =>
            W_Attribute_List
              (List_Id (N));
         when K_Class_List =>
            W_Class_List
              (List_Id (N));
         when K_Header_List =>
            W_Header_List
              (List_Id (N));
         when K_Enumeration_Literals =>
            W_Enumeration_Literals
              (List_Id (N));
         when K_Function_Specification =>
            W_Function_Specification
              (Node_Id (N));
         when K_Function_Implementation =>
            W_Function_Implementation
              (Node_Id (N));
         when K_Call_Function =>
            W_Call_Function
              (Node_Id (N));
         when K_Parameter_Specification =>
            W_Parameter_Specification
              (Node_Id (N));
         when K_String_Declaration =>
            W_String_Declaration
              (Node_Id (N));
         when K_Implementation =>
            W_Implementation
              (Node_Id (N));
         when K_Java_Comment =>
            W_Java_Comment
              (Node_Id (N));
         when K_Package_Statement =>
            W_Package_Statement
              (Node_Id (N));
         when K_Import_Statement =>
            W_Import_Statement
              (Node_Id (N));
         when K_Switch_Statement =>
            W_Switch_Statement
              (Node_Id (N));
         when K_Case_Statement =>
            W_Case_Statement
              (Node_Id (N));
         when K_For_Statement =>
            W_For_Statement
              (Node_Id (N));
         when K_Assignment_Statement =>
            W_Assignment_Statement
              (Node_Id (N));
         when K_Return_Statement =>
            W_Return_Statement
              (Node_Id (N));
         when K_Null_Statement =>
            W_Null_Statement
              (Node_Id (N));
         when K_Cast_Statement =>
            W_Cast_Statement
              (Node_Id (N));
         when K_Array_Declaration =>
            W_Array_Declaration
              (Node_Id (N));
         when K_Array_Value =>
            W_Array_Value
              (Node_Id (N));
         when K_Full_Array_Declaration =>
            W_Full_Array_Declaration
              (Node_Id (N));
         when K_Class_Statement =>
            W_Class_Statement
              (Node_Id (N));
         when K_New_Statement =>
            W_New_Statement
              (Node_Id (N));
         when K_Try_Statement =>
            W_Try_Statement
              (Node_Id (N));
         when K_Catch_Statement =>
            W_Catch_Statement
              (Node_Id (N));
         when K_Throw_Statement =>
            W_Throw_Statement
              (Node_Id (N));
         when K_Variable_Declaration =>
            W_Variable_Declaration
              (Node_Id (N));
         when K_Literal =>
            W_Literal
              (Node_Id (N));
         when K_Pointed_Notation =>
            W_Pointed_Notation
              (Node_Id (N));
         when K_Expression =>
            W_Expression
              (Node_Id (N));
         when K_Visibility =>
            W_Visibility
              (Node_Id (N));
         when K_Public =>
            W_Public
              (Node_Id (N));
         when K_Protected =>
            W_Protected
              (Node_Id (N));
         when K_Private =>
            W_Private
              (Node_Id (N));
         when K_Abstract =>
            W_Abstract
              (Node_Id (N));
         when K_Static =>
            W_Static
              (Node_Id (N));
         when K_Final =>
            W_Final
              (Node_Id (N));
         when K_Enumerator =>
            W_Enumerator
              (Node_Id (N));
         when K_Int =>
            W_Int
              (Base_Type (N));
         when K_Short =>
            W_Short
              (Base_Type (N));
         when K_Float =>
            W_Float
              (Base_Type (N));
         when K_Double =>
            W_Double
              (Base_Type (N));
         when K_Char =>
            W_Char
              (Base_Type (N));
         when K_String =>
            W_String
              (Base_Type (N));
         when K_Boolean =>
            W_Boolean
              (Base_Type (N));
         when K_Byte =>
            W_Byte
              (Base_Type (N));
         when K_Void =>
            W_Void
              (Base_Type (N));
         when K_Tree_Bindings =>
            W_Tree_Bindings
              (Node_Id (N));
         when K_HI_Tree_Bindings =>
            W_HI_Tree_Bindings
              (Node_Id (N));
         when K_HI_Distributed_Application =>
            W_HI_Distributed_Application
              (Node_Id (N));
         when K_HI_Node =>
            W_HI_Node
              (Node_Id (N));
         when K_Source_Files =>
            W_Source_Files
              (List_Id (N));
         when K_Source_File =>
            W_Source_File
              (Node_Id (N));
         when K_API_Unit =>
            W_API_Unit
              (Node_Id (N));
         when K_HI_Unit =>
            W_HI_Unit
              (Node_Id (N));
         when others =>
            null;
      end case;
   end W_Node;

   procedure W_Definition (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("Frontend_Node",
         "Node_Id",
         Image (Frontend_Node (N)),
         Int (Frontend_Node (N)));
      W_Node_Attribute
        ("Defining_Identifier",
         "Node_Id",
         Image (Defining_Identifier (N)),
         Int (Defining_Identifier (N)));
   end W_Definition;

   procedure W_Defining_Identifier (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("Frontend_Node",
         "Node_Id",
         Image (Frontend_Node (N)),
         Int (Frontend_Node (N)));
      W_Node_Attribute
        ("Name",
         "Name_Id",
         Image (Name (N)));
      W_Node_Attribute
        ("Corresponding_Node",
         "Node_Id",
         Image (Corresponding_Node (N)),
         Int (Corresponding_Node (N)));
      W_Node_Attribute
        ("Parent_Unit_Name",
         "Node_Id",
         Image (Parent_Unit_Name (N)),
         Int (Parent_Unit_Name (N)));
   end W_Defining_Identifier;

   procedure W_Declaration_List (N : List_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("First_Node",
         "Node_Id",
         Image (First_Node (N)),
         Int (First_Node (N)));
      W_Node_Attribute
        ("Last_Node",
         "Node_Id",
         Image (Last_Node (N)),
         Int (Last_Node (N)));
   end W_Declaration_List;

   procedure W_Statement_List (N : List_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("First_Node",
         "Node_Id",
         Image (First_Node (N)),
         Int (First_Node (N)));
      W_Node_Attribute
        ("Last_Node",
         "Node_Id",
         Image (Last_Node (N)),
         Int (Last_Node (N)));
   end W_Statement_List;

   procedure W_Method_List (N : List_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("First_Node",
         "Node_Id",
         Image (First_Node (N)),
         Int (First_Node (N)));
      W_Node_Attribute
        ("Last_Node",
         "Node_Id",
         Image (Last_Node (N)),
         Int (Last_Node (N)));
   end W_Method_List;

   procedure W_Parameter_List (N : List_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("First_Node",
         "Node_Id",
         Image (First_Node (N)),
         Int (First_Node (N)));
      W_Node_Attribute
        ("Last_Node",
         "Node_Id",
         Image (Last_Node (N)),
         Int (Last_Node (N)));
   end W_Parameter_List;

   procedure W_Attribute_List (N : List_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("First_Node",
         "Node_Id",
         Image (First_Node (N)),
         Int (First_Node (N)));
      W_Node_Attribute
        ("Last_Node",
         "Node_Id",
         Image (Last_Node (N)),
         Int (Last_Node (N)));
   end W_Attribute_List;

   procedure W_Class_List (N : List_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("First_Node",
         "Node_Id",
         Image (First_Node (N)),
         Int (First_Node (N)));
      W_Node_Attribute
        ("Last_Node",
         "Node_Id",
         Image (Last_Node (N)),
         Int (Last_Node (N)));
   end W_Class_List;

   procedure W_Header_List (N : List_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("First_Node",
         "Node_Id",
         Image (First_Node (N)),
         Int (First_Node (N)));
      W_Node_Attribute
        ("Last_Node",
         "Node_Id",
         Image (Last_Node (N)),
         Int (Last_Node (N)));
   end W_Header_List;

   procedure W_Enumeration_Literals (N : List_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("First_Node",
         "Node_Id",
         Image (First_Node (N)),
         Int (First_Node (N)));
      W_Node_Attribute
        ("Last_Node",
         "Node_Id",
         Image (Last_Node (N)),
         Int (Last_Node (N)));
   end W_Enumeration_Literals;

   procedure W_Function_Specification (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("Frontend_Node",
         "Node_Id",
         Image (Frontend_Node (N)),
         Int (Frontend_Node (N)));
      W_Node_Attribute
        ("Defining_Identifier",
         "Node_Id",
         Image (Defining_Identifier (N)),
         Int (Defining_Identifier (N)));
      W_Node_Attribute
        ("Visibility",
         "List_Id",
         Image (Visibility (N)),
         Int (Visibility (N)));
      W_Node_Attribute
        ("Return_Type",
         "Node_Id",
         Image (Return_Type (N)),
         Int (Return_Type (N)));
      W_Node_Attribute
        ("Parameters",
         "List_Id",
         Image (Parameters (N)),
         Int (Parameters (N)));
      W_Node_Attribute
        ("Throws",
         "List_Id",
         Image (Throws (N)),
         Int (Throws (N)));
   end W_Function_Specification;

   procedure W_Function_Implementation (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("Frontend_Node",
         "Node_Id",
         Image (Frontend_Node (N)),
         Int (Frontend_Node (N)));
      W_Node_Attribute
        ("Specification",
         "Node_Id",
         Image (Specification (N)),
         Int (Specification (N)));
      W_Node_Attribute
        ("Declarations",
         "List_Id",
         Image (Declarations (N)),
         Int (Declarations (N)));
      W_Node_Attribute
        ("Statements",
         "List_Id",
         Image (Statements (N)),
         Int (Statements (N)));
   end W_Function_Implementation;

   procedure W_Call_Function (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("Frontend_Node",
         "Node_Id",
         Image (Frontend_Node (N)),
         Int (Frontend_Node (N)));
      W_Node_Attribute
        ("Defining_Identifier",
         "Node_Id",
         Image (Defining_Identifier (N)),
         Int (Defining_Identifier (N)));
      W_Node_Attribute
        ("Parameters",
         "List_Id",
         Image (Parameters (N)),
         Int (Parameters (N)));
   end W_Call_Function;

   procedure W_Parameter_Specification (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("Frontend_Node",
         "Node_Id",
         Image (Frontend_Node (N)),
         Int (Frontend_Node (N)));
      W_Node_Attribute
        ("Defining_Identifier",
         "Node_Id",
         Image (Defining_Identifier (N)),
         Int (Defining_Identifier (N)));
      W_Node_Attribute
        ("Parameter_Type",
         "Node_Id",
         Image (Parameter_Type (N)),
         Int (Parameter_Type (N)));
   end W_Parameter_Specification;

   procedure W_String_Declaration (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("Frontend_Node",
         "Node_Id",
         Image (Frontend_Node (N)),
         Int (Frontend_Node (N)));
      W_Node_Attribute
        ("Defining_Identifier",
         "Node_Id",
         Image (Defining_Identifier (N)),
         Int (Defining_Identifier (N)));
   end W_String_Declaration;

   procedure W_Implementation (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("Frontend_Node",
         "Node_Id",
         Image (Frontend_Node (N)),
         Int (Frontend_Node (N)));
      W_Node_Attribute
        ("Package_Name",
         "Node_Id",
         Image (Package_Name (N)),
         Int (Package_Name (N)));
      W_Node_Attribute
        ("Import",
         "List_Id",
         Image (Import (N)),
         Int (Import (N)));
      W_Node_Attribute
        ("Class",
         "Node_Id",
         Image (Class (N)),
         Int (Class (N)));
   end W_Implementation;

   procedure W_Java_Comment (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("Frontend_Node",
         "Node_Id",
         Image (Frontend_Node (N)),
         Int (Frontend_Node (N)));
      W_Node_Attribute
        ("Defining_Identifier",
         "Node_Id",
         Image (Defining_Identifier (N)),
         Int (Defining_Identifier (N)));
      W_Node_Attribute
        ("Has_Header_Spaces",
         "Boolean",
         Image (Has_Header_Spaces (N)));
   end W_Java_Comment;

   procedure W_Package_Statement (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("Frontend_Node",
         "Node_Id",
         Image (Frontend_Node (N)),
         Int (Frontend_Node (N)));
      W_Node_Attribute
        ("Defining_Identifier",
         "Node_Id",
         Image (Defining_Identifier (N)),
         Int (Defining_Identifier (N)));
   end W_Package_Statement;

   procedure W_Import_Statement (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("Frontend_Node",
         "Node_Id",
         Image (Frontend_Node (N)),
         Int (Frontend_Node (N)));
      W_Node_Attribute
        ("Import_Name",
         "Node_Id",
         Image (Import_Name (N)),
         Int (Import_Name (N)));
   end W_Import_Statement;

   procedure W_Switch_Statement (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("Frontend_Node",
         "Node_Id",
         Image (Frontend_Node (N)),
         Int (Frontend_Node (N)));
      W_Node_Attribute
        ("Expr",
         "Node_Id",
         Image (Expr (N)),
         Int (Expr (N)));
      W_Node_Attribute
        ("Case_Statements",
         "List_Id",
         Image (Case_Statements (N)),
         Int (Case_Statements (N)));
   end W_Switch_Statement;

   procedure W_Case_Statement (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("Frontend_Node",
         "Node_Id",
         Image (Frontend_Node (N)),
         Int (Frontend_Node (N)));
      W_Node_Attribute
        ("Statements",
         "List_Id",
         Image (Statements (N)),
         Int (Statements (N)));
      W_Node_Attribute
        ("Labels",
         "List_Id",
         Image (Labels (N)),
         Int (Labels (N)));
   end W_Case_Statement;

   procedure W_For_Statement (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("Frontend_Node",
         "Node_Id",
         Image (Frontend_Node (N)),
         Int (Frontend_Node (N)));
      W_Node_Attribute
        ("Statements",
         "List_Id",
         Image (Statements (N)),
         Int (Statements (N)));
      W_Node_Attribute
        ("Init_Statement",
         "Node_Id",
         Image (Init_Statement (N)),
         Int (Init_Statement (N)));
      W_Node_Attribute
        ("Iteration_Condition",
         "Node_Id",
         Image (Iteration_Condition (N)),
         Int (Iteration_Condition (N)));
      W_Node_Attribute
        ("Step_Expression",
         "Node_Id",
         Image (Step_Expression (N)),
         Int (Step_Expression (N)));
   end W_For_Statement;

   procedure W_Assignment_Statement (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("Frontend_Node",
         "Node_Id",
         Image (Frontend_Node (N)),
         Int (Frontend_Node (N)));
      W_Node_Attribute
        ("Defining_Identifier",
         "Node_Id",
         Image (Defining_Identifier (N)),
         Int (Defining_Identifier (N)));
      W_Node_Attribute
        ("Expression",
         "Node_Id",
         Image (Expression (N)),
         Int (Expression (N)));
   end W_Assignment_Statement;

   procedure W_Return_Statement (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("Frontend_Node",
         "Node_Id",
         Image (Frontend_Node (N)),
         Int (Frontend_Node (N)));
      W_Node_Attribute
        ("Expression",
         "Node_Id",
         Image (Expression (N)),
         Int (Expression (N)));
   end W_Return_Statement;

   procedure W_Null_Statement (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("Frontend_Node",
         "Node_Id",
         Image (Frontend_Node (N)),
         Int (Frontend_Node (N)));
   end W_Null_Statement;

   procedure W_Cast_Statement (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("Frontend_Node",
         "Node_Id",
         Image (Frontend_Node (N)),
         Int (Frontend_Node (N)));
      W_Node_Attribute
        ("Defining_Identifier",
         "Node_Id",
         Image (Defining_Identifier (N)),
         Int (Defining_Identifier (N)));
      W_Node_Attribute
        ("Cast_Type",
         "Node_Id",
         Image (Cast_Type (N)),
         Int (Cast_Type (N)));
   end W_Cast_Statement;

   procedure W_Array_Declaration (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("Frontend_Node",
         "Node_Id",
         Image (Frontend_Node (N)),
         Int (Frontend_Node (N)));
      W_Node_Attribute
        ("Defining_Identifier",
         "Node_Id",
         Image (Defining_Identifier (N)),
         Int (Defining_Identifier (N)));
      W_Node_Attribute
        ("Array_Size",
         "Node_Id",
         Image (Array_Size (N)),
         Int (Array_Size (N)));
   end W_Array_Declaration;

   procedure W_Array_Value (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("Frontend_Node",
         "Node_Id",
         Image (Frontend_Node (N)),
         Int (Frontend_Node (N)));
      W_Node_Attribute
        ("Defining_Identifier",
         "Node_Id",
         Image (Defining_Identifier (N)),
         Int (Defining_Identifier (N)));
      W_Node_Attribute
        ("Array_Item",
         "Node_Id",
         Image (Array_Item (N)),
         Int (Array_Item (N)));
   end W_Array_Value;

   procedure W_Full_Array_Declaration (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("Frontend_Node",
         "Node_Id",
         Image (Frontend_Node (N)),
         Int (Frontend_Node (N)));
      W_Node_Attribute
        ("Array_Declaration",
         "Node_Id",
         Image (Array_Declaration (N)),
         Int (Array_Declaration (N)));
      W_Node_Attribute
        ("Array_Assignments",
         "List_Id",
         Image (Array_Assignments (N)),
         Int (Array_Assignments (N)));
   end W_Full_Array_Declaration;

   procedure W_Class_Statement (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("Frontend_Node",
         "Node_Id",
         Image (Frontend_Node (N)),
         Int (Frontend_Node (N)));
      W_Node_Attribute
        ("Defining_Identifier",
         "Node_Id",
         Image (Defining_Identifier (N)),
         Int (Defining_Identifier (N)));
      W_Node_Attribute
        ("Visibility",
         "List_Id",
         Image (Visibility (N)),
         Int (Visibility (N)));
      W_Node_Attribute
        ("Extends_Statement",
         "Node_Id",
         Image (Extends_Statement (N)),
         Int (Extends_Statement (N)));
      W_Node_Attribute
        ("Implements_Statement",
         "List_Id",
         Image (Implements_Statement (N)),
         Int (Implements_Statement (N)));
      W_Node_Attribute
        ("Throws_Statement",
         "List_Id",
         Image (Throws_Statement (N)),
         Int (Throws_Statement (N)));
      W_Node_Attribute
        ("Attributes",
         "List_Id",
         Image (Attributes (N)),
         Int (Attributes (N)));
      W_Node_Attribute
        ("Methods",
         "List_Id",
         Image (Methods (N)),
         Int (Methods (N)));
      W_Node_Attribute
        ("Classes",
         "List_Id",
         Image (Classes (N)),
         Int (Classes (N)));
   end W_Class_Statement;

   procedure W_New_Statement (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("Frontend_Node",
         "Node_Id",
         Image (Frontend_Node (N)),
         Int (Frontend_Node (N)));
      W_Node_Attribute
        ("Defining_Identifier",
         "Node_Id",
         Image (Defining_Identifier (N)),
         Int (Defining_Identifier (N)));
      W_Node_Attribute
        ("Parameters",
         "List_Id",
         Image (Parameters (N)),
         Int (Parameters (N)));
      W_Node_Attribute
        ("Is_Array",
         "Boolean",
         Image (Is_Array (N)));
   end W_New_Statement;

   procedure W_Try_Statement (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("Frontend_Node",
         "Node_Id",
         Image (Frontend_Node (N)),
         Int (Frontend_Node (N)));
      W_Node_Attribute
        ("Statements",
         "List_Id",
         Image (Statements (N)),
         Int (Statements (N)));
      W_Node_Attribute
        ("Catch_Statements",
         "List_Id",
         Image (Catch_Statements (N)),
         Int (Catch_Statements (N)));
   end W_Try_Statement;

   procedure W_Catch_Statement (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("Frontend_Node",
         "Node_Id",
         Image (Frontend_Node (N)),
         Int (Frontend_Node (N)));
      W_Node_Attribute
        ("Statements",
         "List_Id",
         Image (Statements (N)),
         Int (Statements (N)));
      W_Node_Attribute
        ("Exception_Caught",
         "Node_Id",
         Image (Exception_Caught (N)),
         Int (Exception_Caught (N)));
   end W_Catch_Statement;

   procedure W_Throw_Statement (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("Frontend_Node",
         "Node_Id",
         Image (Frontend_Node (N)),
         Int (Frontend_Node (N)));
      W_Node_Attribute
        ("Defining_Identifier",
         "Node_Id",
         Image (Defining_Identifier (N)),
         Int (Defining_Identifier (N)));
   end W_Throw_Statement;

   procedure W_Variable_Declaration (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("Frontend_Node",
         "Node_Id",
         Image (Frontend_Node (N)),
         Int (Frontend_Node (N)));
      W_Node_Attribute
        ("Defining_Identifier",
         "Node_Id",
         Image (Defining_Identifier (N)),
         Int (Defining_Identifier (N)));
      W_Node_Attribute
        ("Visibility",
         "List_Id",
         Image (Visibility (N)),
         Int (Visibility (N)));
      W_Node_Attribute
        ("Used_Type",
         "Node_Id",
         Image (Used_Type (N)),
         Int (Used_Type (N)));
      W_Node_Attribute
        ("Value",
         "Node_Id",
         Image (Value (N)),
         Int (Value (N)));
   end W_Variable_Declaration;

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
        ("Frontend_Node",
         "Node_Id",
         Image (Frontend_Node (N)),
         Int (Frontend_Node (N)));
      W_Node_Attribute
        ("Value_Literal",
         "Value_Id",
         Image (Value_Literal (N)));
   end W_Literal;

   procedure W_Pointed_Notation (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("Frontend_Node",
         "Node_Id",
         Image (Frontend_Node (N)),
         Int (Frontend_Node (N)));
      W_Node_Attribute
        ("Defining_Identifier",
         "Node_Id",
         Image (Defining_Identifier (N)),
         Int (Defining_Identifier (N)));
      W_Node_Attribute
        ("Right_Member",
         "Node_Id",
         Image (Right_Member (N)),
         Int (Right_Member (N)));
   end W_Pointed_Notation;

   procedure W_Expression (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("Frontend_Node",
         "Node_Id",
         Image (Frontend_Node (N)),
         Int (Frontend_Node (N)));
      W_Node_Attribute
        ("Left_Expression",
         "Node_Id",
         Image (Left_Expression (N)),
         Int (Left_Expression (N)));
      W_Node_Attribute
        ("Operator_Expression",
         "Operator_Id",
         Image (Operator_Expression (N)));
      W_Node_Attribute
        ("Right_Expression",
         "Node_Id",
         Image (Right_Expression (N)),
         Int (Right_Expression (N)));
   end W_Expression;

   procedure W_Visibility (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("Frontend_Node",
         "Node_Id",
         Image (Frontend_Node (N)),
         Int (Frontend_Node (N)));
   end W_Visibility;

   procedure W_Public (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("Frontend_Node",
         "Node_Id",
         Image (Frontend_Node (N)),
         Int (Frontend_Node (N)));
   end W_Public;

   procedure W_Protected (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("Frontend_Node",
         "Node_Id",
         Image (Frontend_Node (N)),
         Int (Frontend_Node (N)));
   end W_Protected;

   procedure W_Private (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("Frontend_Node",
         "Node_Id",
         Image (Frontend_Node (N)),
         Int (Frontend_Node (N)));
   end W_Private;

   procedure W_Abstract (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("Frontend_Node",
         "Node_Id",
         Image (Frontend_Node (N)),
         Int (Frontend_Node (N)));
   end W_Abstract;

   procedure W_Static (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("Frontend_Node",
         "Node_Id",
         Image (Frontend_Node (N)),
         Int (Frontend_Node (N)));
   end W_Static;

   procedure W_Final (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("Frontend_Node",
         "Node_Id",
         Image (Frontend_Node (N)),
         Int (Frontend_Node (N)));
   end W_Final;

   procedure W_Enumerator (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("Frontend_Node",
         "Node_Id",
         Image (Frontend_Node (N)),
         Int (Frontend_Node (N)));
      W_Node_Attribute
        ("Defining_Identifier",
         "Node_Id",
         Image (Defining_Identifier (N)),
         Int (Defining_Identifier (N)));
      W_Node_Attribute
        ("Enum_Members",
         "List_Id",
         Image (Enum_Members (N)),
         Int (Enum_Members (N)));
   end W_Enumerator;

   procedure W_Int (N : Base_Type) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Image",
         "Name_Id",
         Image (Image (N)));
   end W_Int;

   procedure W_Short (N : Base_Type) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Image",
         "Name_Id",
         Image (Image (N)));
   end W_Short;

   procedure W_Float (N : Base_Type) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Image",
         "Name_Id",
         Image (Image (N)));
   end W_Float;

   procedure W_Double (N : Base_Type) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Image",
         "Name_Id",
         Image (Image (N)));
   end W_Double;

   procedure W_Char (N : Base_Type) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Image",
         "Name_Id",
         Image (Image (N)));
   end W_Char;

   procedure W_String (N : Base_Type) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Image",
         "Name_Id",
         Image (Image (N)));
   end W_String;

   procedure W_Boolean (N : Base_Type) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Image",
         "Name_Id",
         Image (Image (N)));
   end W_Boolean;

   procedure W_Byte (N : Base_Type) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Image",
         "Name_Id",
         Image (Image (N)));
   end W_Byte;

   procedure W_Void (N : Base_Type) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Image",
         "Name_Id",
         Image (Image (N)));
   end W_Void;

   procedure W_Tree_Bindings (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("Frontend_Node",
         "Node_Id",
         Image (Frontend_Node (N)),
         Int (Frontend_Node (N)));
      W_Node_Attribute
        ("Main_Node",
         "Node_Id",
         Image (Main_Node (N)),
         Int (Main_Node (N)));
      W_Node_Attribute
        ("Type_Definition_Node",
         "Node_Id",
         Image (Type_Definition_Node (N)),
         Int (Type_Definition_Node (N)));
      W_Node_Attribute
        ("Feature_Subprogram_Node",
         "Node_Id",
         Image (Feature_Subprogram_Node (N)),
         Int (Feature_Subprogram_Node (N)));
      W_Node_Attribute
        ("Subprogram_Node",
         "Node_Id",
         Image (Subprogram_Node (N)),
         Int (Subprogram_Node (N)));
   end W_Tree_Bindings;

   procedure W_HI_Tree_Bindings (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("Frontend_Node",
         "Node_Id",
         Image (Frontend_Node (N)),
         Int (Frontend_Node (N)));
      W_Node_Attribute
        ("Main_Node",
         "Node_Id",
         Image (Main_Node (N)),
         Int (Main_Node (N)));
      W_Node_Attribute
        ("Activity_Node",
         "Node_Id",
         Image (Activity_Node (N)),
         Int (Activity_Node (N)));
      W_Node_Attribute
        ("Subprograms_Node",
         "Node_Id",
         Image (Subprograms_Node (N)),
         Int (Subprograms_Node (N)));
      W_Node_Attribute
        ("Generated_Types_Node",
         "Node_Id",
         Image (Generated_Types_Node (N)),
         Int (Generated_Types_Node (N)));
      W_Node_Attribute
        ("Transport_Node",
         "Node_Id",
         Image (Transport_Node (N)),
         Int (Transport_Node (N)));
      W_Node_Attribute
        ("Deployment_Node",
         "Node_Id",
         Image (Deployment_Node (N)),
         Int (Deployment_Node (N)));
      W_Node_Attribute
        ("Naming_Node",
         "Node_Id",
         Image (Naming_Node (N)),
         Int (Naming_Node (N)));
      W_Node_Attribute
        ("Transport_High_Level_Node",
         "Node_Id",
         Image (Transport_High_Level_Node (N)),
         Int (Transport_High_Level_Node (N)));
      W_Node_Attribute
        ("Enumerator_Node",
         "Node_Id",
         Image (Enumerator_Node (N)),
         Int (Enumerator_Node (N)));
   end W_HI_Tree_Bindings;

   procedure W_HI_Distributed_Application (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("Frontend_Node",
         "Node_Id",
         Image (Frontend_Node (N)),
         Int (Frontend_Node (N)));
      W_Node_Attribute
        ("Name",
         "Name_Id",
         Image (Name (N)));
      W_Node_Attribute
        ("Units",
         "List_Id",
         Image (Units (N)),
         Int (Units (N)));
      W_Node_Attribute
        ("HI_Nodes",
         "List_Id",
         Image (HI_Nodes (N)),
         Int (HI_Nodes (N)));
   end W_HI_Distributed_Application;

   procedure W_HI_Node (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("Frontend_Node",
         "Node_Id",
         Image (Frontend_Node (N)),
         Int (Frontend_Node (N)));
      W_Node_Attribute
        ("Name",
         "Name_Id",
         Image (Name (N)));
      W_Node_Attribute
        ("Units",
         "List_Id",
         Image (Units (N)),
         Int (Units (N)));
      W_Node_Attribute
        ("Distributed_Application",
         "Node_Id",
         Image (Distributed_Application (N)),
         Int (Distributed_Application (N)));
   end W_HI_Node;

   procedure W_Source_Files (N : List_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("First_Node",
         "Node_Id",
         Image (First_Node (N)),
         Int (First_Node (N)));
      W_Node_Attribute
        ("Last_Node",
         "Node_Id",
         Image (Last_Node (N)),
         Int (Last_Node (N)));
   end W_Source_Files;

   procedure W_Source_File (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("Frontend_Node",
         "Node_Id",
         Image (Frontend_Node (N)),
         Int (Frontend_Node (N)));
      W_Node_Attribute
        ("Defining_Identifier",
         "Node_Id",
         Image (Defining_Identifier (N)),
         Int (Defining_Identifier (N)));
      W_Node_Attribute
        ("Declarations",
         "List_Id",
         Image (Declarations (N)),
         Int (Declarations (N)));
      W_Node_Attribute
        ("Statements",
         "List_Id",
         Image (Statements (N)),
         Int (Statements (N)));
      W_Node_Attribute
        ("Distributed_Application_Unit",
         "Node_Id",
         Image (Distributed_Application_Unit (N)),
         Int (Distributed_Application_Unit (N)));
      W_Node_Attribute
        ("Imported_Headers",
         "List_Id",
         Image (Imported_Headers (N)),
         Int (Imported_Headers (N)));
   end W_Source_File;

   procedure W_API_Unit (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("Frontend_Node",
         "Node_Id",
         Image (Frontend_Node (N)),
         Int (Frontend_Node (N)));
      W_Node_Attribute
        ("Sources",
         "List_Id",
         Image (Sources (N)),
         Int (Sources (N)));
      W_Node_Attribute
        ("Entity",
         "Node_Id",
         Image (Entity (N)),
         Int (Entity (N)));
   end W_API_Unit;

   procedure W_HI_Unit (N : Node_Id) is
   begin
      W_Node_Header
        (Node_Id (N));
      W_Node_Attribute
        ("Next_Node",
         "Node_Id",
         Image (Next_Node (N)),
         Int (Next_Node (N)));
      W_Node_Attribute
        ("Frontend_Node",
         "Node_Id",
         Image (Frontend_Node (N)),
         Int (Frontend_Node (N)));
      W_Node_Attribute
        ("Sources",
         "List_Id",
         Image (Sources (N)),
         Int (Sources (N)));
      W_Node_Attribute
        ("Entity",
         "Node_Id",
         Image (Entity (N)),
         Int (Entity (N)));
      W_Node_Attribute
        ("Main_Source",
         "Node_Id",
         Image (Main_Source (N)),
         Int (Main_Source (N)));
      W_Node_Attribute
        ("Activity_Source",
         "Node_Id",
         Image (Activity_Source (N)),
         Int (Activity_Source (N)));
      W_Node_Attribute
        ("Deployment_Source",
         "Node_Id",
         Image (Deployment_Source (N)),
         Int (Deployment_Source (N)));
      W_Node_Attribute
        ("Subprograms_Source",
         "Node_Id",
         Image (Subprograms_Source (N)),
         Int (Subprograms_Source (N)));
      W_Node_Attribute
        ("Marshallers_Source",
         "Node_Id",
         Image (Marshallers_Source (N)),
         Int (Marshallers_Source (N)));
      W_Node_Attribute
        ("Naming_Source",
         "Node_Id",
         Image (Naming_Source (N)),
         Int (Naming_Source (N)));
      W_Node_Attribute
        ("Request_Source",
         "Node_Id",
         Image (Request_Source (N)),
         Int (Request_Source (N)));
      W_Node_Attribute
        ("Generated_Types_Source",
         "Node_Id",
         Image (Generated_Types_Source (N)),
         Int (Generated_Types_Source (N)));
      W_Node_Attribute
        ("Transport_High_Level_Source",
         "Node_Id",
         Image (Transport_High_Level_Source (N)),
         Int (Transport_High_Level_Source (N)));
   end W_HI_Unit;

end Ocarina.Backends.RTSJ_Tree.Nodes;

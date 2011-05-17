pragma Style_Checks ("NM32766");

--  This file has been generated automatically by `mknodes'. Do not
--  hand modify this file since your changes will be overridden.

with GNAT.Table;
pragma Warnings (Off);
with Locations; use Locations;
with Types;     use Types;
pragma Warnings (On);

package Ocarina.Backends.RTSJ_Tree.Nodes is

   type Node_Kind is
     (K_Node_Id,
      K_List_Id,
      K_Definition,
      K_Defining_Identifier,
      K_Declaration_List,
      K_Statement_List,
      K_Method_List,
      K_Parameter_List,
      K_Attribute_List,
      K_Class_List,
      K_Header_List,
      K_Enumeration_Literals,
      K_Function_Specification,
      K_Function_Implementation,
      K_Call_Function,
      K_Parameter_Specification,
      K_String_Declaration,
      K_Implementation,
      K_Java_Comment,
      K_Package_Statement,
      K_Import_Statement,
      K_Switch_Statement,
      K_Case_Statement,
      K_For_Statement,
      K_Assignment_Statement,
      K_Return_Statement,
      K_Null_Statement,
      K_Cast_Statement,
      K_Array_Declaration,
      K_Array_Value,
      K_Full_Array_Declaration,
      K_Class_Statement,
      K_New_Statement,
      K_Try_Statement,
      K_Catch_Statement,
      K_Throw_Statement,
      K_Variable_Declaration,
      K_Literal,
      K_Pointed_Notation,
      K_Expression,
      K_Visibility,
      K_Public,
      K_Protected,
      K_Private,
      K_Abstract,
      K_Static,
      K_Final,
      K_Enumerator,
      K_Base_Type,
      K_Int,
      K_Short,
      K_Float,
      K_Double,
      K_Char,
      K_String,
      K_Boolean,
      K_Byte,
      K_Void,
      K_Tree_Bindings,
      K_HI_Tree_Bindings,
      K_HI_Distributed_Application,
      K_HI_Node,
      K_Source_Files,
      K_Source_File,
      K_API_Unit,
      K_HI_Unit);

   --
   --  Node_Id
   --
   --    Next_Node                : Node_Id
   --    Frontend_Node            : Node_Id
   --

   --
   --  List_Id
   --
   --    First_Node               : Node_Id
   --    Last_Node                : Node_Id
   --

   --
   --  Definition
   --
   --    Next_Node                : Node_Id
   --    Frontend_Node            : Node_Id
   --    Defining_Identifier      : Node_Id
   --

   procedure W_Definition (N : Node_Id);

   --
   --  Defining_Identifier
   --
   --    Next_Node                : Node_Id
   --    Frontend_Node            : Node_Id
   --    Name                     : Name_Id
   --    Corresponding_Node       : Node_Id
   --    Parent_Unit_Name         : Node_Id
   --

   procedure W_Defining_Identifier (N : Node_Id);

   --
   --  Declaration_List
   --
   --    First_Node               : Node_Id
   --    Last_Node                : Node_Id
   --

   procedure W_Declaration_List (N : List_Id);

   --
   --  Statement_List
   --
   --    First_Node               : Node_Id
   --    Last_Node                : Node_Id
   --

   procedure W_Statement_List (N : List_Id);

   --
   --  Method_List
   --
   --    First_Node               : Node_Id
   --    Last_Node                : Node_Id
   --

   procedure W_Method_List (N : List_Id);

   --
   --  Parameter_List
   --
   --    First_Node               : Node_Id
   --    Last_Node                : Node_Id
   --

   procedure W_Parameter_List (N : List_Id);

   --
   --  Attribute_List
   --
   --    First_Node               : Node_Id
   --    Last_Node                : Node_Id
   --

   procedure W_Attribute_List (N : List_Id);

   --
   --  Class_List
   --
   --    First_Node               : Node_Id
   --    Last_Node                : Node_Id
   --

   procedure W_Class_List (N : List_Id);

   --
   --  Header_List
   --
   --    First_Node               : Node_Id
   --    Last_Node                : Node_Id
   --

   procedure W_Header_List (N : List_Id);

   --
   --  Enumeration_Literals
   --
   --    First_Node               : Node_Id
   --    Last_Node                : Node_Id
   --

   procedure W_Enumeration_Literals (N : List_Id);

   --
   --  Function_Specification
   --
   --    Next_Node                : Node_Id
   --    Frontend_Node            : Node_Id
   --    Defining_Identifier      : Node_Id
   --    Visibility               : List_Id
   --    Return_Type              : Node_Id
   --    Parameters               : List_Id
   --    Throws                   : List_Id
   --

   procedure W_Function_Specification (N : Node_Id);

   --
   --  Function_Implementation
   --
   --    Next_Node                : Node_Id
   --    Frontend_Node            : Node_Id
   --    Specification            : Node_Id
   --    Declarations             : List_Id
   --    Statements               : List_Id
   --

   procedure W_Function_Implementation (N : Node_Id);

   --
   --  Call_Function
   --
   --    Next_Node                : Node_Id
   --    Frontend_Node            : Node_Id
   --    Defining_Identifier      : Node_Id
   --    Parameters               : List_Id
   --

   procedure W_Call_Function (N : Node_Id);

   --
   --  Parameter_Specification
   --
   --    Next_Node                : Node_Id
   --    Frontend_Node            : Node_Id
   --    Defining_Identifier      : Node_Id
   --    Parameter_Type           : Node_Id
   --

   procedure W_Parameter_Specification (N : Node_Id);

   --
   --  String_Declaration
   --
   --    Next_Node                : Node_Id
   --    Frontend_Node            : Node_Id
   --    Defining_Identifier      : Node_Id
   --

   procedure W_String_Declaration (N : Node_Id);

   --
   --  Implementation
   --
   --    Next_Node                : Node_Id
   --    Frontend_Node            : Node_Id
   --    Package_Name             : Node_Id
   --    Import                   : List_Id
   --    Class                    : Node_Id
   --

   procedure W_Implementation (N : Node_Id);

   --
   --  Java_Comment
   --
   --    Next_Node                : Node_Id
   --    Frontend_Node            : Node_Id
   --    Defining_Identifier      : Node_Id
   --    Has_Header_Spaces        : Boolean
   --

   procedure W_Java_Comment (N : Node_Id);

   --
   --  Package_Statement
   --
   --    Next_Node                : Node_Id
   --    Frontend_Node            : Node_Id
   --    Defining_Identifier      : Node_Id
   --

   procedure W_Package_Statement (N : Node_Id);

   --
   --  Import_Statement
   --
   --    Next_Node                : Node_Id
   --    Frontend_Node            : Node_Id
   --    Import_Name              : Node_Id
   --

   procedure W_Import_Statement (N : Node_Id);

   --
   --  Switch_Statement
   --
   --    Next_Node                : Node_Id
   --    Frontend_Node            : Node_Id
   --    Expr                     : Node_Id
   --    Case_Statements          : List_Id
   --

   procedure W_Switch_Statement (N : Node_Id);

   --
   --  Case_Statement
   --
   --    Next_Node                : Node_Id
   --    Frontend_Node            : Node_Id
   --    Labels                   : List_Id
   --    Statements               : List_Id
   --

   procedure W_Case_Statement (N : Node_Id);

   --
   --  For_Statement
   --
   --    Next_Node                : Node_Id
   --    Frontend_Node            : Node_Id
   --    Init_Statement           : Node_Id
   --    Iteration_Condition      : Node_Id
   --    Step_Expression          : Node_Id
   --    Statements               : List_Id
   --

   procedure W_For_Statement (N : Node_Id);

   --
   --  Assignment_Statement
   --
   --    Next_Node                : Node_Id
   --    Frontend_Node            : Node_Id
   --    Defining_Identifier      : Node_Id
   --    Expression               : Node_Id
   --

   procedure W_Assignment_Statement (N : Node_Id);

   --
   --  Return_Statement
   --
   --    Next_Node                : Node_Id
   --    Frontend_Node            : Node_Id
   --    Expression               : Node_Id
   --

   procedure W_Return_Statement (N : Node_Id);

   --
   --  Null_Statement
   --
   --    Next_Node                : Node_Id
   --    Frontend_Node            : Node_Id
   --

   procedure W_Null_Statement (N : Node_Id);

   --
   --  Cast_Statement
   --
   --    Next_Node                : Node_Id
   --    Frontend_Node            : Node_Id
   --    Defining_Identifier      : Node_Id
   --    Cast_Type                : Node_Id
   --

   procedure W_Cast_Statement (N : Node_Id);

   --
   --  Array_Declaration
   --
   --    Next_Node                : Node_Id
   --    Frontend_Node            : Node_Id
   --    Defining_Identifier      : Node_Id
   --    Array_Size               : Node_Id
   --

   procedure W_Array_Declaration (N : Node_Id);

   --
   --  Array_Value
   --
   --    Next_Node                : Node_Id
   --    Frontend_Node            : Node_Id
   --    Defining_Identifier      : Node_Id
   --    Array_Item               : Node_Id
   --

   procedure W_Array_Value (N : Node_Id);

   --
   --  Full_Array_Declaration
   --
   --    Next_Node                : Node_Id
   --    Frontend_Node            : Node_Id
   --    Array_Declaration        : Node_Id
   --    Array_Assignments        : List_Id
   --

   procedure W_Full_Array_Declaration (N : Node_Id);

   --
   --  Class_Statement
   --
   --    Next_Node                : Node_Id
   --    Frontend_Node            : Node_Id
   --    Defining_Identifier      : Node_Id
   --    Visibility               : List_Id
   --    Extends_Statement        : Node_Id
   --    Implements_Statement     : List_Id
   --    Throws_Statement         : List_Id
   --    Attributes               : List_Id
   --    Methods                  : List_Id
   --    Classes                  : List_Id
   --

   procedure W_Class_Statement (N : Node_Id);

   --
   --  New_Statement
   --
   --    Next_Node                : Node_Id
   --    Frontend_Node            : Node_Id
   --    Defining_Identifier      : Node_Id
   --    Parameters               : List_Id
   --    Is_Array                 : Boolean
   --

   procedure W_New_Statement (N : Node_Id);

   --
   --  Try_Statement
   --
   --    Next_Node                : Node_Id
   --    Frontend_Node            : Node_Id
   --    Statements               : List_Id
   --    Catch_Statements         : List_Id
   --

   procedure W_Try_Statement (N : Node_Id);

   --
   --  Catch_Statement
   --
   --    Next_Node                : Node_Id
   --    Frontend_Node            : Node_Id
   --    Exception_Caught         : Node_Id
   --    Statements               : List_Id
   --

   procedure W_Catch_Statement (N : Node_Id);

   --
   --  Throw_Statement
   --
   --    Next_Node                : Node_Id
   --    Frontend_Node            : Node_Id
   --    Defining_Identifier      : Node_Id
   --

   procedure W_Throw_Statement (N : Node_Id);

   --
   --  Variable_Declaration
   --
   --    Next_Node                : Node_Id
   --    Frontend_Node            : Node_Id
   --    Defining_Identifier      : Node_Id
   --    Visibility               : List_Id
   --    Used_Type                : Node_Id
   --    Value                    : Node_Id
   --

   procedure W_Variable_Declaration (N : Node_Id);

   --
   --  Literal
   --
   --    Next_Node                : Node_Id
   --    Frontend_Node            : Node_Id
   --    Value_Literal            : Value_Id
   --

   procedure W_Literal (N : Node_Id);

   --
   --  Pointed_Notation
   --
   --    Next_Node                : Node_Id
   --    Frontend_Node            : Node_Id
   --    Defining_Identifier      : Node_Id
   --    Right_Member             : Node_Id
   --

   procedure W_Pointed_Notation (N : Node_Id);

   --
   --  Expression
   --
   --    Next_Node                : Node_Id
   --    Frontend_Node            : Node_Id
   --    Left_Expression          : Node_Id
   --    Operator_Expression      : Operator_Id
   --    Right_Expression         : Node_Id
   --

   procedure W_Expression (N : Node_Id);

   --
   --  Visibility
   --
   --    Next_Node                : Node_Id
   --    Frontend_Node            : Node_Id
   --

   procedure W_Visibility (N : Node_Id);

   --
   --  Public
   --
   --    Next_Node                : Node_Id
   --    Frontend_Node            : Node_Id
   --

   procedure W_Public (N : Node_Id);

   --
   --  Protected
   --
   --    Next_Node                : Node_Id
   --    Frontend_Node            : Node_Id
   --

   procedure W_Protected (N : Node_Id);

   --
   --  Private
   --
   --    Next_Node                : Node_Id
   --    Frontend_Node            : Node_Id
   --

   procedure W_Private (N : Node_Id);

   --
   --  Abstract
   --
   --    Next_Node                : Node_Id
   --    Frontend_Node            : Node_Id
   --

   procedure W_Abstract (N : Node_Id);

   --
   --  Static
   --
   --    Next_Node                : Node_Id
   --    Frontend_Node            : Node_Id
   --

   procedure W_Static (N : Node_Id);

   --
   --  Final
   --
   --    Next_Node                : Node_Id
   --    Frontend_Node            : Node_Id
   --

   procedure W_Final (N : Node_Id);

   --
   --  Enumerator
   --
   --    Next_Node                : Node_Id
   --    Frontend_Node            : Node_Id
   --    Defining_Identifier      : Node_Id
   --    Enum_Members             : List_Id
   --

   procedure W_Enumerator (N : Node_Id);

   --
   --  Base_Type
   --
   --    Image                    : Name_Id
   --

   --
   --  Int
   --
   --    Image                    : Name_Id
   --

   procedure W_Int (N : Base_Type);

   --
   --  Short
   --
   --    Image                    : Name_Id
   --

   procedure W_Short (N : Base_Type);

   --
   --  Float
   --
   --    Image                    : Name_Id
   --

   procedure W_Float (N : Base_Type);

   --
   --  Double
   --
   --    Image                    : Name_Id
   --

   procedure W_Double (N : Base_Type);

   --
   --  Char
   --
   --    Image                    : Name_Id
   --

   procedure W_Char (N : Base_Type);

   --
   --  String
   --
   --    Image                    : Name_Id
   --

   procedure W_String (N : Base_Type);

   --
   --  Boolean
   --
   --    Image                    : Name_Id
   --

   procedure W_Boolean (N : Base_Type);

   --
   --  Byte
   --
   --    Image                    : Name_Id
   --

   procedure W_Byte (N : Base_Type);

   --
   --  Void
   --
   --    Image                    : Name_Id
   --

   procedure W_Void (N : Base_Type);

   --
   --  Tree_Bindings
   --
   --    Next_Node                : Node_Id
   --    Frontend_Node            : Node_Id
   --    Main_Node                : Node_Id
   --    Type_Definition_Node     : Node_Id
   --    Feature_Subprogram_Node  : Node_Id
   --    Subprogram_Node          : Node_Id
   --

   procedure W_Tree_Bindings (N : Node_Id);

   --
   --  HI_Tree_Bindings
   --
   --    Next_Node                : Node_Id
   --    Frontend_Node            : Node_Id
   --    Main_Node                : Node_Id
   --    Activity_Node            : Node_Id
   --    Subprograms_Node         : Node_Id
   --    Generated_Types_Node     : Node_Id
   --    Transport_Node           : Node_Id
   --    Deployment_Node          : Node_Id
   --    Naming_Node              : Node_Id
   --    Transport_High_Level_Node: Node_Id
   --    Enumerator_Node          : Node_Id
   --

   procedure W_HI_Tree_Bindings (N : Node_Id);

   --
   --  HI_Distributed_Application
   --
   --    Next_Node                : Node_Id
   --    Frontend_Node            : Node_Id
   --    Name                     : Name_Id
   --    Units                    : List_Id
   --    HI_Nodes                 : List_Id
   --

   procedure W_HI_Distributed_Application (N : Node_Id);

   --
   --  HI_Node
   --
   --    Next_Node                : Node_Id
   --    Frontend_Node            : Node_Id
   --    Name                     : Name_Id
   --    Units                    : List_Id
   --    Distributed_Application  : Node_Id
   --

   procedure W_HI_Node (N : Node_Id);

   --
   --  Source_Files
   --
   --    First_Node               : Node_Id
   --    Last_Node                : Node_Id
   --

   procedure W_Source_Files (N : List_Id);

   --
   --  Source_File
   --
   --    Next_Node                : Node_Id
   --    Frontend_Node            : Node_Id
   --    Defining_Identifier      : Node_Id
   --    Distributed_Application_Unit: Node_Id
   --    Imported_Headers         : List_Id
   --    Declarations             : List_Id
   --    Statements               : List_Id
   --

   procedure W_Source_File (N : Node_Id);

   --
   --  API_Unit
   --
   --    Next_Node                : Node_Id
   --    Frontend_Node            : Node_Id
   --    Sources                  : List_Id
   --    Entity                   : Node_Id
   --

   procedure W_API_Unit (N : Node_Id);

   --
   --  HI_Unit
   --
   --    Next_Node                : Node_Id
   --    Frontend_Node            : Node_Id
   --    Sources                  : List_Id
   --    Entity                   : Node_Id
   --    Main_Source              : Node_Id
   --    Activity_Source          : Node_Id
   --    Deployment_Source        : Node_Id
   --    Subprograms_Source       : Node_Id
   --    Marshallers_Source       : Node_Id
   --    Naming_Source            : Node_Id
   --    Request_Source           : Node_Id
   --    Generated_Types_Source   : Node_Id
   --    Transport_High_Level_Source: Node_Id
   --

   procedure W_HI_Unit (N : Node_Id);

   function Kind (N : Node_Id) return Node_Kind;
   procedure Set_Kind (N : Node_Id; V : Node_Kind);

   function Loc (N : Node_Id) return Location;
   procedure Set_Loc (N : Node_Id; V : Location);

   function Next_Node (N : Node_Id) return Node_Id;
   procedure Set_Next_Node (N : Node_Id; V : Node_Id);

   function Frontend_Node (N : Node_Id) return Node_Id;
   procedure Set_Frontend_Node (N : Node_Id; V : Node_Id);

   function First_Node (N : List_Id) return Node_Id;
   procedure Set_First_Node (N : List_Id; V : Node_Id);

   function Last_Node (N : List_Id) return Node_Id;
   procedure Set_Last_Node (N : List_Id; V : Node_Id);

   function Defining_Identifier (N : Node_Id) return Node_Id;
   procedure Set_Defining_Identifier (N : Node_Id; V : Node_Id);

   function Name (N : Node_Id) return Name_Id;
   procedure Set_Name (N : Node_Id; V : Name_Id);

   function Corresponding_Node (N : Node_Id) return Node_Id;
   procedure Set_Corresponding_Node (N : Node_Id; V : Node_Id);

   function Parent_Unit_Name (N : Node_Id) return Node_Id;
   procedure Set_Parent_Unit_Name (N : Node_Id; V : Node_Id);

   function Visibility (N : Node_Id) return List_Id;
   procedure Set_Visibility (N : Node_Id; V : List_Id);

   function Return_Type (N : Node_Id) return Node_Id;
   procedure Set_Return_Type (N : Node_Id; V : Node_Id);

   function Parameters (N : Node_Id) return List_Id;
   procedure Set_Parameters (N : Node_Id; V : List_Id);

   function Throws (N : Node_Id) return List_Id;
   procedure Set_Throws (N : Node_Id; V : List_Id);

   function Specification (N : Node_Id) return Node_Id;
   procedure Set_Specification (N : Node_Id; V : Node_Id);

   function Declarations (N : Node_Id) return List_Id;
   procedure Set_Declarations (N : Node_Id; V : List_Id);

   function Statements (N : Node_Id) return List_Id;
   procedure Set_Statements (N : Node_Id; V : List_Id);

   function Parameter_Type (N : Node_Id) return Node_Id;
   procedure Set_Parameter_Type (N : Node_Id; V : Node_Id);

   function Package_Name (N : Node_Id) return Node_Id;
   procedure Set_Package_Name (N : Node_Id; V : Node_Id);

   function Import (N : Node_Id) return List_Id;
   procedure Set_Import (N : Node_Id; V : List_Id);

   function Class (N : Node_Id) return Node_Id;
   procedure Set_Class (N : Node_Id; V : Node_Id);

   function Has_Header_Spaces (N : Node_Id) return Boolean;
   procedure Set_Has_Header_Spaces (N : Node_Id; V : Boolean);

   function Import_Name (N : Node_Id) return Node_Id;
   procedure Set_Import_Name (N : Node_Id; V : Node_Id);

   function Expr (N : Node_Id) return Node_Id;
   procedure Set_Expr (N : Node_Id; V : Node_Id);

   function Case_Statements (N : Node_Id) return List_Id;
   procedure Set_Case_Statements (N : Node_Id; V : List_Id);

   function Labels (N : Node_Id) return List_Id;
   procedure Set_Labels (N : Node_Id; V : List_Id);

   function Init_Statement (N : Node_Id) return Node_Id;
   procedure Set_Init_Statement (N : Node_Id; V : Node_Id);

   function Iteration_Condition (N : Node_Id) return Node_Id;
   procedure Set_Iteration_Condition (N : Node_Id; V : Node_Id);

   function Step_Expression (N : Node_Id) return Node_Id;
   procedure Set_Step_Expression (N : Node_Id; V : Node_Id);

   function Expression (N : Node_Id) return Node_Id;
   procedure Set_Expression (N : Node_Id; V : Node_Id);

   function Cast_Type (N : Node_Id) return Node_Id;
   procedure Set_Cast_Type (N : Node_Id; V : Node_Id);

   function Array_Size (N : Node_Id) return Node_Id;
   procedure Set_Array_Size (N : Node_Id; V : Node_Id);

   function Array_Item (N : Node_Id) return Node_Id;
   procedure Set_Array_Item (N : Node_Id; V : Node_Id);

   function Array_Declaration (N : Node_Id) return Node_Id;
   procedure Set_Array_Declaration (N : Node_Id; V : Node_Id);

   function Array_Assignments (N : Node_Id) return List_Id;
   procedure Set_Array_Assignments (N : Node_Id; V : List_Id);

   function Extends_Statement (N : Node_Id) return Node_Id;
   procedure Set_Extends_Statement (N : Node_Id; V : Node_Id);

   function Implements_Statement (N : Node_Id) return List_Id;
   procedure Set_Implements_Statement (N : Node_Id; V : List_Id);

   function Throws_Statement (N : Node_Id) return List_Id;
   procedure Set_Throws_Statement (N : Node_Id; V : List_Id);

   function Attributes (N : Node_Id) return List_Id;
   procedure Set_Attributes (N : Node_Id; V : List_Id);

   function Methods (N : Node_Id) return List_Id;
   procedure Set_Methods (N : Node_Id; V : List_Id);

   function Classes (N : Node_Id) return List_Id;
   procedure Set_Classes (N : Node_Id; V : List_Id);

   function Is_Array (N : Node_Id) return Boolean;
   procedure Set_Is_Array (N : Node_Id; V : Boolean);

   function Catch_Statements (N : Node_Id) return List_Id;
   procedure Set_Catch_Statements (N : Node_Id; V : List_Id);

   function Exception_Caught (N : Node_Id) return Node_Id;
   procedure Set_Exception_Caught (N : Node_Id; V : Node_Id);

   function Used_Type (N : Node_Id) return Node_Id;
   procedure Set_Used_Type (N : Node_Id; V : Node_Id);

   function Value (N : Node_Id) return Node_Id;
   procedure Set_Value (N : Node_Id; V : Node_Id);

   function Value_Literal (N : Node_Id) return Value_Id;
   procedure Set_Value_Literal (N : Node_Id; V : Value_Id);

   function Right_Member (N : Node_Id) return Node_Id;
   procedure Set_Right_Member (N : Node_Id; V : Node_Id);

   function Left_Expression (N : Node_Id) return Node_Id;
   procedure Set_Left_Expression (N : Node_Id; V : Node_Id);

   function Operator_Expression (N : Node_Id) return Operator_Id;
   procedure Set_Operator_Expression (N : Node_Id; V : Operator_Id);

   function Right_Expression (N : Node_Id) return Node_Id;
   procedure Set_Right_Expression (N : Node_Id; V : Node_Id);

   function Enum_Members (N : Node_Id) return List_Id;
   procedure Set_Enum_Members (N : Node_Id; V : List_Id);

   function Image (N : Base_Type) return Name_Id;
   procedure Set_Image (N : Base_Type; V : Name_Id);

   function Main_Node (N : Node_Id) return Node_Id;
   procedure Set_Main_Node (N : Node_Id; V : Node_Id);

   function Type_Definition_Node (N : Node_Id) return Node_Id;
   procedure Set_Type_Definition_Node (N : Node_Id; V : Node_Id);

   function Feature_Subprogram_Node (N : Node_Id) return Node_Id;
   procedure Set_Feature_Subprogram_Node (N : Node_Id; V : Node_Id);

   function Subprogram_Node (N : Node_Id) return Node_Id;
   procedure Set_Subprogram_Node (N : Node_Id; V : Node_Id);

   function Activity_Node (N : Node_Id) return Node_Id;
   procedure Set_Activity_Node (N : Node_Id; V : Node_Id);

   function Subprograms_Node (N : Node_Id) return Node_Id;
   procedure Set_Subprograms_Node (N : Node_Id; V : Node_Id);

   function Generated_Types_Node (N : Node_Id) return Node_Id;
   procedure Set_Generated_Types_Node (N : Node_Id; V : Node_Id);

   function Transport_Node (N : Node_Id) return Node_Id;
   procedure Set_Transport_Node (N : Node_Id; V : Node_Id);

   function Deployment_Node (N : Node_Id) return Node_Id;
   procedure Set_Deployment_Node (N : Node_Id; V : Node_Id);

   function Naming_Node (N : Node_Id) return Node_Id;
   procedure Set_Naming_Node (N : Node_Id; V : Node_Id);

   function Transport_High_Level_Node (N : Node_Id) return Node_Id;
   procedure Set_Transport_High_Level_Node (N : Node_Id; V : Node_Id);

   function Enumerator_Node (N : Node_Id) return Node_Id;
   procedure Set_Enumerator_Node (N : Node_Id; V : Node_Id);

   function Units (N : Node_Id) return List_Id;
   procedure Set_Units (N : Node_Id; V : List_Id);

   function HI_Nodes (N : Node_Id) return List_Id;
   procedure Set_HI_Nodes (N : Node_Id; V : List_Id);

   function Distributed_Application (N : Node_Id) return Node_Id;
   procedure Set_Distributed_Application (N : Node_Id; V : Node_Id);

   function Distributed_Application_Unit (N : Node_Id) return Node_Id;
   procedure Set_Distributed_Application_Unit (N : Node_Id; V : Node_Id);

   function Imported_Headers (N : Node_Id) return List_Id;
   procedure Set_Imported_Headers (N : Node_Id; V : List_Id);

   function Sources (N : Node_Id) return List_Id;
   procedure Set_Sources (N : Node_Id; V : List_Id);

   function Entity (N : Node_Id) return Node_Id;
   procedure Set_Entity (N : Node_Id; V : Node_Id);

   function Main_Source (N : Node_Id) return Node_Id;
   procedure Set_Main_Source (N : Node_Id; V : Node_Id);

   function Activity_Source (N : Node_Id) return Node_Id;
   procedure Set_Activity_Source (N : Node_Id; V : Node_Id);

   function Deployment_Source (N : Node_Id) return Node_Id;
   procedure Set_Deployment_Source (N : Node_Id; V : Node_Id);

   function Subprograms_Source (N : Node_Id) return Node_Id;
   procedure Set_Subprograms_Source (N : Node_Id; V : Node_Id);

   function Marshallers_Source (N : Node_Id) return Node_Id;
   procedure Set_Marshallers_Source (N : Node_Id; V : Node_Id);

   function Naming_Source (N : Node_Id) return Node_Id;
   procedure Set_Naming_Source (N : Node_Id; V : Node_Id);

   function Request_Source (N : Node_Id) return Node_Id;
   procedure Set_Request_Source (N : Node_Id; V : Node_Id);

   function Generated_Types_Source (N : Node_Id) return Node_Id;
   procedure Set_Generated_Types_Source (N : Node_Id; V : Node_Id);

   function Transport_High_Level_Source (N : Node_Id) return Node_Id;
   procedure Set_Transport_High_Level_Source (N : Node_Id; V : Node_Id);

   procedure W_Node (N : Node_Id);

   type Boolean_Array is array (1 .. 1) of Boolean;
   type Byte_Array is array (1 .. 1) of Byte;
   type Int_Array is array (1 .. 13) of Int;

   type Node_Entry is record
      Kind : Node_Kind;
      B : Boolean_Array;
      O : Byte_Array;
      L : Int_Array;
      Loc : Location;
   end record;

   Default_Node : constant Node_Entry :=
     (Node_Kind'First,
      (others => False),
      (others => 0),
      (others => 0),
      No_Location);

   package Entries is new GNAT.Table
     (Node_Entry, Node_Id, No_Node + 1, 1000, 100);

end Ocarina.Backends.RTSJ_Tree.Nodes;

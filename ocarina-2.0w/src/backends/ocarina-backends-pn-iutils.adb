------------------------------------------------------------------------------
--                                                                          --
--                           OCARINA COMPONENTS                             --
--                                                                          --
--           O C A R I N A . B A C K E N D S . P N . I U T I L S            --
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

with Ocarina.AADL_Values;
with Namet;
with Ocarina.Instances.Queries;

with Ocarina.Backends.PN.Nodes;
with Ocarina.Backends.PN.Nutils;

with Ocarina.ME_AADL.AADL_Instances.Nodes;

with Ocarina.ME_AADL.AADL_Instances.Entities;
with Ocarina.ME_AADL;

with Ocarina.Backends.PN.Debug;
with Ocarina.Backends.Utils;

package body Ocarina.Backends.PN.Iutils is

   package AIN renames Ocarina.ME_AADL.AADL_Instances.Nodes;
   package OPND renames Ocarina.Backends.PN.Debug;

   --------------------------
   -- Pn_Init_Pn_Generated --
   --------------------------

   procedure Pn_Init_Pn_Generated
     (G : Types.Node_Id;
      F : Types.Value_Id)
   is
      use Ocarina.Backends.PN.Nodes;
      use Ocarina.Backends.PN.Nutils;

   begin

      --  init pn_box
      Set_Pn_Box (G, New_Node (K_Pn_Box));
      Set_Pn_Subcomponents (Pn_Box (G), New_List (K_List_Id));
      Set_Pn_Interconnections (Pn_Box (G), New_List (K_List_Id));

      case F is
         when 0 =>
            Set_Pn_Formalism_Specific_Informations
              (G,
               New_Node (K_CPN_Specific_Informations));
         when 1 =>
            Set_Pn_Formalism_Specific_Informations
              (G,
               New_Node (K_TPN_Specific_Informations));
         when others =>
            null;
      end case;
      Set_Formalism (G, F);

   end Pn_Init_Pn_Generated;

   -----------------------------
   -- Pn_Get_New_Pn_Generated --
   -----------------------------

   function Pn_Get_New_Pn_Generated
     return Types.Node_Id
   is
      use Ocarina.Backends.PN.Nutils;
      use Ocarina.Backends.PN.Nodes;
      use Ocarina.Aadl_Values;

      G : constant Node_Id := New_Node (K_Pn_Generated);
   begin

      Set_Pn_Box (G, No_Node);
      Set_Pn_Formalism_Specific_Informations (G, No_Node);
      Set_Formalism (G, New_Integer_Value (0));

      return G;
   end Pn_Get_New_Pn_Generated;

   -----------------------------------
   --  Pn_Get_New_TPn_Informations  --
   -----------------------------------

   function Pn_Get_New_TPn_Informations
     return Types.Node_Id
   is
      use Ocarina.Backends.PN.Nutils;
      use Ocarina.Backends.PN.Nodes;
      use Ocarina.Aadl_Values;

      I : constant Node_Id := New_Node (K_TPN_Specific_Informations);
   begin
      Set_Th_Number (I, New_Integer_Value (0));
      Set_Hyperperiod (I, New_Integer_Value (1));
      Set_Priorities (I, New_List (K_List_Id));

      return I;
   end Pn_Get_New_TPn_Informations;

   -------------------------------------
   --  Pn_Get_New_Processor_Priority  --
   -------------------------------------

   function Pn_Get_New_Processor_Priority
     return Types.Node_Id
   is
      use Ocarina.Backends.PN.Nutils;
      use Ocarina.Backends.PN.Nodes;

      PP : constant Node_Id := New_Node (K_TPN_Processor_Priority);
   begin
      return PP;
   end Pn_Get_New_Processor_Priority;

   ----------------------------------
   --  Pn_Init_Processor_Priority  --
   ----------------------------------

   procedure Pn_Init_Processor_Priority
     (Pn_Proc : Types.Node_Id;
      Aadl_P : Types.Node_Id)
   is
      use Ocarina.Backends.PN.Nutils;
      use Ocarina.Backends.PN.Nodes;
   begin
      Set_P_Instance (Pn_Proc, Aadl_P);
      Set_Bounded_Trans (Pn_Proc, New_List (K_List_Id));
   end Pn_Init_Processor_Priority;

   ---------------------------------
   --  Append_Trans_To_Processor  --
   ---------------------------------

   procedure Append_Trans_To_Processor
     (Pn_T : Types.Node_Id;
      Pn_Proc : Types.Node_Id)
   is
      use Ocarina.Backends.PN.Nutils;
      use Ocarina.Backends.PN.Nodes;
      use Ocarina.Aadl_Values;

   begin
      if Pn_T /= No_Node and then Pn_Proc /= No_Node then
         if OPN.Kind (Pn_T) = K_TPN_Transition
           and then OPN.Kind (Pn_Proc)
           = K_TPN_Processor_Priority then
            declare
               Node_Iter : Node_Id;
               Current_Prio : Value_Type;
               Iter_Prio : Value_Type;
            begin
               if Is_Empty (Bounded_Trans (Pn_Proc)) then
                  declare
                     --  new trans to avoid
                     --  melting next_node
                     New_Trans : Node_Id;
                  begin
                     New_Trans := Pn_Tpn_Get_New_Transition;
                     Set_Priority (New_Trans, Priority (Pn_T));
                     Set_Identifier (New_Trans,
                                     Identifier (Pn_T));
                     Append_Node_To_List (New_Trans, Bounded_Trans (Pn_Proc));
                  end;
               else
                  Node_Iter := OPN.First_Node (Bounded_Trans (Pn_Proc));
                  Current_Prio := Get_Value_Type (Priority (Pn_T));
                  Iter_Prio := Get_Value_Type (Priority (Node_Iter));
                  if Current_Prio.Ival >= Iter_Prio.Ival then
                     --  push in
                     declare
                        --  new trans to avoid
                        --  melting next_node
                        New_Trans : Node_Id;
                     begin
                        New_Trans := Pn_Tpn_Get_New_Transition;
                        Set_Priority (New_Trans, Priority (Pn_T));
                        Set_Identifier (New_Trans,
                                        Identifier (Pn_T));

                        Push_Node_Into_List (New_Trans,
                                             Bounded_Trans
                                             (Pn_Proc));
                     end;
                  else
                     --  need to run across others
                     while Present (Node_Iter) loop
                        if Current_Prio.Ival < Iter_Prio.Ival then
                           --  here, we will have to do another step
                           declare
                              Next_Iter : Node_Id;
                              Next_Iter_Prio : Value_Type;
                           begin
                              Next_Iter := OPN.Next_Node (Node_Iter);
                              if Next_Iter = No_Node then
                                 --  append here
                                 declare
                                    --  new trans to avoid
                                    --  melting next_node
                                    New_Trans : Node_Id;
                                 begin
                                    New_Trans := Pn_Tpn_Get_New_Transition;
                                    Set_Priority (New_Trans, Priority (Pn_T));
                                    Set_Identifier (New_Trans,
                                                    Identifier (Pn_T));

                                    Append_Node_To_List (New_Trans,
                                                         Bounded_Trans
                                                         (Pn_Proc));
                                    --  leave loop
                                    exit;
                                 end;
                              else
                                 Next_Iter_Prio := Get_Value_Type
                                   (Priority (Next_Iter));
                                 if Current_Prio.Ival
                                   >= Next_Iter_Prio.Ival then
                                    --  insert in list
                                    declare
                                       --  new trans to avoid
                                       --  melting next_node
                                       New_Trans : Node_Id;
                                    begin
                                       New_Trans := Pn_Tpn_Get_New_Transition;
                                       Set_Priority (New_Trans,
                                                     Priority (Pn_T));
                                       Set_Identifier (New_Trans,
                                                       Identifier (Pn_T));

                                       Set_Next_Node (Node_Iter, New_Trans);
                                       Set_Next_Node (New_Trans, Next_Iter);
                                       --  leave loop
                                       exit;
                                    end;
                                 end if;
                              end if;
                           end;
                        end if;
                        --  next
                        Node_Iter := OPN.Next_Node (Node_Iter);
                     end loop;
                  end if;
               end if;
            end;

         end if;
      end if;
   end Append_Trans_To_Processor;

   ------------------------------------
   --  Pn_Get_New_Processor_Pattern  --
   ------------------------------------

   function Pn_Get_New_Processor_Pattern
     return Types.Node_Id
   is
      use Ocarina.Backends.PN.Nodes;
      use Ocarina.Backends.PN.Nutils;

      P : constant Node_Id := New_Node (K_Processor_Pattern);
   begin
      return P;
   end Pn_Get_New_Processor_Pattern;

   ---------------------------------
   --  Pn_Init_Processor_Pattern  --
   ---------------------------------

   procedure Pn_Init_Processor_Pattern
     (Pn_Proc : Types.Node_Id;
      Aadl_P : Types.Node_Id)
   is
      use Ocarina.Backends.PN.Nodes;
      use Ocarina.Backends.PN.Nutils;
      use Ocarina.Aadl_Values;

   begin

      if Pn_Proc /= No_Node
        and then Aadl_P /= No_Node then
         Pn_Init_Pn_Component (Pn_Proc, Aadl_P);

         Set_Proc_Instance (Pn_Proc, Aadl_P);
      end if;
   end Pn_Init_Processor_Pattern;
   -------------------------------
   -- Pn_Get_New_Thread_Pattern --
   -------------------------------

   function Pn_Get_New_Thread_Pattern
     return Types.Node_Id
   is
      use Ocarina.Backends.PN.Nodes;
      use Ocarina.Backends.PN.Nutils;

      T : constant Node_Id := New_Node (K_Thread_Pattern);
   begin
      return T;
   end Pn_Get_New_Thread_Pattern;

   ----------------------------
   -- Pn_Init_Thread_Pattern --
   ----------------------------

   procedure Pn_Init_Thread_Pattern
     (Pn_T : Types.Node_Id;
      Aadl_T : Types.Node_Id)
   is
      use Ocarina.Backends.PN.Nodes;
      use Ocarina.Backends.PN.Nutils;
      use Ocarina.Aadl_Values;

   begin

      if Pn_T /= No_Node and then Aadl_T /= No_Node then
         Pn_Init_Pn_Component (Pn_T, Aadl_T);

         Set_In_Ports (Pn_T, New_List (K_List_Id));
         Set_Out_Ports (Pn_T, New_List (K_List_Id));
         Set_Hyperperiod (Pn_T, New_Integer_Value (0));
         Set_Call_Seq (Pn_T, New_List (K_List_Id));
         Set_Th_Instance (Pn_T, Aadl_T);
      end if;

   end Pn_Init_Thread_Pattern;

   -------------------------------
   -- Pn_Get_New_Port_Pattern --
   -------------------------------

   function Pn_Get_New_Port_Pattern
     return Types.Node_Id
   is
      use Ocarina.Backends.PN.Nodes;
      use Ocarina.Backends.PN.Nutils;

      P : constant Node_Id := New_Node (K_Port_Pattern);
   begin
      return P;
   end Pn_Get_New_Port_Pattern;

   ----------------------------
   -- Pn_Init_Port_Pattern --
   ----------------------------

   procedure Pn_Init_Port_Pattern
     (Pn_P : Types.Node_Id;
      Aadl_P : Types.Node_Id)
   is
      use Ocarina.Backends.PN.Nodes;
      use Ocarina.Backends.PN.Nutils;
      use Ocarina.Aadl_Values;

   begin

      if Pn_P /= No_Node and then Aadl_P /= No_Node then
         Pn_Init_Pn_Component (Pn_P, Aadl_P);

         Set_Port_Instance (Pn_P, Aadl_P);
         Set_Source_Instance (Pn_P, No_Node);
         Set_Target_Instance (Pn_P, No_Node);
      end if;

   end Pn_Init_Port_Pattern;

   ---------------------------------
   --  Pn_Get_New_D_Port_Pattern  --
   ---------------------------------

   function Pn_Get_New_D_Port_Pattern
     return Types.Node_Id
   is
      use Ocarina.Backends.PN.Nodes;
      use Ocarina.Backends.PN.Nutils;

      DP : constant Node_Id := New_Node (K_Data_Port_Pattern);
   begin
      return DP;
   end Pn_Get_New_D_Port_Pattern;

   ------------------------------
   --  Pn_Init_D_Port_Pattern  --
   ------------------------------

   procedure Pn_Init_D_Port_Pattern
     (Pn_DP : Types.Node_Id;
      Aadl_DP : Types.Node_Id)
   is
      use Ocarina.Backends.PN.Nodes;
      use Ocarina.Backends.PN.Nutils;
      use Ocarina.Aadl_Values;

   begin

      if Pn_DP /= No_Node and then Aadl_DP /= No_Node then
         Pn_Init_Port_Pattern (Pn_DP, Aadl_DP);
      end if;
   end Pn_Init_D_Port_Pattern;

   ----------------------------------
   --  Pn_Get_New_ED_Port_Pattern  --
   ----------------------------------

   function Pn_Get_New_ED_Port_Pattern
     return Types.Node_Id
   is
      use Ocarina.Backends.PN.Nodes;
      use Ocarina.Backends.PN.Nutils;

      DEP : constant Node_Id := New_Node (K_Data_Event_Port_Pattern);
   begin
      return DEP;
   end Pn_Get_New_ED_Port_Pattern;

   -------------------------------
   --  Pn_Init_ED_Port_Pattern  --
   -------------------------------

   procedure Pn_Init_ED_Port_Pattern
     (Pn_DEP : Types.Node_Id;
      Aadl_DEP : Types.Node_Id)
   is
      use Ocarina.Backends.PN.Nodes;
      use Ocarina.Backends.PN.Nutils;
      use Ocarina.Aadl_Values;

   begin

      if Pn_DEP /= No_Node and then Aadl_DEP /= No_Node then
         Pn_Init_Port_Pattern (Pn_DEP, Aadl_DEP);

         Set_Queue_Size (Pn_DEP, New_Integer_Value (1));
         Set_Has_CEP (Pn_DEP, False);
         Set_Dispatch_Port (Pn_DEP, False);
      end if;
   end Pn_Init_ED_Port_Pattern;

   ---------------------------------
   -- PN_Get_New_Call_Seq_Pattern --
   ---------------------------------

   function Pn_Get_New_Call_Seq_Pattern
     return Types.Node_Id
   is
      use Ocarina.Backends.PN.Nodes;
      use Ocarina.Backends.PN.Nutils;

      CS : constant Node_Id := New_Node (K_Call_Sequence_Pattern);
   begin
      return CS;

   end Pn_Get_New_Call_Seq_Pattern;

   ------------------------------
   -- Pn_Init_Call_Seq_Pattern --
   ------------------------------

   procedure Pn_Init_Call_Seq_Pattern
     (Pn_CS : Types.Node_Id;
      Aadl_T : Types.Node_Id)
   is
      use Ocarina.Backends.PN.Nodes;
      use Ocarina.Backends.PN.Nutils;
   begin

      if Pn_CS /= No_Node and then Aadl_T /= No_Node then
         Pn_Init_Pn_Component (Pn_CS, Aadl_T);

         Set_Spg_Call (Pn_CS, New_List (K_List_Id));
      end if;

   end Pn_Init_Call_Seq_Pattern;

   ----------------------------
   -- Pn_Get_New_Spg_Pattern --
   ----------------------------

   function Pn_Get_New_Spg_Pattern
     return Types.Node_Id
   is
      use Ocarina.Backends.PN.Nodes;
      use Ocarina.Backends.PN.Nutils;

      SPG : constant Node_Id := New_Node (K_Subprogram_Call_Pattern);
   begin
      return SPG;
   end Pn_Get_New_Spg_Pattern;

   -------------------------
   -- Pn_Init_Spg_Pattern --
   -------------------------

   procedure Pn_Init_Spg_Pattern
     (Pn_Spg : Types.Node_Id;
      Aadl_Spg : Types.Node_Id)
   is
      use Ocarina.Backends.PN.Nodes;
      use Ocarina.Backends.PN.Nutils;
   begin
      if Pn_Spg /= No_Node and then Aadl_Spg /= No_Node then
         Pn_Init_Pn_Component (Pn_Spg, Aadl_Spg);

         Set_Param_In (Pn_Spg, New_List (K_List_Id));
         Set_Param_Out (Pn_Spg, New_List (K_List_Id));
      end if;
   end Pn_Init_Spg_Pattern;

   --------------------------------
   -- Pn_Get_New_Spg_Par_Pattern --
   --------------------------------

   function Pn_Get_New_Spg_Par_Pattern
     return Types.Node_Id
   is
      use Ocarina.Backends.PN.Nodes;
      use Ocarina.Backends.PN.Nutils;

      SPG_PAR : constant Node_Id := New_Node (K_Spg_Parameter_Pattern);
   begin
      return SPG_PAR;
   end Pn_Get_New_Spg_Par_Pattern;

   -----------------------------
   -- Pn_Init_Spg_Par_Pattern --
   -----------------------------

   procedure Pn_Init_Spg_Par_Pattern
     (Pn_Spg_Par : Types.Node_Id;
      Aadl_Spg_Par : Types.Node_Id)
   is
      use Ocarina.Backends.PN.Nodes;
      use Ocarina.Backends.PN.Nutils;
   begin
      if Pn_Spg_Par /= No_Node and then Aadl_Spg_Par /= No_Node then
         Pn_Init_Pn_Component (Pn_Spg_Par, Aadl_Spg_Par);

         Set_Par_Instance (Pn_Spg_Par, Aadl_Spg_Par);
      end if;
   end Pn_Init_Spg_Par_Pattern;

   ---------------------------
   --  Pn_Init_Pn_Component --
   ---------------------------

   procedure Pn_Init_Pn_Component
     (Pn_C : Types.Node_Id;
      Aadl_C : Types.Node_Id)
   is
      use Ocarina.Backends.PN.Nodes;
      use Ocarina.Backends.PN.Nutils;
      use Namet;

   begin

      if Pn_C /= No_Node and then Aadl_C /= No_Node then
         Set_Str_To_Name_Buffer ("::");
         Pn_Init_Pn_Node (Pn_C, Aadl_C, Name_Find);

         Set_Public_Interfaces (Pn_C, New_List (K_List_Id));
         Set_Internal_Transitions (Pn_C, New_List (K_List_Id));
         Set_Internal_Places (Pn_C, New_List (K_List_Id));
      end if;

   end Pn_Init_Pn_Component;

   ---------------------
   -- Pn_Init_Pn_Node --
   ---------------------

   procedure Pn_Init_Pn_Node
     (Pn_N : Types.Node_Id;
      Aadl_N : Types.Node_Id;
      Name : Types.Name_id)
   is
      use Ocarina.Backends.PN.Nodes;
      use Ocarina.Backends.PN.Nutils;
      use Namet;
      use Ocarina.Instances.Queries;

   begin

      if Pn_N /= No_Node then
         Pn_Init_Node (Pn_N);
         if Aadl_N /= No_Node then
            Set_Str_To_Name_Buffer
              (Get_Name_String
               (Compute_Absolute_Name_Of_Entity
                (Aadl_N, Separator)));
            Add_Str_To_Name_Buffer (Get_Name_String (Name));
         else
            Set_Str_To_Name_Buffer (Get_Name_String (Name));
         end if;

         Set_Identifier
           (Pn_N,
            Make_Identifier
            (Pn_N,
             Name_Find));

      end if;

   end Pn_Init_Pn_Node;

   ---------------------
   -- Pn_Init_Node --
   ---------------------

   procedure Pn_Init_Node
     (N : Types.Node_Id)
   is
      use Ocarina.Backends.PN.Nodes;

   begin

      if N /= No_Node then
         Set_Next_Node (N, No_Node);
      end if;

   end Pn_Init_Node;

   -------------------------
   --  Pn_Tpn_Init_Place  --
   -------------------------

   procedure Pn_Tpn_Init_Place
     (P : Types.Node_Id;
      Aadl : Types.Node_Id;
      Name : Types.Name_Id;
      Pn_G : Types.Node_Id;
      M    : Unsigned_Long_Long)
   is
      use Ocarina.Backends.PN.Nodes;
      use Ocarina.Aadl_Values;

   begin

      if P /= No_Node and then Pn_G /= No_Node then
         Pn_Init_Place (P, Aadl, Name);

         Set_Tokens_Number (P, New_Integer_Value (0));
         --  compilation
         if M = 0 then
            null;
         end if;
      end if;

   end Pn_Tpn_Init_Place;

   -------------------------
   --  Pn_Init_Place  --
   -------------------------

   procedure Pn_Init_Place
     (P : Types.Node_Id;
      Aadl : Types.Node_Id;
      Name : Types.Name_Id)
   is
   begin

      if P /= No_Node then
         Pn_Init_Pn_Node (P, Aadl, Name);

      end if;

   end Pn_Init_Place;

   ----------------------------
   --  Pn_Tpn_Get_New_Place  --
   ----------------------------

   function Pn_Tpn_Get_New_Place
     return Types.Node_Id
   is
      use Ocarina.Backends.PN.Nodes;
      use Ocarina.Backends.PN.Nutils;

      P : constant Types.Node_Id := New_Node (K_TPN_Place);
   begin
      return P;
   end Pn_Tpn_Get_New_Place;

   -------------------------
   --  Pn_Tpn_Init_Transition  --
   -------------------------

   procedure Pn_Tpn_Init_Transition
     (T : Types.Node_Id;
      Aadl : Types.Node_Id;
      Name : Types.Name_Id;
      Pn_G : Types.Node_Id;
      M    : Unsigned_Long_Long)
   is
      use Ocarina.Backends.PN.Nodes;
      use Ocarina.Aadl_Values;
      use Ocarina.Backends.PN.Nutils;

   begin

      if T /= No_Node and then Pn_G /= No_Node then
         Pn_Init_Transition (T, Aadl, Name);

         --  default : immediate transitions
         Set_Guard (T, New_Node (K_TPN_Guard));
         Set_Lower_Value (Guard (T), New_Integer_Value (0));
         Set_Higher_Value (Guard (T), New_Integer_Value (-1));
         Set_Braces_Mode (Guard (T), New_Integer_Value (2));

         Set_Priority (T, New_Integer_Value (0));

         --  compilation
         if M = 0 then
            null;
         end if;
      end if;

   end Pn_Tpn_Init_Transition;

   -------------------------
   --  Pn_Init_Transition  --
   -------------------------

   procedure Pn_Init_Transition
     (T : Types.Node_Id;
      Aadl : Types.Node_Id;
      Name : Types.Name_Id)
   is
      use Ocarina.Backends.PN.Nodes;
      use Ocarina.Backends.PN.Nutils;

   begin

      if T /= No_Node then
         Pn_Init_Pn_Node (T, Aadl, Name);

         Set_Pn_Arcs_In (T, New_List (K_List_Id));
         Set_Pn_Arcs_Out (T, New_List (K_List_Id));

      end if;

   end Pn_Init_Transition;

   ---------------------------------
   --  Pn_Tpn_Get_New_Transition  --
   ---------------------------------

   function Pn_Tpn_Get_New_Transition
     return Types.Node_Id
   is
      use Ocarina.Backends.PN.Nodes;
      use Ocarina.Backends.PN.Nutils;

      P : constant Types.Node_Id := New_Node (K_TPN_Transition);
   begin
      return P;
   end Pn_Tpn_Get_New_Transition;

   ------------------------
   --  Pn_Tpn_Set_Guard  --
   ------------------------

   procedure Pn_Tpn_Set_Guard
     (T : Types.Node_Id;
      Low, Up : Types.Value_Id;
      Braces_Mode : Types.Value_Id;
      Priority : Types.Value_Id)
   is
      use Ocarina.Backends.PN.Nodes;
      use Ocarina.Aadl_Values;

   begin

      if T /= No_Node then

         Set_Lower_Value (Guard (T), Low);
         Set_Higher_Value (Guard (T), Up);
         Set_Braces_Mode (Guard (T), Braces_Mode);
         Set_Priority (T, Priority);

      end if;

   end Pn_Tpn_Set_Guard;

   --------------------------
   --  Pn_Tpn_Get_New_Arc  --
   --------------------------

   function Pn_Tpn_Get_New_Arc
     return Types.Node_Id
   is
      use Ocarina.Backends.PN.Nodes;
      use Ocarina.Backends.PN.Nutils;

      A : constant Types.Node_Id := New_Node (K_TPN_Arc);
   begin
      return A;
   end Pn_Tpn_Get_New_Arc;

   ----------------------------
   --  Pn_Tpn_Duplicate_Arc  --
   ----------------------------

   procedure Pn_Tpn_Duplicate_Arc
     (A : Types.Node_Id;
      A_Inst : Types.Node_Id;
      Endpoint : Types.Node_Id;
      From : Boolean := False)
   is
      use Ocarina.Backends.PN.Nodes;
      use Ocarina.Aadl_Values;
      use Namet;
      use Ocarina.Instances.Queries;
      use Ocarina.Backends.PN.Nutils;

      New_Arc : Types.Node_Id;
   begin
      New_Arc := Pn_Tpn_Get_New_Arc;
      if From then
         Pn_Tpn_Init_Arc (New_Arc,
                          A_Inst,
                          Endpoint,
                          Pn_To (A));
         Append_Node_To_List (New_Arc,
                              Pn_Arcs_Out (Endpoint));
      else
         Pn_Tpn_Init_Arc (New_Arc,
                          A_Inst,
                          Pn_From (A),
                          Endpoint);
         Append_Node_To_List (New_Arc,
                              Pn_Arcs_In (Endpoint));
      end if;
   end Pn_Tpn_Duplicate_Arc;

   -----------------------
   --  Pn_Tpn_Init_Arc  --
   -----------------------

   procedure Pn_Tpn_Init_Arc
     (A : Types.Node_Id;
      Aadl : Types.Node_Id;
      From : Types.Node_Id := No_Node;
      To : Types.Node_Id := No_Node;
      K : Unsigned_Long_Long := 0)
   is
      use Ocarina.Backends.PN.Nodes;
      use Ocarina.Aadl_Values;
      use Namet;
      use Ocarina.Instances.Queries;

   begin

      if A /= No_Node then
         Set_Str_To_Name_Buffer ("_a_");
         Pn_Init_Arc (A, Aadl, From, To, Name_Find);

         Set_is_Priority (A, False);
         Set_Valuation (A, New_Integer_Value (K));

      end if;

   end Pn_Tpn_Init_Arc;

   -------------------
   --  Pn_Init_Arc  --
   -------------------

   procedure Pn_Init_Arc
     (A : Types.Node_Id;
      Aadl : Types.Node_Id;
      From : Types.Node_Id;
      To : Types.Node_Id;
      Name : Types.Name_Id)
   is
      use Ocarina.Backends.PN.Nodes;

   begin

      if A /= No_Node then
         Pn_Init_Pn_Node (A, Aadl, Name);

         Set_Pn_From (A, From);
         Set_Pn_To (A, To);

      end if;

   end Pn_Init_Arc;

   ----------------------------

   -----------------------------------
   --  Pn_Get_New_CPn_Informations  --
   -----------------------------------

   function Pn_Get_New_CPn_Informations
     return Types.Node_Id
   is
      use Ocarina.Backends.PN.Nutils;
      use Ocarina.Backends.PN.Nodes;
      use Ocarina.Aadl_Values;
      use Namet;

      I : constant Node_Id := New_Node (K_CPN_Specific_Informations);
   begin

      Set_Classes (I, New_Node (K_CPN_Formalism_Classes));
      Set_Class_List (Classes (I), New_List (K_List_Id));
      --  two default classes : threads_id and messages
      declare
         Th_Ids : constant Node_Id
           := New_Node (K_CPN_Formalism_Class_Item_Range);
         Msg_T : constant Node_Id
           := New_Node (K_CPN_Formalism_Class_Item_Enum);
      begin
         Pn_Init_Pn_Node (Th_Ids,
                          No_Node,
                          Get_String_Name ("Threads_Ids"));
         Append_Node_To_List (Th_Ids,
                              Class_List (Classes (I)));

         Pn_Init_Pn_Node (Msg_T,
                          No_Node,
                          Get_String_Name ("Msg_Types"));
         Set_Enum (Msg_T, New_List (K_List_Id));
         declare
            Class_Iter : constant Node_Id
              := New_Node (K_CPN_Formalism_Class_Item_Enum_Item);
         begin
            Pn_Init_Pn_Node (Class_Iter,
                             No_Node,
                             Get_String_Name ("msg"));
            Append_Node_To_List (Class_Iter,
                                 Enum (Msg_T));
         end;

         Append_Node_To_List (Msg_T,
                              Class_List (Classes (I)));
      end;
      ----
      Set_Domains (I, New_List (K_List_Id));
      --  default domain messages = <th_id x msg_type>
      Append_Node_To_List (New_Node (K_CPN_Formalism_Domains),
                           Domains (I));
      Pn_Init_Pn_Node (OPN.First_Node (Domains (I)),
                       No_Node,
                       Get_String_Name ("mess"));
      Set_Domain_List (OPN.First_Node (Domains (I)), New_List (K_List_Id));

      declare
         Dom_Th_Id : constant Node_Id
           := New_Node (K_CPN_Formalism_Class_Item_Range);
         Dom_Msg : constant Node_Id
           := New_Node (K_CPN_Formalism_Class_Item_Enum_Item);
      begin
         Pn_Init_Pn_Node (Dom_Th_Id,
                          No_Node,
                          Name (Identifier (OPN.First_Node
                                            (Class_List
                                             (Classes (I))))));
         Append_Node_To_List (Dom_Th_Id,
                              Domain_List (OPN.First_Node (Domains (I))));

         Pn_Init_Pn_Node (Dom_Msg,
                          No_Node,
                          Name (Identifier (OPN.Next_Node
                                (OPN.First_Node (Class_List (Classes (I)))))));
         Append_Node_To_List (Dom_Msg,
                              Domain_List (OPN.First_Node (Domains (I))));
      end;
      ----
      Set_Variables (I, New_List (K_List_Id));
      --  init for default classes
      declare
         Class_Iter : Node_Id := OPN.First_Node (Class_List (Classes (I)));
         Var_Node : Node_Id;
      begin
         while Present (Class_Iter) loop
            Var_Node := New_Node (K_CPN_Formalism_Variables);
            Set_Class_Type (Var_Node, Class_Iter);
            Set_Variable_List (Var_Node, New_List (K_List_Id));

            Append_Node_To_List (Var_Node,
                                 Variables (I));
            --  next
            Class_Iter := OPN.Next_Node (Class_Iter);
         end loop;
      end;
      --  default variables are x and y in th_ids, and m in Msg
      declare
         X : constant Node_Id := New_Node (K_CPN_Formalism_Variable_Item);
         Y : constant Node_Id := New_Node (K_CPN_Formalism_Variable_Item);
         M : constant Node_Id := New_Node (K_CPN_Formalism_Variable_Item);
      begin
         Pn_Init_Pn_Node (X, No_Node, Get_String_Name ("x"));
         Pn_Init_Pn_Node (Y, No_Node, Get_String_Name ("y"));
         Pn_Init_Pn_Node (M, No_Node, Get_String_Name ("m"));

         Append_Node_To_List (X,
                              Variable_List (OPN.First_Node (Variables (I))));
         Append_Node_To_List (Y,
                              Variable_List (OPN.First_Node (Variables (I))));
         Append_Node_To_List (M,
                              Variable_List
                              (OPN.Next_Node
                               (OPN.First_Node (Variables (I)))));
      end;

      ----
      Set_Threads_Count (I, New_Integer_Value (0));
      Set_Threads_Ids (I, New_List (K_List_Id));
      Set_Ports_Ids (I, New_List (K_List_Id));

      return I;
   end Pn_Get_New_CPn_Informations;

   ----------------------------
   --  Pn_Cpn_Get_New_Place  --
   ----------------------------

   function Pn_Cpn_Get_New_Place
     return Types.Node_Id
   is
      use Ocarina.Backends.PN.Nodes;
      use Ocarina.Backends.PN.Nutils;

      P : constant Types.Node_Id := New_Node (K_CPN_Place);
   begin
      return P;
   end Pn_Cpn_Get_New_Place;

   -------------------------
   --  Pn_Cpn_Init_Place  --
   -------------------------

   procedure Pn_Cpn_Init_Place
     (P : Types.Node_Id;
      Aadl : Types.Node_Id;
      Name : Types.Name_Id;
      Pn_G : Types.Node_Id;
      M    : Unsigned_Long_Long)
   is
      use Ocarina.Backends.PN.Nodes;
      use Ocarina.Backends.PN.Nutils;
      use Namet;
      use Ocarina.AADL_Values;
      use Ocarina.ME_AADL.AADL_Instances.Entities;
      use Ocarina.ME_AADL;

   begin
      --  when Aadl is a thread, then the place holds thread id
      --  when it is a port, then the place holds a message type

      --  0 : event -> mess || data -> mess -> data marking
      --  1 : event -> marked uncolored
      Pn_Init_Place (P, Aadl, Name);

      Set_Marking (P, New_Node (K_CPN_Marking));
      Set_Tokens (Marking (P), New_List (K_List_Id));
      Set_Nb_T (P, New_Integer_Value (0));

      case AIN.Kind (Aadl) is
         when AIN.K_Port_Spec_Instance =>
            if M = 0 then
               --  mess domain
               Set_Domain (P, OPN.First_Node
                           (Domains (Pn_Formalism_Specific_Informations
                                     (Pn_G))));
               if not AIN.Is_Event (Aadl)
                 and then AIN.Is_In (AAdl) then
                  --  data marking
                  declare
                     V_Node : Node_Id
                       := New_Node (K_CPN_Marking_Token);
                  begin
                     Pn_Init_Pn_Node (V_Node,
                                      No_Node,
                                      Get_String_Name ("data"));
                     Append_Node_To_List (V_Node,
                                          Tokens (Marking (P)));

                     V_Node := New_Node (K_CPN_Marking_Token);
                     Pn_Init_Pn_Node (V_Node,
                                      No_Node,
                                      Get_String_Name ("0")); --  no th_id
                     Append_Node_To_List (V_Node,
                                          Tokens (Marking (P)));

                  end;

               end if;
            else
               --  uncolored
               Set_Domain (P, No_Node);
               --  set marking to 1
               Set_Nb_T (P, New_Integer_Value (1));
            end if;

         when others =>
            --  test for threads
            if Get_Category_Of_Component (Aadl)
              = CC_Thread then
               --  th_ids class
               Set_Domain (P, OPN.First_Node
                           (Class_List (Classes
                                        (Pn_Formalism_Specific_Informations
                                         (Pn_G)))));
            --  marking is set afterward
            end if;
      end case;
   end Pn_Cpn_Init_Place;

   ---------------------------------
   --  Pn_Cpn_Get_New_Transition  --
   ---------------------------------

   function Pn_Cpn_Get_New_Transition
     return Types.Node_Id
   is
      use Ocarina.Backends.PN.Nodes;
      use Ocarina.Backends.PN.Nutils;

      T : constant Types.Node_Id := New_Node (K_CPN_Transition);
   begin
      return T;
   end Pn_Cpn_Get_New_Transition;

   ------------------------------
   --  Pn_Cpn_Init_Transition  --
   ------------------------------

   procedure Pn_Cpn_Init_Transition
     (T : Types.Node_Id;
      Aadl : Types.Node_Id;
      Name : Types.Name_Id;
      Pn_G : Types.Node_Id;
      M    : Unsigned_Long_Long)
   is
      use Ocarina.Backends.PN.Nodes;
      use Ocarina.Aadl_Values;
      use Ocarina.Backends.PN.Nutils;

   begin
      if T /= No_Node and then Pn_G /= No_Node then
         Pn_Init_Transition (T, Aadl, Name);

         --  default : immediate transitions
         Set_Guards (T, New_List (K_List_Id));

         --  compilation
         if M = 0 then
            null;
         end if;
      end if;
   end Pn_Cpn_Init_Transition;

   --------------------------
   --  Pn_Cpn_Get_New_Arc  --
   --------------------------

   function Pn_Cpn_Get_New_Arc
     return Types.Node_Id
   is
      use Ocarina.Backends.PN.Nodes;
      use Ocarina.Backends.PN.Nutils;

      A : constant Types.Node_Id := New_Node (K_CPN_Arc);
   begin
      return A;
   end Pn_Cpn_Get_New_Arc;

   -----------------------
   --  Pn_Cpn_Init_Arc  --
   -----------------------

   procedure Pn_Cpn_Init_Arc
     (A : Types.Node_Id;
      Aadl : Types.Node_Id;
      From : Types.Node_Id := No_Node;
      To : Types.Node_Id := No_Node;
      K : Unsigned_Long_Long)
   is
      use Ocarina.Backends.PN.Nodes;
      use Ocarina.Aadl_Values;
      use Namet;
      use Ocarina.Instances.Queries;
      use Ocarina.Backends.PN.Nutils;
      use OPND;
      use Ocarina.Backends.Utils;

      Val : Node_Id := New_Node (K_CPN_Arc_Valuation);
   begin

      if A /= No_Node then
         Set_Str_To_Name_Buffer ("_a_");
         Pn_Init_Arc (A, Aadl, From, To, Name_Find);
         Set_Valuations (A, New_List (K_List_Id));

         case K is
            when 0 =>
               --  no valuation
               Pn_Init_Pn_Node (Val, No_Node, Get_String_Name ("1"));
               Set_Is_Colored (Val, False);
               Append_Node_To_List (Val, Valuations (A));
            when 1 =>
               --  from thread to thread
               Pn_Init_Pn_Node (Val, No_Node, Get_String_Name ("x"));
               Set_Is_Colored (Val, True);
               Append_Node_To_List (Val, Valuations (A));
            when 2 =>
               --  from port to thread or port to interconnection
               Pn_Init_Pn_Node (Val, No_Node, Get_String_Name ("y"));
               Set_Is_Colored (Val, True);
               Append_Node_To_List (Val, Valuations (A));
               Val :=  New_Node (K_CPN_Arc_Valuation);
               Pn_Init_Pn_Node (Val, No_Node, Get_String_Name ("m"));
               Set_Is_Colored (Val, True);
               Append_Node_To_List (Val, Valuations (A));
            when 3 =>
               --  from interconnection to port
               Pn_Init_Pn_Node (Val, No_Node, Get_String_Name ("x"));
               Set_Is_Colored (Val, True);
               Append_Node_To_List (Val, Valuations (A));
               Val :=  New_Node (K_CPN_Arc_Valuation);
               Pn_Init_Pn_Node (Val, No_Node, Get_String_Name ("m"));
               Set_Is_Colored (Val, True);
               Append_Node_To_List (Val, Valuations (A));
            when 4 =>
               --  from thread to port
               Pn_Init_Pn_Node (Val, No_Node, Get_String_Name ("x"));
               Set_Is_Colored (Val, True);
               Append_Node_To_List (Val, Valuations (A));
               Val :=  New_Node (K_CPN_Arc_Valuation);
               Pn_Init_Pn_Node (Val, No_Node, Get_String_Name ("msg"));
               Set_Is_Colored (Val, True);
               Append_Node_To_List (Val, Valuations (A));
            when 5 =>
               --  thread specific valuation
               --  find variable
               declare
                  Val_Handle : Node_Id
                    := Get_Handling (Aadl,
                                     By_Node,
                                     H_PN_Cpn_Var);
               begin

                  if Val_Handle = No_Node then
                     Pn_Init_Pn_Node (Val,
                                      No_Node,
                                      Get_String_Name
                                      ("x"
                                       & OPND.Image (Aadl)));
                     Set_Is_Colored (Val, True);
                     Set_Handling (Aadl,
                                   By_Node,
                                   H_PN_CPN_VAR,
                                   Val);
                     Val_Handle := Val;
                  end if;

                  Append_Node_To_List (Val_Handle, Valuations (A));
               end;
            when others =>
               null;
         end case;
      end if;
   end Pn_Cpn_Init_Arc;

   ----------------------------
   --  Pn_Cpn_Duplicate_Arc  --
   ----------------------------

   procedure Pn_Cpn_Duplicate_Arc
     (A : Types.Node_Id;
      A_Inst : Types.Node_Id;
      Endpoint : Types.Node_Id;
      From : Boolean := False)
   is
      use Ocarina.Backends.PN.Nodes;
      use Ocarina.Aadl_Values;
      use Namet;
      use Ocarina.Instances.Queries;
      use Ocarina.Backends.PN.Nutils;

      New_Arc : Types.Node_Id;
   begin
      New_Arc := Pn_Cpn_Get_New_Arc;
      if From then
         Pn_Cpn_Init_Arc (New_Arc,
                          A_Inst,
                          Endpoint,
                          Pn_To (A),
                          0);           --  changed right after
         Set_Valuations (New_Arc,
                         Valuations (A));

         Append_Node_To_List (New_Arc,
                              Pn_Arcs_Out (Endpoint));
      else
         Pn_Cpn_Init_Arc (New_Arc,
                          A_Inst,
                          Pn_From (A),
                          Endpoint,
                          0);           --  changed right after
         Set_Valuations (New_Arc,
                         Valuations (A));

         Append_Node_To_List (New_Arc,
                              Pn_Arcs_In (Endpoint));
      end if;
   end Pn_Cpn_Duplicate_Arc;

end Ocarina.Backends.PN.Iutils;

------------------------------------------------------------------------------
--                                                                          --
--                           OCARINA COMPONENTS                             --
--                                                                          --
--           O C A R I N A . T R A N S F O . O P T I M . E V A L            --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
--               Copyright (C) 2009-2010, GET-Telecom Paris.                --
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

with Ocarina.ME_REAL.REAL_Tree.Nutils;
with Ocarina.REAL_Values;
with Ocarina.Backends.REAL;
with Ocarina.Analyzer.REAL;
with Output;
with Namet;

package body Ocarina.Transfo.Optim.Eval is
   use Ocarina.REAL_Values;
   use Namet;
   use Output;

   package BR renames Ocarina.Backends.REAL;

   --  Theorem list
   Compute_WCET              : Name_Id;
   Compute_Memory            : Name_Id;
   Compute_Deadline_Distance : Name_Id;

   Compute_Deadline_Distance_Variation : Name_Id;
   Compute_WCET_Variation              : Name_Id;
   Compute_Memory_Variation            : Name_Id;
   Compute_Move_Memory_Variation       : Name_Id;

   --  Corresponding theorem nodes
   Compute_WCET_Theorem                        : Node_Id;
   Compute_Memory_Theorem                      : Node_Id;
   Compute_Deadline_Distance_Theorem           : Node_Id;

   Compute_Deadline_Distance_Variation_Theorem : Node_Id;
   Compute_WCET_Variation_Theorem              : Node_Id;
   Compute_Memory_Variation_Theorem            : Node_Id;
   Compute_Move_Memory_Variation_Theorem       : Node_Id;

   --  Current values
   Deadline_Distance_Value : Float;
   WCET_Value              : Float;
   Memory_Value            : Float;

   function Load_All_Theorems return Boolean;
   --  Search all needed theorems in library theorems, returns
   --  failure if at least one is not found, and print the first
   --  missing identity

   function Extract_Returned_Value (V : Value_Id) return Float;
   function ERV (V : Value_Id) return Float renames Extract_Returned_Value;
   --  Convert a REAL_Value into float

   function Compute_Multi_Criteria_Value
     (Memory, WCET : Float) return Float;
   --  Compute a system (or system variation) value from a set of criteria

   function Compute_Multi_Criteria_Cost
     (Deadline_Distance : Float) return Float;
   --  Compute a system (or system variation) cost from a set of criteria

   ----------
   -- Copy --
   ----------

   procedure Copy (Src : Solution_Set; Dst : out Solution_Set) is
      TU : Thread_Unit;
   begin
      Init (Dst);
      for I in Set.First .. Last (Src) loop
         TU.Thread_Node := Src.Table (I).Thread_Node;
         Append (Dst, TU);
      end loop;
   end Copy;

   ----------------------------
   -- Extract_Returned_Value --
   ----------------------------

   function Extract_Returned_Value (V : Value_Id) return Float
   is
   begin
      case Get_Value_Type (V).T is
         when LT_Real =>
            return Float (Get_Value_Type (V).RVal);
         when LT_Integer =>
            return Float (Get_Value_Type (V).IVal);
         when others =>
            raise Program_Error with "expected numeric value";
      end case;
   end Extract_Returned_Value;

   -----------------------
   -- Load_All_Theorems --
   -----------------------

   function Load_All_Theorems return Boolean
   is
      use Ocarina.ME_REAL.REAL_Tree.Nutils;
   begin
      --  1/ criteria evaluation theorems

      Compute_Deadline_Distance_Theorem := Find_Declared_Theorem
        (Compute_Deadline_Distance);
      if No (Compute_Deadline_Distance_Theorem) then
         Write_Line
           ("optim.eval: could not find theorem " &
            Get_Name_String (Compute_Deadline_Distance));
         return False;
      end if;

      Compute_WCET_Theorem := Find_Declared_Theorem (Compute_WCET);
      if No (Compute_WCET_Theorem) then
         Write_Line
           ("optim.eval: could not find theorem " &
            Get_Name_String (Compute_WCET));
         return False;
      end if;

      Compute_Memory_Theorem := Find_Declared_Theorem (Compute_Memory);
      if No (Compute_Memory_Theorem) then
         Write_Line
           ("optim.eval: could not find theorem " &
            Get_Name_String (Compute_Memory));
         return False;
      end if;

      --  2/ criteria variation evaluation theorems

      Compute_Deadline_Distance_Variation_Theorem := Find_Declared_Theorem
        (Compute_Deadline_Distance_Variation);
      if No (Compute_Deadline_Distance_Variation_Theorem) then
         Write_Line
           ("optim.eval: could not find theorem " &
            Get_Name_String (Compute_Deadline_Distance_Variation));
         return False;
      end if;

      Compute_WCET_Variation_Theorem := Find_Declared_Theorem
        (Compute_WCET_Variation);
      if No (Compute_WCET_Variation_Theorem) then
         Write_Line
           ("optim.eval: could not find theorem " &
            Get_Name_String (Compute_WCET_Variation));
         return False;
      end if;

      Compute_Memory_Variation_Theorem := Find_Declared_Theorem
        (Compute_Memory_Variation);
      if No (Compute_Memory_Variation_Theorem) then
         Write_Line
           ("optim.eval: could not find theorem " &
            Get_Name_String (Compute_Memory_Variation));
         return False;
      end if;

      --  3/ theorems for move operation
      Compute_Move_Memory_Variation_Theorem := Find_Declared_Theorem
        (Compute_Move_Memory_Variation);
      if No (Compute_Move_Memory_Variation_Theorem) then
         Write_Line
           ("optim.eval: could not find theorem " &
            Get_Name_String (Compute_Move_Memory_Variation));
         return False;
      end if;

      return True;
   end Load_All_Theorems;

   ------------------
   -- Build_Domain --
   ------------------

   function Build_Domain (Solution : Solution_Set) return Result_Set
   is
      use Set;

      RSet : Result_Set := Empty_Set;
      N    : Node_Id;
   begin
      for I in First .. Last (Solution) loop
         N := Solution.Table (I).Thread_Node;
         Add (RSet, N);
      end loop;

      return RSet;
   end Build_Domain;

   ----------
   -- Init --
   ----------

   procedure Init (AADL_Instance : Node_Id) is
      Success : Boolean;
   begin
      --  FIXME
      --  Must allow to reinitialize (analyze ? expantiate ?)  the aadl
      --  model

      Success := Ocarina.Analyzer.REAL.Analyze_Model (AADL_Instance);
      if not Success then
         raise Program_Error with "Cannot analyze REAL specifications";
      end if;

      Compute_WCET := Get_String_Name ("compute_wcet");
      Compute_Memory := Get_String_Name ("memory_consumption");
      Compute_Deadline_Distance := Get_String_Name
        ("compute_deadline_distance");
      Compute_Deadline_Distance_Variation := Get_String_Name
        ("compute_Deadline_Distance_variation");
      Compute_WCET_Variation := Get_String_Name
        ("compute_merging_cost_variation");
      --  FIXME
      --  TEMPORARY SHIFT
      --  ("compute_wcet_variation");

      Compute_Memory_Variation  := Get_String_Name
        ("memory_consumption_variation");
      Compute_Move_Memory_Variation := Get_String_Name
        ("move_memory_variation");

      if not Load_All_Theorems then
         raise Program_Error with "A theorem needed for evaluation "
           & "could not be found";
      end if;
   end Init;

   ---------------------------
   -- Compute_Relative_Cost --
   ---------------------------

   procedure Compute_Relative_Cost
     (Solution      : Solution_Set;
      Result        : out Float;
      Success       : out Boolean)
   is
      Local_Set      : Result_Set;
      Result_Latency : Value_Id;
   begin
      Success := True;

      --  1/ put in the domain (ie. the theorem local_set) the
      --  threads to be fusioned

      Local_Set := Build_Domain (Solution);

      --  2/ Call theorems that evaluate all potential costs from
      --  theses fusions

      BR.Compute_Theorem_Call
        (Compute_Deadline_Distance_Variation_Theorem,
         Local_Set, Result_Latency, Success);
      if not Success then
         Write_Line
           ("optim.eval: " & Get_Name_String
            (Compute_Deadline_Distance_Variation)
            & " failed");
         return;
      end if;

      Result := Compute_Multi_Criteria_Cost
        (ERV (Result_Latency));
   end Compute_Relative_Cost;

   ----------------------------
   -- Compute_Relative_Value --
   ----------------------------

   procedure Compute_Relative_Value
     (Solution      : Solution_Set;
      Result        : out Float;
      Success       : out Boolean)
   is
      Local_Set     : Result_Set;
      Result_Memory : Value_Id;
      Result_WCET   : Value_Id;
   begin
      Success := True;

      --  1/ put in the domain (ie. the theorem local_set) the
      --  threads to be fusioned

      Local_Set := Build_Domain (Solution);

      --  2/ Call theorems that evaluate all potential gains from
      --  theses fusions

      BR.Compute_Theorem_Call
        (Compute_WCET_Variation_Theorem, Local_Set,
         Result_WCET, Success);
      if not Success then
         Write_Line ("optim.eval: " & Get_Name_String
                     (Compute_WCET_Variation)
                     & " failed");
         return;
      end if;

      BR.Compute_Theorem_Call
        (Compute_Memory_Variation_Theorem, Local_Set,
         Result_Memory, Success);
      if not Success then
         Write_Line ("optim.eval: " & Get_Name_String
                     (Compute_Memory_Variation)
                     & " failed");
         return;
      end if;

      Result := Compute_Multi_Criteria_Value
        (Memory => ERV (Result_Memory),
         WCET   => ERV (Result_WCET));
   end Compute_Relative_Value;

   ---------------------------------
   -- Compute_Relative_Move_Value --
   ---------------------------------

   procedure Compute_Relative_Move_Value
     (Solution : Solution_Set;
      Result   : out Float;
      Success  : out Boolean)
   is
      Local_Set     : Result_Set;
      Result_Memory : Value_Id;
   begin
      --  1/ put in the domain (ie. the theorem local_set) the
      --  threads to be fusioned

      Local_Set := Build_Domain (Solution);

      --  2/ Call theorems that evaluate all potential gains from
      --  theses fusions

      BR.Compute_Theorem_Call
        (Compute_Move_Memory_Variation_Theorem, Local_Set,
         Result_Memory, Success);
      if not Success then
         Write_Line ("optim.eval: " & Get_Name_String
                     (Compute_Move_Memory_Variation)
                     & " failed");
         return;
      end if;

      Result := Compute_Multi_Criteria_Move_Value
        (Memory => ERV (Result_Memory));
   end Compute_Relative_Move_Value;

   -------------------------
   -- Compute_System_Cost --
   -------------------------

   procedure Compute_System_Cost
     (Result        : out Float;
      Success       : out Boolean)
   is
      Local_Set      : constant Result_Set := Empty_Set;
      Result_Latency : Value_Id;
   begin
      Success := True;

      BR.Compute_Theorem_Call
        (Compute_Deadline_Distance_theorem,
         Local_Set, Result_Latency, Success);
      if not Success then
         Write_Line ("optim.eval: " &
                     Get_Name_String (Compute_Deadline_Distance)
                     & " failed");
         return;
      end if;

      Deadline_Distance_Value := ERV (Result_Latency);
      Result := Compute_Multi_Criteria_Cost
        (Deadline_Distance => ERV (Result_Latency));
   end Compute_System_Cost;

   --------------------------
   -- Compute_System_Value --
   --------------------------

   procedure Compute_System_Value
     (Result        : out Float;
      Success       : out Boolean)
   is
      Local_Set      : constant Result_Set := Empty_Set;
      Result_Memory  : Value_Id;
      Result_WCET    : Value_Id;
   begin
      Success := True;

      BR.Compute_Theorem_Call
        (Compute_WCET_Theorem, Local_Set, Result_WCET, Success);
      if not Success then
         Write_Line ("optim.eval: " & Get_Name_String (Compute_WCET)
                     & " failed");
         return;
      end if;

      BR.Compute_Theorem_Call
        (Compute_Memory_Theorem, Local_Set, Result_Memory, Success);
      if not Success then
         Write_Line ("optim.eval: " & Get_Name_String (Compute_Memory)
                     & " failed");
         return;
      end if;

      Register_Current_Values
        (Memory  => ERV (Result_Memory),
         WCET    => ERV (Result_WCET));
      Result := Compute_Multi_Criteria_Value
        (Memory => ERV (Result_Memory),
         WCET   => ERV (Result_WCET));
   end Compute_System_Value;

   -------------------------------
   -- Precise_System_Evaluation --
   -------------------------------

   procedure Precise_System_Evaluation
     (Result        : out Float;
      Success       : out Boolean)
   is
      pragma Unreferenced (Result);
      pragma Unreferenced (Success);
   begin
      null;
   end Precise_System_Evaluation;

   ----------------------------------
   -- Compute_Multi_Criteria_Value --
   ----------------------------------

   function Compute_Multi_Criteria_Value (Memory, WCET : Float) return Float
   is
   begin
      --  FIXME
      --  Of course, the linear combinaison is arbitrary

      return (Memory * 100.0) + WCET;
   end Compute_Multi_Criteria_Value;

   ---------------------------------
   -- Compute_Multi_Criteria_Cost --
   ---------------------------------

   function Compute_Multi_Criteria_Cost
     (Deadline_Distance : Float) return Float
   is
   begin
      --  FIXME
      --  Of course, the linear combinaison is arbitrary

      return -Deadline_Distance;
   end Compute_Multi_Criteria_Cost;

   ---------------------------------------
   -- Compute_Multi_Criteria_Move_Value --
   ---------------------------------------

   function Compute_Multi_Criteria_Move_Value
     (Memory : Float) return Float
   is
   begin
      --  FIXME
      --  Of course, the linear combinaison is arbitrary

      return Memory;
   end Compute_Multi_Criteria_Move_Value;

   -----------------------
   -- Get_Current_Value --
   -----------------------

   function Get_Current_Value return Float
   is
   begin
      return Compute_Multi_Criteria_Value (Memory_Value, WCET_Value);
   end Get_Current_Value;

   -----------------------------
   -- Register_Current_Values --
   -----------------------------

   procedure Register_Current_Values
     (Memory   : Float;
      WCET     : Float) is
   begin
      Memory_Value := Memory;
      WCET_Value := WCET;
   end Register_Current_Values;

   ------------------
   -- Current_Cost --
   ------------------

   function Current_Cost (Candidate_Cost : Float) return Float is
   begin
      return Deadline_Distance_Value + Candidate_Cost;
   end Current_Cost;

end Ocarina.Transfo.Optim.Eval;

------------------------------------------------------------------------------
--                                                                          --
--                           OCARINA COMPONENTS                             --
--                                                                          --
--      OCARINA.INSTANCES.REAL_CHECKER.QUERIES.RELATIONAL_PREDICATES        --
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

--  This generic package defines a method in order to select instances
--  withing a given set, accordingly to a user-provided selection
--  criterium, where criterium involves another AADL node.

with Types;

generic
   with function Predicate
     (E      : Types.Node_Id;
      D      : Types.Node_Id;
      Option : Predicates_Search_Options := PSO_Direct)
     return Boolean;

package Ocarina.Instances.REAL_Checker.Queries.Relational_Predicates is
   use Types;

   function Get_Instances_Verifying_Predicate
     (D      : Node_Id;
      Option : Predicates_Search_Options := PSO_Direct)
     return Result_Set;
   --  search in Node_Id table components verifying the Predicate
   --  property, with respect to the D node

   function Get_Instances_Verifying_Predicate
     (Set    : Result_Set;
      D      : Node_Id;
      Option : Predicates_Search_Options := PSO_Direct)
     return Result_Set;
   --  search in a given Result_Set components verifying the
   --  Predicate property

   function Apply
     (Set_1    : Result_Set;
      Set_2    : Result_Set;
      Reversed : Boolean := False;
      Distinct : Boolean := False;
      Option   : Predicates_Search_Options := PSO_Direct)
     return Result_Set;
   --  search in Set_1 components verifying the
   --  Predicate property with *any* element of Set_2
   --  * Reversed : all elements of set_2 which comply to the relation
   --  * Distinct : identical results are stored only one time
   --  * PSO_Direct : relation-dependant

end Ocarina.Instances.REAL_Checker.Queries.Relational_Predicates;

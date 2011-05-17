------------------------------------------------------------------------------
--                                                                          --
--                           OCARINA COMPONENTS                             --
--                                                                          --
--       O C A R I N A . B A C K E N D S . P N . C O M P O N E N T S        --
--                                                                          --
--                                 S p e c                                  --
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

package Ocarina.Backends.PN.Components is

   function Process_Architecture_Instance
     (Architecture_Instance : Types.Node_Id;
      F : Unsigned_Long_Long)
     return Types.Node_Id;
   --  Transform the ocarina tree of the distributed application
   --  nodes into a petrinet (pn) tree.

private

   type Pn_Init_Node is access procedure (N : Types.Node_Id;
                                          A : Types.Node_Id;
                                          Name : Types.Name_Id;
                                          Pn_G : Types.Node_Id;
                                          M    : Unsigned_Long_Long);

   type Pn_Init_Arc is access procedure (N : Types.Node_Id;
                                         A : Types.Node_Id;
                                         F : Types.Node_Id;
                                         T : Types.Node_Id;
                                         K : Unsigned_Long_Long);

   type Pn_Dup_Arc is access procedure (A        : Types.Node_Id;
                                        A_Inst   : Types.Node_Id;
                                        Endpoint : Types.Node_Id;
                                        From     : Boolean);

   type Pn_New_Node is access function return Types.Node_Id;

end Ocarina.Backends.PN.Components;

------------------------------------------------------------------------------
--                                                                          --
--                           OCARINA COMPONENTS                             --
--                                                                          --
--                    P R O D U C E R _ C O N S U M E R                     --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
--                 Copyright (C) 2006, GET-Telecom Paris.                   --
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

with Ada.Text_IO; use Ada.Text_IO;

package body Producer_Consumer is

   function Get_Pid return String;

   The_Data : Alpha_Type := 0;

   -------------
   -- Get_Pid --
   -------------

   function Get_Pid return String is
      function Getpid return Integer;
      pragma Import (C, Getpid);
   begin
      return Integer'Image (Getpid);
   end Get_Pid;

   -----------------
   -- Produce_Spg --
   -----------------

   procedure Produce_Spg (Data_Source : out Alpha_Type) is
   begin
      Data_Source := The_Data;
      The_Data := The_Data + 1;

      Put_Line (Get_Pid & ": produced " & Data_Source'Img);
   end Produce_Spg;

   -----------------
   -- Consume_Spg --
   -----------------

   procedure Consume_Spg (Data_Sink   :     Alpha_Type) is
   begin
      Put_Line (Get_Pid & ": consumed " & Data_Sink'Img);
   end Consume_Spg;
end Producer_Consumer;

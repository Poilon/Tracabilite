------------------------------------------------------------------------------
--                                                                          --
--                           OCARINA COMPONENTS                             --
--                                                                          --
--                               C O M M O N                                --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
--               Copyright (C) 2006-2007, GET-Telecom Paris.                --
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

with Ada.Text_IO;

package body Common is

   -------------
   -- Get_Pid --
   -------------

   function Get_Pid return String is
      function Getpid return Integer;
      pragma Import (C, Getpid);
   begin
      return Integer'Image (Getpid);
   end Get_Pid;

   ------------------
   -- Put_Received --
   ------------------

   procedure Put_Received
     (The_Message : String;
      The_Type    : String := "")
   is
      use Ada.Text_IO;
   begin
      Put_Line (Get_Pid & ": received "
                & The_Type
                & ": "
                & The_Message);
   end Put_Received;

   ---------------------
   -- Put_Transmitted --
   ---------------------

   procedure Put_Transmitted
     (Initial : String;
      Final   : String)
   is
      use Ada.Text_IO;
   begin
      Put_Line (Get_Pid & ": received: "
                & Initial
                &" => Sent: "
                & Final);
   end Put_Transmitted;

end Common;

------------------------------------------------------------------------------
--                                                                          --
--                           OCARINA COMPONENTS                             --
--                                                                          --
--                           R E P O S I T O R Y                            --
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
with Ada.Characters.Handling;

package body Repository is

   use Partition.Message_PKG;

   ------------------
   -- Send_Message --
   ------------------

   procedure Send_Message
     (Msg_Out : out Partition.Message)
   is
      use Partition;
      use Ada.Text_IO;
   begin
      Msg_Out := To_Bounded_String ("The Initial MESSAGE");
      Put_Line ("Sent : " & To_String (Msg_Out));
   end Send_Message;

   ---------------------
   -- Receive_Message --
   ---------------------

   procedure Receive_Message
     (Msg_In : in Partition.Message)
   is
      use Partition;
      use Ada.Text_IO;
   begin
      Put_Line ("Received : " & To_String (Msg_In));
   end Receive_Message;

   ----------------------
   -- Transmit_Message --
   ----------------------

   procedure Transmit_Message
     (Msg_In : in Partition.Message;
      Msg_Out : out Partition.Message)
   is
      use Partition;
      use Ada.Text_IO;
   begin
      Msg_Out := Msg_In;
      Put_Line ("Transmitted : " & To_String (Msg_Out));
   end transmit_message;

   ------------------------
   -- Alterate_Message_1 --
   ------------------------

   procedure Alterate_Message_1
     (Msg_In : in Partition.Message;
      Msg_Out : out Partition.Message)
   is
      use Partition;
      use Ada.Text_IO;
      use Ada.Characters.Handling;
   begin
      Msg_Out := To_Bounded_String (To_Lower (To_String (Msg_In)));
      Put_Line ("Altered : "
                & To_String (Msg_In)
                & " to "
                & To_String (Msg_Out));
   end Alterate_Message_1;

   ------------------------
   -- Alterate_Message_2 --
   ------------------------

   procedure Alterate_Message_2
     (Msg_In : in Partition.Message;
      Msg_Out : out Partition.Message)
   is
      use Partition;
      use Ada.Text_IO;
      use Ada.Characters.Handling;
   begin
      Msg_Out := To_Bounded_String (To_Upper (To_String (Msg_In)));
      Put_Line ("Altered : "
                & To_String (Msg_In)
                & " to "
                & To_String (Msg_Out));
   end Alterate_Message_2;

end Repository;

------------------------------------------------------------------------------
--                                                                          --
--                           OCARINA COMPONENTS                             --
--                                                                          --
--                           R E P O S I T O R Y                            --
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

with Ada.Text_IO;

package body Repository is

   function Getpid return Integer;
   pragma Import (C, Getpid);

   ----------------------
   -- Transmit_Message --
   ----------------------

   procedure Transmit_Message
     (Msg_In : in Partition.Message;
      Msg_Out : out Partition.Message)
   is
      use Partition;
   begin
      Msg_Out := Msg_In + 1;
      Ada.Text_IO.Put_Line
        (Integer'Image (Getpid)
         & " Transmit : "
         & Integer'Image (Integer (Msg_Out)));
   end transmit_message;

   ------------------
   -- Send_Message --
   ------------------

   procedure Send_Message
     (Msg_Out : out Partition.Message)
   is
      use Partition;
   begin
      Msg_Out := 0;
      Ada.Text_IO.Put_Line
        (Integer'Image (Getpid)
         & " Send: "
         & Integer'Image (Integer (Msg_Out)));
   end Send_Message;

   ---------------------
   -- Receive_Message --
   ---------------------

   procedure Receive_Message
     (Msg_In : in Partition.Message)
   is
      use Partition;
   begin
      Ada.Text_IO.Put_Line
        (Integer'Image (Getpid)
         & " Receive: "
         & Integer'Image (Integer (Msg_In)));
   end Receive_Message;

end Repository;

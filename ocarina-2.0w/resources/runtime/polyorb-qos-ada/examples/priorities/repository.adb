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
with Ada.Dynamic_Priorities;

package body Repository is

   function Getpid return Integer;
   pragma Import (C, Getpid);

   ------------------------
   -- Send_Broadcast_msg --
   ------------------------

   procedure Send_Broadcast_Msg
     (Msg_Out : out Partition.Message)
   is
   begin
      Msg_Out := 0;
      Ada.Text_IO.Put_Line
        (Integer'Image (Getpid)
         & " Broadcasted : "
         & Integer'Image (Integer (Msg_Out)));
   end Send_Broadcast_Msg;

   --------------------
   -- Send_Message_1 --
   --------------------

   procedure Send_Message_1
     (Msg_In : in Partition.Message;
      Msg_Out : out Partition.Message)
   is
      pragma Unreferenced (Msg_In);
   begin
      Msg_Out := 1;
      Ada.Text_IO.Put_Line
        (Integer'Image (Getpid)
         & " Replied : "
         & Integer'Image (Integer (Msg_Out)));
   end Send_Message_1;

   --------------------
   -- Send_Message_2 --
   --------------------

   procedure Send_Message_2
     (Msg_In : in Partition.Message;
      Msg_Out : out Partition.Message)
   is
      pragma Unreferenced (Msg_In);
   begin
      Msg_Out := 2;
      Ada.Text_IO.Put_Line
        (Integer'Image (Getpid)
         & " Replied : "
         & Integer'Image (Integer (Msg_Out)));
   end Send_Message_2;

   ------------------------
   -- Print_Received_Msg --
   ------------------------

   procedure Print_Received_Msg
     (Msg_In : in Partition.Message)
   is
   begin
      Ada.Text_IO.Put_Line
        (Integer'Image (Getpid)
         & " Received : "
         & Integer'Image (Integer (Msg_In)));
      Ada.Text_IO.Put_Line
        ("Priority : " &
         Integer'Image (Integer (Ada.Dynamic_Priorities.Get_Priority)));

   end Print_Received_Msg;

   -----------
   -- Dummy --
   -----------

   procedure Dummy is
   begin
      null;
   end Dummy;

end Repository;

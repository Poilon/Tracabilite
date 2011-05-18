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

with Ada.Text_IO; use Ada.Text_IO;

package body Repository is

   function Getpid return Integer;
   pragma Import (C, Getpid);

   -----------------
   -- Bbs_Program --
   -----------------

   procedure Bbs_Program
     (Ingoing_Msg : in Partition.Commons.Bbs_Msg;
      Outgoing_Msg : out Partition.Commons.Bbs_Msg)
   is
      use Partition.Commons;
   begin
      Put_Line (Integer'Image (Getpid)
                & " Bbs_Program receives "
                & Partition.Commons.Bbs_Msg'Image (Ingoing_Msg));
      Outgoing_Msg := Ingoing_Msg + 1;
      Put_Line (Integer'Image (Getpid)
                & " Bbs_Program sends "
                & Partition.Commons.Bbs_Msg'Image (Outgoing_Msg));
   end Bbs_Program;

   ------------------
   -- Post_Program --
   ------------------

   procedure Post_Program (Outgoing_Msg : out Partition.Commons.Bbs_Msg) is
      use Partition.Commons;
   begin
      Outgoing_Msg := 5;
      Put_Line (Integer'Image (Getpid)
                & " Post_Program sends "
                & Partition.Commons.Bbs_Msg'Image (Outgoing_Msg));
   end Post_Program;

   -----------------
   -- Get_Program --
   -----------------

   procedure Get_Program (Ingoing_Msg : in Partition.Commons.Bbs_Msg) is
      use Partition.Commons;
   begin
      Put_Line (Integer'Image (Getpid)
                & " Get_Program receives "
                & Partition.Commons.Bbs_Msg'Image (Ingoing_Msg));
   end Get_Program;

end Repository;

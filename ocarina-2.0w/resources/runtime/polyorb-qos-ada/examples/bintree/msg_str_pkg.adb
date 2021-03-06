------------------------------------------------------------------------------
--                                                                          --
--                           OCARINA COMPONENTS                             --
--                                                                          --
--                          M S G _ S T R _ P K G                           --
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

with Common; use Common;

package body Msg_Str_Pkg is

   --------------------
   -- Message_To_Str --
   --------------------

   procedure Message_To_Str
     (Msg_In  :     Partition.Message;
      Msg_Out : out Partition.Str_Msg)
   is
      use Partition;
   begin
      Msg_Out :=  Str_Msg
        (Str_Msg_PKG.To_Bounded_String
         ("STR " & Float'Image (Float (Msg_In) / 3.0)));
      Put_Transmitted
        (Message'Image (Msg_In),
         Str_Msg_PKG.To_String
         (Str_Msg_PKG.Bounded_String
          (Msg_Out)));
   end Message_To_Str;

end Msg_Str_Pkg;

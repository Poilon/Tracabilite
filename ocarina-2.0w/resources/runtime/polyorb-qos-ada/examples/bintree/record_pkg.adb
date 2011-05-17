------------------------------------------------------------------------------
--                                                                          --
--                           OCARINA COMPONENTS                             --
--                                                                          --
--                           R E C O R D _ P K G                            --
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

package body Record_Pkg is

   --------------------
   -- Receive_Record --
   --------------------

   procedure Receive_Record (Msg_In : Partition.Record_Msg_Basic) is
      use Partition;
      use Partition.Str_Msg_PKG;
   begin
      Put_Received (Bool_Msg'Image (Msg_In.Field_1), "Boolean Field");
      Put_Received (Float_Msg'Image (Msg_In.Field_2), "Float Field");
      Put_Received (Int_Msg'Image (Msg_In.Field_3), "Integer Field");
      Put_Received
        (To_String (Bounded_String (Msg_In.Field_4)), "String Field");
   end Receive_Record;

   -------------------
   -- All_To_Record --
   -------------------

   procedure All_To_Record
     (Msg_In_Bool  :     Partition.Bool_Msg;
      Msg_In_Float :     Partition.Float_Msg;
      Msg_In_Int   :     Partition.Int_Msg;
      Msg_In_Str   :     Partition.Str_Msg;
      Msg_Out_Rec  : out Partition.Record_Msg_Basic)
   is
      use Partition;
      use Partition.Str_Msg_PKG;

   begin
      Msg_Out_Rec := (Msg_In_Bool, Msg_In_Float, Msg_In_Int, Msg_In_Str);

      Put_Transmitted (Bool_Msg'Image (Msg_Out_Rec.Field_1), "Boolean Field");
      Put_Transmitted (Float_Msg'Image (Msg_Out_Rec.Field_2), "Float Field");
      Put_Transmitted (Int_Msg'Image (Msg_Out_Rec.Field_3), "Integer Field");
      Put_Transmitted
        (To_String (Bounded_String (Msg_Out_Rec.Field_4)), "String Field");
   end All_To_Record;

end Record_Pkg;

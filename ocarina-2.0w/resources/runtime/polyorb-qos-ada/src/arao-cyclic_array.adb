------------------------------------------------------------------------------
--                                                                          --
--                          PolyORB HI COMPONENTS                           --
--                                                                          --
--                    A R A O . C Y C L I C _ A R R A Y                     --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
--                 Copyright (C) 2009, GET-Telecom Paris.                   --
--                                                                          --
-- PolyORB HI is free software; you  can  redistribute  it and/or modify it --
-- under terms of the GNU General Public License as published by the Free   --
-- Software Foundation; either version 2, or (at your option) any later.    --
-- PolyORB HI is distributed  in the hope that it will be useful, but       --
-- WITHOUT ANY WARRANTY;  without even the implied warranty of              --
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General --
-- Public License for more details. You should have received  a copy of the --
-- GNU General Public  License  distributed with PolyORB HI; see file       --
-- COPYING. If not, write  to the Free  Software Foundation, 51 Franklin    --
-- Street, Fifth Floor, Boston, MA 02111-1301, USA.                         --
--                                                                          --
-- As a special exception,  if other files  instantiate  generics from this --
-- unit, or you link  this unit with other files  to produce an executable, --
-- this  unit  does not  by itself cause  the resulting  executable  to  be --
-- covered  by the  GNU  General  Public  License.  This exception does not --
-- however invalidate  any other reasons why  the executable file  might be --
-- covered by the  GNU Public License.                                      --
--                                                                          --
--                PolyORB HI is maintained by GET Telecom Paris             --
--                                                                          --
------------------------------------------------------------------------------

package body ARAO.Cyclic_Array is

   ---------
   -- Get --
   ---------

   procedure Get
     (T     : in out Table;
      Item  :    out Element;
      Empty :    out Boolean)
   is
   begin
      if T.Empty then
         Empty := True;
      else
         Empty := False;

         if T.Beg_Curs = T.End_Curs then
            T.Empty := True;
         end if;

         Item := T.Data (T.Beg_Curs);

         if T.Beg_Curs = Max_Size then
            T.Beg_Curs := 1;
         else
            T.Beg_Curs := T.Beg_Curs + 1;
         end if;
      end if;
   end Get;

   ------------
   -- Append --
   ------------

   procedure Append
     (T    : in out Table;
      Item :        Element;
      Full :    out Boolean)
   is
   begin
      if not T.Empty and then
        (T.End_Curs = T.Beg_Curs - 1 or else
         (T.Beg_Curs = 1 and then T.End_Curs = Max_Size))
      then
         Full := True;
      else
         Full := False;
         T.Empty := False;

         if T.End_Curs = Max_Size then
            T.End_Curs := 1;
         else
            T.End_Curs :=  T.End_Curs + 1;
         end if;

         T.Data (T.End_Curs) := Item;
      end if;
   end Append;

   ---------------
   -- Push_Back --
   ---------------

   procedure Push_Back
     (T    : in out Table;
      Item :        Element;
      Full :    out Boolean)
   is
   begin
      if not T.Empty and then
        (T.End_Curs = T.Beg_Curs - 1 or else
         (T.Beg_Curs = 1 and then T.End_Curs = Max_Size))
      then
         Full := True;
      else
         Full := False;
         T.Empty := False;

         if T.Beg_Curs = 1 then
            T.Beg_Curs := Max_Size;
         else
            T.Beg_Curs :=  T.Beg_Curs - 1;
         end if;

         T.Data (T.Beg_Curs) := Item;
      end if;
   end Push_Back;

end ARAO.Cyclic_Array;

------------------------------------------------------------------------------
--                                                                          --
--                          PolyORB HI COMPONENTS                           --
--                                                                          --
--                    A R A O . C Y C L I C _ A R R A Y                     --
--                                                                          --
--                                 S p e c                                  --
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

generic
   type Element is private;
   Max_Size : Positive;

package ARAO.Cyclic_Array is

   type Table is private;

   procedure Get
     (T     : in out Table;
      Item  :    out Element;
      Empty :    out Boolean);
   --  Return the oldest entered value

   procedure Append
     (T    : in out Table;
      Item :        Element;
      Full :    out Boolean);
   --  Add the value at Fifo's end. Should be the "normal" way of
   --  using FIFO.

   procedure Push_Back
     (T    : in out Table;
      Item :        Element;
      Full :    out Boolean);
   --  Add the value at Fifo's beginning. Should be used only to
   --  "undo" a "Get" call.

private

   type Data_Array is array (1 .. Max_Size) of Element;

   type Table is record
      Data     : Data_Array;
      Beg_Curs : Integer := 1;
      End_Curs : Integer := 0;
      Empty    : Boolean := True;
   end record;

end ARAO.Cyclic_Array;

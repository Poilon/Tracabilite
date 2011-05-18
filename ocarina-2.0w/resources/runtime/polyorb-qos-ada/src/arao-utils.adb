------------------------------------------------------------------------------
--                                                                          --
--                          PolyORB HI COMPONENTS                           --
--                                                                          --
--                           A R A O . U T I L S                            --
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

with PolyORB.Utils; use PolyORB.Utils;

package body ARAO.Utils is

   function Chars (N : Natural) return String;
   --  Return the sequence of 4 characters that corresponds to the
   --  bytes of N.

   -----------
   -- Chars --
   -----------

   function Chars (N : Natural) return String is
      Result : String (1 .. 4);

   begin
      Result (1) := Character'Val (N mod 256);
      Result (2) := Character'Val ((N / 256) mod 256);
      Result (3) := Character'Val ((N / 65536) mod 256);
      Result (4) := Character'Val ((N / 16777216) mod 256);
      return Result;
   end Chars;

   -------------
   -- Get_Ref --
   -------------

   procedure Get_Ref
     (Ref           : in out PolyORB.References.Ref;
      Host_Location : String;
      Port_Number   : Positive;
      Servant_Index : Natural;
      Protocol      : String)
   is
      P_Image   : constant String := Natural'Image (Port_Number);
      Pro_Str   : String := "corbaloc:prot:x.x@";
      Pro_Found : Boolean := False;
      Final_Str : constant String := Host_Location & ":" &
        P_Image (P_Image'First + 1 .. P_Image'Last) & "/" &
        URI_Encode (Chars (Servant_Index), Also_Escape => No_Escape);

   begin
      if Protocol = "diop" then
         Pro_Str := "corbaloc:diop:1.0@";
         Pro_Found := True;
      end if;

      if Protocol = "iiop" then
         Pro_Str := "corbaloc:iiop:1.2@";
         Pro_Found := True;
      end if;

      if Pro_Found then
         PolyORB.References.String_To_Object (Pro_Str & Final_Str, Ref);
      end if;
   end Get_Ref;

   ------------------
   -- Get_GIOP_Ref --
   ------------------

   procedure Get_GIOP_Ref
     (Ref           : in out PolyORB.References.Ref;
      Ior_Ref       : String) is
   begin
      PolyORB.References.String_To_Object (Ior_Ref, Ref);
   end Get_GIOP_Ref;

end ARAO.Utils;

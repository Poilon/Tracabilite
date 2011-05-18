------------------------------------------------------------------------------
--                                                                          --
--                           OCARINA COMPONENTS                             --
--                                                                          --
--                                U T I L S                                 --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
--               Copyright (C) 2007-2009, GET-Telecom Paris.                --
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

with Charset;   use Charset;
with Namet;     use Namet;

package body Utils is

   Up_To_Low : constant := Character'Pos ('A') - Character'Pos ('a');

   ------------------------
   -- Add_Prefix_To_Name --
   ------------------------

   function Add_Prefix_To_Name
     (Prefix : String;
      Name   : Name_Id)
     return Name_Id
   is
   begin
      Set_Str_To_Name_Buffer (Prefix);
      Get_Name_String_And_Append (Name);
      return Name_Find;
   end Add_Prefix_To_Name;

   ------------------------
   -- Add_Suffix_To_Name --
   ------------------------

   function Add_Suffix_To_Name
     (Suffix : String;
      Name   : Name_Id)
     return Name_Id
   is
   begin
      Get_Name_String (Name);
      Add_Str_To_Name_Buffer (Suffix);
      return Name_Find;
   end Add_Suffix_To_Name;

   -----------------------------
   -- Remove_Prefix_From_Name --
   -----------------------------

   function Remove_Prefix_From_Name
     (Prefix : String;
      Name   : Name_Id)
     return Name_Id
   is
      Length   : Natural;
      Temp_Str : String (1 .. Prefix'Length);
   begin
      Set_Str_To_Name_Buffer (Prefix);
      Length := Name_Len;
      Get_Name_String (Name);
      if Name_Len > Length then
         Temp_Str := Name_Buffer (1 .. Length);
         if Prefix = Temp_Str then
            Set_Str_To_Name_Buffer
              (Name_Buffer (1 + Length .. Name_Len));
            return Name_Find;
         end if;
      end if;
      return Name;
   end Remove_Prefix_From_Name;

   -----------------------------
   -- Remove_Suffix_From_Name --
   -----------------------------

   function Remove_Suffix_From_Name
     (Suffix : String;
      Name   : Name_Id)
     return Name_Id
   is
      Length   : Natural;
      Temp_Str : String (1 .. Suffix'Length);
   begin
      Set_Str_To_Name_Buffer (Suffix);
      Length := Name_Len;
      Get_Name_String (Name);
      if Name_Len > Length then
         Temp_Str := Name_Buffer (Name_Len - Length + 1 .. Name_Len);
         if Suffix = Temp_Str then
            Set_Str_To_Name_Buffer (Name_Buffer (1 .. Name_Len - Length));
            return Name_Find;
         end if;
      end if;
      return Name;
   end Remove_Suffix_From_Name;

   ----------------
   -- Capitalize --
   ----------------

   procedure Capitalize (S : in out String) is
      Up : Boolean := True;
   begin
      for I in S'Range loop
         if Up then
            Up := False;
            if S (I) in 'a' .. 'z' then
               S (I) := Character'Val (Character'Pos (S (I)) + Up_To_Low);
            end if;
         end if;
         if S (I) = '_' then
            Up := True;
         end if;
      end loop;
   end Capitalize;

   ------------
   -- Quoted --
   ------------

   function Quoted (S : String; D : Character := '"') return String is -- "
   begin
      return (1 => D) & S & (1 => D);
   end Quoted;

   ------------
   -- Quoted --
   ------------

   function Quoted (S : String; D : Character := '"') return Name_Id is -- "
   begin
      Set_Char_To_Name_Buffer (D);
      Add_Str_To_Name_Buffer (S);
      Add_Char_To_Name_Buffer (D);
      return Name_Find;
   end Quoted;

   ------------
   -- Quoted --
   ------------

   function Quoted (N : Name_Id; D : Character := '"') return String is -- "
   begin
      return Quoted (Get_Name_String (N), D);
   end Quoted;

   ------------
   -- Quoted --
   ------------

   function Quoted (N : Name_Id; D : Character := '"') return Name_Id is -- "
   begin
      return Quoted (Get_Name_String (N), D);
   end Quoted;

   --------------
   -- To_Lower --
   --------------

   function To_Lower (N : Name_Id) return Name_Id is
   begin
      if N = No_Name then
         return No_Name;
      end if;
      Get_Name_String (N);
      To_Lower (Name_Buffer (1 .. Name_Len));
      return Name_Find;
   end To_Lower;

   --------------
   -- To_Upper --
   --------------

   function To_Upper (N : Name_Id) return Name_Id is
   begin
      if N = No_Name then
         return No_Name;
      end if;
      Get_Name_String (N);
      To_Upper (Name_Buffer (1 .. Name_Len));
      return Name_Find;
   end To_Upper;

   ---------------
   -- Is_Prefix --
   ---------------

   function Is_Prefix (N1 : Name_Id; N2 : Name_Id) return Boolean is
   begin
      if N1 = No_Name then
         return True;
      end if;

      if N2 = No_Name then
         return False;
      end if;

      declare
         S1   : constant String := Get_Name_String (N1);
         S2   : constant String := Get_Name_String (N2);
      begin
         if S1'Length >  S2'Length then
            return False;
         end if;
         for I in 1 .. S1'Last loop
            if S1 (I) /= S2 (I) then
               return False;
            end if;
         end loop;
      end;

      return True;
   end Is_Prefix;

end Utils;

------------------------------------------------------------------------------
--                                                                          --
--                           OCARINA COMPONENTS                             --
--                                                                          --
--                      O C A R I N A . O P T I O N S                       --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
--               Copyright (C) 2008-2009, GET-Telecom Paris.                --
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

with Namet; use Namet;

with GNAT.OS_Lib;      use GNAT.OS_Lib;

package body Ocarina.Options is

   ----------------------
   -- Add_Library_Path --
   ----------------------

   procedure Add_Library_Path (Path : String) is
   begin
      if Path'Length > 0 then
         Library_Paths.Increment_Last;
         Set_Str_To_Name_Buffer (Path);
         Library_Paths.Table (Library_Paths.Last) := Name_Find;
      end if;
   end Add_Library_Path;

   --------------------------
   -- Default_Library_Path --
   --------------------------

   function Default_Library_Path return Name_Id is
      Name_Buffer_Bkp : constant String := Name_Buffer (1 .. Name_Len);
      Result          : Name_Id;
   begin
      if Installation_Directory = No_Name then
         raise Program_Error;
      end if;

      Get_Name_String (Installation_Directory);
      Add_Str_To_Name_Buffer ("share"   & Directory_Separator);
      Add_Str_To_Name_Buffer ("ocarina" & Directory_Separator);
      if AADL_Version = AADL_V1 then
         Add_Str_To_Name_Buffer ("AADLv1"  & Directory_Separator);
      elsif AADL_Version = AADL_V2 then
         Add_Str_To_Name_Buffer ("AADLv2"  & Directory_Separator);
      end if;

      Result := Name_Find;
      Set_Str_To_Name_Buffer (Name_Buffer_Bkp);
      return Result;
   end Default_Library_Path;

   ------------------------
   -- Set_Current_Action --
   ------------------------

   procedure Set_Current_Action (Action : Action_Kind) is
   begin
      if Current_Action /= None then
         raise Invalid_Options;
      end if;

      Current_Action := Action;
   end Set_Current_Action;

   ------------------------
   -- Get_Current_Action --
   ------------------------

   function Get_Current_Action return Action_Kind is
   begin
      return Current_Action;
   end Get_Current_Action;

   --------------------------
   -- Reset_Current_Action --
   --------------------------

   procedure Reset_Current_Action is
   begin
      Current_Action := None;
   end Reset_Current_Action;

   ----------------------
   -- Set_Annex_Action --
   ----------------------

   procedure Set_Annex_Action (Action : Annex_Action_Kind) is
   begin
      Current_Annex_Action (Action) := 1;
   end Set_Annex_Action;

   ----------------------
   -- Get_Annex_Action --
   ----------------------

   function Get_Annex_Action (Action : Annex_Action_Kind) return Byte is
   begin
      return Current_Annex_Action (Action);
   end Get_Annex_Action;

   ------------------------
   -- Reset_Annex_Action --
   ------------------------

   procedure Reset_Annex_Action is
   begin
      for I in Current_Annex_Action'Range loop
         Current_Annex_Action (I) := 0;
      end loop;
   end Reset_Annex_Action;

   --------------------------
   -- Process_Annex_Action --
   --------------------------

   procedure Process_Annex_Action (Parameters : String) is
      Tmp_Name : Name_Id;
   begin
      Name_Len := 0;

      for I in Parameters'Range loop
         if Parameters (I) = ','
           or else I = Parameters'Last
         then
            if I = Parameters'Last then
               Add_Char_To_Name_Buffer (Parameters (I));
            end if;

            Tmp_Name := Name_Find;
            if Tmp_Name = Get_String_Name ("real") then
               Set_Annex_Action (Disable_REAL);
            elsif Tmp_Name = Get_String_Name ("behavior") then
               Set_Annex_Action (Disable_BA);
            elsif Tmp_Name = Get_String_Name ("all") then
               Set_Annex_Action (Disable_ALL);
               exit;
            else
               raise Invalid_Options;
            end if;

            Name_Len := 0;

         else
            Add_Char_To_Name_Buffer (Parameters (I));
         end if;
      end loop;
   end Process_Annex_Action;

   --------------------------
   -- Perform_Annex_Action --
   --------------------------

   function Perform_Annex_Action (Language : Name_Id) return Boolean is
      Behavior_Language_Name : constant Name_Id := Get_String_Name
                                                    ("behavior_specification");
      Real_Language_Name     : constant Name_Id := Get_String_Name
                                                    ("real_specification");
      Perform                : Boolean          := True;
   begin
      if Current_Annex_Action (Disable_ALL) = 1 then
         Perform := False;
      elsif Language = Behavior_Language_Name
        and then Current_Annex_Action (Disable_BA) = 1
      then
         Perform := False;
      elsif Language = Real_Language_Name
        and then Current_Annex_Action (Disable_REAL) = 1
      then
         Perform := False;
      end if;

      return Perform;

   end Perform_Annex_Action;

end Ocarina.Options;

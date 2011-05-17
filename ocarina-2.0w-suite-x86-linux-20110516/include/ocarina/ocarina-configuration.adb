------------------------------------------------------------------------------
--                                                                          --
--                           OCARINA COMPONENTS                             --
--                                                                          --
--                O C A R I N A . C O N F I G U R A T I O N                 --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
--               Copyright (C) 2006-2009, GET-Telecom Paris.                --
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

with Ocarina.Backends;
with Ocarina.BE_AADL;
with Ocarina.BE_AADL_BA;
with Ocarina.BE_REAL;
with Ocarina.Transfo;
with Ocarina.Transfo.Fusions;

with Ocarina.FE_REAL;
with Ocarina.FE_AADL;
with Ocarina.FE_AADL_BA;

with Ocarina.Analyzer;

with Ocarina.Options;  use Ocarina.Options;
with Ocarina.Parser;   use Ocarina.Parser;

with GNAT.OS_Lib;      use GNAT.OS_Lib;

with Ada.Command_Line; use Ada.Command_Line;

with Charset; use Charset;
with Namet;   use Namet;
with Types;   use Types;

package body Ocarina.Configuration is

   --  As some of the values of the constants below may make the lines
   --  too long for GNAT styles, we put the litterals in a new line.

   Version          : constant String :=
     "2.0w";
   --  This is the official version of Ocarina Stored in configure.ac

   Default_AADL_Version : constant AADL_Version_Type :=
     AADL_V1;

   pragma Style_Checks (Off);
   SVN_Revision : constant String := "r7317";
   pragma Style_Checks (On);
   --  We keep the repository version as "(Working Copy) from ..." to
   --  distinguish modified versions. When packaging Ocarina, we
   --  delete the "Working Copy from" substring. The variable
   --  declaration must be done in one single line in order for the
   --  substitution pattern to work. We disable style checks because
   --  this line may be too long.

   Last_Config_Date : constant String :=
     "Monday 16 May 2011, 21:36:44";
   --  The date of the latest execution of the configure script

   Last_Config_Year : constant String :=
     "2011";
   --  The year of the latest execution of the configure script

   GNU_Make_Str : constant String :=
     "make";
   --  The GNU make command

   ------------------------------
   -- Get_Default_AADL_Version --
   ------------------------------

   function Get_Default_AADL_Version return AADL_Version_Type is
   begin
      return Default_AADL_Version;
   end Get_Default_AADL_Version;

   ------------------
   -- Init_Modules --
   ------------------

   procedure Init_Modules is

      function Get_Install_Dir (Exec : String) return String;
      --  S is the executable name preceded by the absolute or relative
      --  path, e.g. "c:\usr\bin\gcc.exe" or "..\bin\gcc".

      ---------------------
      -- Get_Install_Dir --
      ---------------------

      function Get_Install_Dir (Exec : String) return String is
         Path : constant String := Normalize_Pathname (Exec);

      begin
         for J in reverse Path'Range loop
            if Path (J) = Directory_Separator then
               if J < Path'Last - 6 then
                  if To_Lower (Path (J + 1)) = 'b'
                    and then To_Lower (Path (J + 2)) = 'i'
                    and then To_Lower (Path (J + 3)) = 'n'
                    and then To_Lower (Path (J + 4)) = Directory_Separator
                  then
                     return Path (Path'First .. J);
                  end if;
               end if;
            end if;
         end loop;

         return "";
      end Get_Install_Dir;

      Exec : constant String := Normalize_Pathname (Command_Name);

   begin
      Set_Str_To_Name_Buffer ("");

      --  First check whether OCARINA_PATH is set.

      declare
         Path : constant String_Access := Getenv ("OCARINA_PATH");
      begin
         if Path /= null and then Path'Length > 0 then
            declare
               Dir : constant String
                 := Normalize_Pathname (Path.all) & Directory_Separator;
            begin
               if Dir'Length > 0 then
                  --  XXX disabled for now, to be investigated
                  --  if not Is_Regular_File (Dir & "bin/" & Command_Name) then
                  --  raise Program_Error with "Wrong value for OCARINA_PATH";
                  --  end if;

                  Set_Str_To_Name_Buffer (Dir);
                  Installation_Directory := Name_Find;
               end if;
            end;
         end if;
      end;

      --  Determine if a path prefix was placed in front of the
      --  executable name.

      if Installation_Directory = No_Name then
         for J in reverse Exec'Range loop
            if Exec (J) = Directory_Separator then
               declare
                  Dir : constant String := Get_Install_Dir (Exec);
               begin
                  if Dir'Length > 0
                    and then Is_Regular_File (Dir & "bin/" & Command_Name)
                  then
                     Set_Str_To_Name_Buffer (Dir);
                     Installation_Directory := Name_Find;
                  end if;
                  exit;
               end;
            end if;
         end loop;
      end if;

      --  The executable name has no path prefix. Locate executable
      --  and use its path prefix.

      if Installation_Directory = No_Name then
         declare
            Dir : constant String
              := Get_Install_Dir (Locate_Exec_On_Path (Command_Name).all);
         begin
            if Dir'Length > 0 then
               Set_Str_To_Name_Buffer (Dir);
               Installation_Directory := Name_Find;
            end if;
         end;
      end if;

      if Installation_Directory = No_Name then
         raise Program_Error;
      end if;

      Ocarina.Backends.Init;
      Ocarina.Analyzer.Init_Analyzers;
      Ocarina.FE_AADL.Init;
      Ocarina.FE_AADL_BA.Init;
      Ocarina.FE_REAL.Init;
      Ocarina.BE_AADL.Init;
      Ocarina.BE_AADL_BA.Init;
      Ocarina.BE_REAL.Init;
      Ocarina.Transfo.Init;
      Ocarina.Transfo.Fusions.Init;

      Ocarina.Parser.Init_Parsers;

      --  Set the platform dependant GNU make executable name

      GNU_Make_Ptr := GNU_Make_Cmd'Access;
   end Init_Modules;

   -------------------
   -- Reset_Modules --
   -------------------

   procedure Reset_Modules is
   begin
      Installation_Directory := No_Name;
      Ocarina.FE_AADL.Reset;
      Ocarina.FE_AADL_BA.Reset;
      Ocarina.FE_REAL.Reset;
      Ocarina.Parser.Reset_Parsers;
      Ocarina.Analyzer.Reset_Analyzers;
      Ocarina.Backends.Reset;
      Ocarina.Transfo.Fusions.Reset;
   end Reset_Modules;

   ---------------------
   -- Ocarina_Version --
   ---------------------

   function Ocarina_Version return String is
   begin
      return Version;
   end Ocarina_Version;

   --------------------------
   -- Ocarina_SVN_Revision --
   --------------------------

   function Ocarina_SVN_Revision return String is
   begin
      return SVN_Revision;
   end Ocarina_SVN_Revision;

   ---------------------------------
   -- Ocarina_Last_Configure_Date --
   ---------------------------------

   function Ocarina_Last_Configure_Date return String is
   begin
      return Last_Config_Date;
   end Ocarina_Last_Configure_Date;

   ---------------------------------
   -- Ocarina_Last_Configure_Year --
   ---------------------------------

   function Ocarina_Last_Configure_Year return String is
   begin
      return Last_Config_Year;
   end Ocarina_Last_Configure_Year;

   ------------------
   -- GNU_Make_Cmd --
   ------------------

   function GNU_Make_Cmd return String is
   begin
      return GNU_Make_Str;
   end GNU_Make_Cmd;

end Ocarina.Configuration;

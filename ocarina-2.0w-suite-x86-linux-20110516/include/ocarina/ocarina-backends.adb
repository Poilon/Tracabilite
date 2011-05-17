------------------------------------------------------------------------------
--                                                                          --
--                           OCARINA COMPONENTS                             --
--                                                                          --
--                     O C A R I N A . B A C K E N D S                      --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
--               Copyright (C) 2008-2010, GET-Telecom Paris.                --
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

with GNAT.OS_Lib; use GNAT.OS_Lib;
with GNAT.Table;

with Charset; use Charset;
with Namet;   use Namet;
with Output;  use Output;
with Errors;  use Errors;

with Ocarina.Backends.Build_Utils;
with Ocarina.Backends.Messages;
with Ocarina.Backends.PN;
with Ocarina.Backends.PO_HI_Ada;
with Ocarina.Backends.PO_HI_C;
with Ocarina.Backends.PO_HI_RTSJ;
with Ocarina.Backends.Stats;
with Ocarina.Backends.Subprograms;
with Ocarina.Backends.Carts;
with Ocarina.Backends.Cheddar;
with Ocarina.Backends.POK_C;
with Ocarina.Backends.PO_QoS_Ada;
with Ocarina.Backends.Properties;
with Ocarina.Backends.Ada_Tree.Nodes;
with Ocarina.Backends.Ada_Tree.Nutils;
with Ocarina.Backends.Ada_Values;
with Ocarina.Backends.C_Tree.Nodes;
with Ocarina.Backends.C_Tree.Nutils;
with Ocarina.Backends.C_Values;
with Ocarina.Backends.RTSJ_Tree.Nodes;
with Ocarina.Backends.RTSJ_Tree.Nutils;
with Ocarina.Backends.RTSJ_Values;
with Ocarina.Backends.XML_Values;
with Ocarina.Backends.XML_Tree.Nutils;
with Ocarina.Backends.BoundT;
with Ocarina.Backends.REAL;

with Ocarina.Options; use Ocarina.Options;

package body Ocarina.Backends is

   use Ocarina.Backends.Messages;

   Current_Backend_Name : Name_Id      := No_Name;
   Current_Backend_Kind : Backend_Kind := Invalid_Backend;

   type Backend_Record is record
      Name    : Name_Id;
      Process : Backend_Subprogram;
      Kind    : Backend_Kind;
   end record;

   package Backend_Table is
      new GNAT.Table (Backend_Record, Natural, 1, 10, 10);

   procedure Write_Backends (Indent : Natural);
   --  Displays the list of registered generators each one on a new
   --  line indented by 'Indent'.

   -------------------
   -- Generate_Code --
   -------------------

   procedure Generate_Code
     (Root         : Node_Id;
      Backend_Name : Name_Id  := No_Name)
   is
      Current_Backend : Natural := 0;

   begin

      --  FIXME: Select the code generator according to information
      --  given in the instance root system.

      if Backend_Name /= No_Name then
         for B in Backend_Table.First .. Backend_Table.Last loop
            if Backend_Table.Table (B).Name = Backend_Name then
               Current_Backend := B;
               Current_Backend_Kind := Backend_Table.Table (B).Kind;
               exit;
            end if;
         end loop;

      elsif Current_Backend_Name = No_Name then
         Display_Error ("No backend name specified", Fatal => True);

      else
         for B in Backend_Table.First .. Backend_Table.Last loop
            if Backend_Table.Table (B).Name = Current_Backend_Name then
               Current_Backend := B;
               Current_Backend_Kind := Backend_Table.Table (B).Kind;
               exit;
            end if;
         end loop;
      end if;

      if Current_Backend = 0 then
         Ocarina.Backends.Messages.Display_Error
           ("Cannot find backend " & Get_Name_String (Current_Backend_Name),
           Fatal => True);
      end if;

      --  Call the current generator entry point

      Backend_Table.Table (Current_Backend).Process (Root);

   exception
      when E : others =>
         Errors.Display_Bug_Box (E);
   end Generate_Code;

   ------------------------------
   -- Get_Current_Backend_Kind --
   ------------------------------

   function Get_Current_Backend_Kind return Backend_Kind is
   begin
      return Current_Backend_Kind;
   end Get_Current_Backend_Kind;

   ----------
   -- Init --
   ----------

   procedure Init is
   begin
      Backend_Table.Init;
      Properties.Init;
      Ada_Tree.Nutils.Initialize;
      C_Tree.Nutils.Initialize;
      RTSJ_Tree.Nutils.Initialize;
      XML_Tree.Nutils.Initialize;

      --  Register the several code generators

      PN.Init;
      BoundT.Init;
      PO_HI_Ada.Init;
      PO_QoS_Ada.Init;
      PO_HI_C.Init;
      PO_HI_RTSJ.Init;
      POK_C.Init;
      Stats.Init;
      Subprograms.Init;
      REAL.Init;
      Carts.Init;
      Cheddar.Init;
   end Init;

   ----------------------
   -- Register_Backend --
   ----------------------

   procedure Register_Backend
     (Name    : String;
      Process : Backend_Subprogram;
      Kind    : Backend_Kind)
   is
      N : Name_Id;

   begin
      --  If the installation directory is unknown, we do not register
      --  the backend to avoid any future error.

      if Installation_Directory = No_Name then
         return;
      end if;

      Get_Name_String (Installation_Directory);
      Add_Str_To_Name_Buffer ("include" & Directory_Separator);
      Add_Str_To_Name_Buffer ("ocarina" & Directory_Separator);
      Add_Str_To_Name_Buffer ("runtime" & Directory_Separator);

      --  If the runtime is not installed, we do not register the
      --  backend to avoid any future error.

      if not Is_Directory (Name_Buffer (1 .. Name_Len)) then
         return;
      end if;

      N := Get_String_Name (To_Lower (Name));
      for B in Backend_Table.First .. Backend_Table.Last loop
         if Backend_Table.Table (B).Name = N then
            Display_Error ("Cannot register twice backend " & Name,
                           Fatal => True);
         end if;
      end loop;

      Backend_Table.Increment_Last;
      Backend_Table.Table (Backend_Table.Last).Name    := N;
      Backend_Table.Table (Backend_Table.Last).Process := Process;
      Backend_Table.Table (Backend_Table.Last).Kind    := Kind;
   end Register_Backend;

   -----------
   -- Reset --
   -----------

   procedure Reset is
   begin
      PO_HI_Ada.Reset;
      PO_HI_C.Reset;
      PO_HI_RTSJ.Reset;
      POK_C.Reset;
      Stats.Reset;
      Carts.Reset;
      PO_QoS_Ada.Reset;

      Ada_Tree.Nutils.Reset;
      C_Tree.Nutils.Reset;
      RTSJ_Tree.Nutils.Reset;

      Ada_Tree.Nodes.Entries.Free;
      Ada_Tree.Nodes.Entries.Init;
      Ada_Values.Reset;

      C_Tree.Nodes.Entries.Free;
      C_Tree.Nodes.Entries.Init;
      C_Values.Reset;

      RTSJ_Tree.Nodes.Entries.Free;
      RTSJ_Tree.Nodes.Entries.Init;
      RTSJ_Values.Reset;

      XML_Values.Reset;
      BoundT.Reset;
      REAL.Reset;

      Build_Utils.Reset;
   end Reset;

   ------------------------------
   -- Set_Current_Backend_Name --
   ------------------------------

   procedure Set_Current_Backend_Name (Name : String) is
   begin
      Current_Backend_Name := Get_String_Name (To_Lower (Name));
   end Set_Current_Backend_Name;

   ------------------------------
   -- Get_Current_Backend_Name --
   ------------------------------

   function Get_Current_Backend_Name return Name_Id is
   begin
      return Current_Backend_Name;
   end Get_Current_Backend_Name;

   -----------
   -- Usage --
   -----------

   procedure Usage is
   begin
      Write_Line ("   -g  Generate code from the AADL instance tree");
      Ocarina.Backends.Write_Backends (7);
      Write_Line
         ("   -arinc653  Generate code for ARINC653 API (POK backend only)");
      Write_Line ("   -b  Generate and build code from the AADL model");
      Write_Line ("   -z  Clean code generated from the AADL model");
   end Usage;

   --------------------
   -- Write_Backends --
   --------------------

   procedure Write_Backends (Indent : Natural) is
   begin
      for Index in 1 .. Indent loop
         Write_Char (' ');
      end loop;

      Write_Line ("Registered backends:");

      for B in Backend_Table.First .. Backend_Table.Last loop
         if Backend_Table.Table (B).Name /= No_Name then
            for Index in 1 .. Indent + 1 loop
               Write_Char (' ');
            end loop;

            Write_Name (Backend_Table.Table (B).Name);
            Write_Eol;
         end if;
      end loop;
   end Write_Backends;

end Ocarina.Backends;

------------------------------------------------------------------------------
--                                                                          --
--                          PolyORB HI COMPONENTS                           --
--                                                                          --
--          A R A O . S E T U P . O A . M U L T I T H R E A D E D           --
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

with ARAO.Setup.Base;
pragma Warnings (Off, ARAO.Setup.Base);
pragma Elaborate_All (ARAO.Setup.Base);

--  Multithreaded mode packages

with PolyORB.Setup.OA.Basic_RT_POA;
pragma Warnings (Off, PolyORB.Setup.OA.Basic_RT_POA);
pragma Elaborate_All (PolyORB.Setup.OA.Basic_RT_POA);

with PolyORB.Request_Scheduler.Servant_Lane;
pragma Warnings (Off, PolyORB.Request_Scheduler.Servant_Lane);
pragma Elaborate_All (PolyORB.Request_Scheduler.Servant_Lane);

with PolyORB.GIOP_P.Tagged_Components.Policies.Priority_Model_Policy;
pragma Warnings
  (Off, PolyORB.GIOP_P.Tagged_Components.Policies.Priority_Model_Policy);
pragma Elaborate_All
  (PolyORB.GIOP_P.Tagged_Components.Policies.Priority_Model_Policy);

with PolyORB.Tasking.Priorities;
with PolyORB.Initialization;
with PolyORB.Utils.Strings;
with PolyORB.Utils.Strings.Lists;
with PolyORB.Types;

package body ARAO.Setup.OA.Multithreaded is
   use PolyORB.Tasking.Priorities;

   procedure Initialize;

   --------------------------
   -- To_External_Priority --
   --------------------------

   procedure To_External_Priority
     (Value    : ORB_Priority;
      Result   : out External_Priority;
      Returns  : out PolyORB.Types.Boolean);

   procedure To_External_Priority
     (Value    : ORB_Priority;
      Result   : out External_Priority;
      Returns  : out PolyORB.Types.Boolean)
   is
   begin
      Result := External_Priority (Value);
      Returns := True;
   end To_External_Priority;

   ---------------------
   -- To_ORB_Priority --
   ---------------------

   procedure To_ORB_Priority
     (Value    : External_Priority;
      Result   : out ORB_Priority;
      Returns  : out PolyORB.Types.Boolean);

   procedure To_ORB_Priority
    (Value    : External_Priority;
      Result   : out ORB_Priority;
      Returns  : out PolyORB.Types.Boolean)
   is
   begin
      Result := ORB_Priority (Value);
      Returns := True;
   end To_ORB_Priority;

   ----------------
   -- Initialize --
   ----------------

   procedure Initialize is
   begin
      PolyORB.Tasking.Priorities.To_External_Priority
        := To_External_Priority'Access;

      PolyORB.Tasking.Priorities.To_ORB_Priority
        := To_ORB_Priority'Access;
   end Initialize;

   use PolyORB.Utils.Strings;
   use PolyORB.Utils.Strings.Lists;

begin
   PolyORB.Initialization.Register_Module
     (PolyORB.Initialization.Module_Info'
      (Name => +"ARAO.OA.multithreaded",
       Conflicts => Empty,
       Depends => Empty,
       Provides => +"arao.setup.oa.multithreaded",
       Implicit => False,
       Init => Initialize'Access,
       Shutdown => null));
end ARAO.Setup.OA.Multithreaded;

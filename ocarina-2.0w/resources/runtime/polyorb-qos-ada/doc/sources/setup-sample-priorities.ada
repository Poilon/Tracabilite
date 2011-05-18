
with ARAO.Setup.Base;
pragma Warnings (Off, ARAO.Setup.Base);
pragma Elaborate_All (ARAO.Setup.Base);
with PolyORB.Setup.IIOP;
pragma Warnings (Off, PolyORB.Setup.IIOP);
pragma Elaborate_All (PolyORB.Setup.IIOP);
with PolyORB.Setup.Access_Points.IIOP;
pragma Warnings (Off, PolyORB.Setup.Access_Points.IIOP);
pragma Elaborate_All (PolyORB.Setup.Access_Points.IIOP);

--  ORB controller : workers
with PolyORB.ORB_Controller.Workers;
pragma Warnings (Off, PolyORB.ORB_Controller.Workers);
pragma Elaborate_All (PolyORB.ORB_Controller.Workers);

--  Multithreaded mode package
with ARAO.Setup.OA.Multithreaded.Prio;
pragma Warnings (Off, ARAO.Setup.OA.Multithreaded.Prio);
pragma Elaborate_All (ARAO.Setup.OA.Multithreaded.Prio);

--  Packages related to Obect Adapter Setup
with PolyORB.Types;
with System;
with ARAO.Threads;
with PolyORB.Setup.OA.Basic_RT_Poa;
with ARAO.Setup.OA.Multithreaded;

--  Packages related to PolyORB initialization mechanism
with PolyORB.Utils.Strings;
with PolyORB.Utils.Strings.Lists;
with PolyORB.Initialization;

package body ARAO.Setup.Application is

   --  No protocol set : default : GIOP/IIOP

   --  Threads data
   Threads_Array_Ü : constant ARAO.Threads.Threads_Properties_Array :=
     ((Standard.Natural
        (1),           --  th1 priority
      Standard.Natural
        (0),
      PolyORB.Types.To_PolyORB_String
        ("th1"),
      Standard.Natural
        (1)),
      (Standard.Natural
        (32),           --  th2 priority
      Standard.Natural
        (0),
      PolyORB.Types.To_PolyORB_String
        ("th2"),
      Standard.Natural
        (0)));

   --  Build custom Object Adapter
   package Priority_Manager is
     new ARAO.Setup.OA.Multithreaded.Prio
        (Threads_Array_Ü);

   procedure Initialize;

   ----------------
   -- Initialize --
   ----------------

   procedure Initialize is
   begin
      Priority_Manager.Initialize;
   end Initialize;

begin
   declare
      use PolyORB.Utils.Strings;
      use PolyORB.Utils.Strings.Lists;
   begin
      PolyORB.Initialization.Register_Module
        (PolyORB.Initialization.Module_Info'
           (Name => + "ARAO.Setup.Application",
            Conflicts => PolyORB.Utils.Strings.Lists.Empty,
            Depends => (+ "arao.setup.oa.multithreaded" & "rt_poa"),
            Provides => PolyORB.Utils.Strings.Lists.Empty,
            Implicit => False,
            Init => Initialize'Access,
            Shutdown => null));
   end;
end ARAO.Setup.Application;


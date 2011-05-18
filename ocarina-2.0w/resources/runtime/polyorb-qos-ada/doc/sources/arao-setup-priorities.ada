
--  General setup
with ARAO.Setup.Base;
pragma Warnings (Off, ARAO.Setup.Base);
pragma Elaborate_All (ARAO.Setup.Base);

--  Low-level setup packages
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

--  priorites-related packages
with PolyORB.Types;
with ARAO.Threads;
with PolyORB.Setup.OA.Basic_RT_Poa;
with ARAO.Setup.OA.Multithreaded;

--  Initialization-related packages
with PolyORB.Initialization;
with PolyORB.Utils.Strings;
with PolyORB.Utils.Strings.Lists;

package body ARAO.Setup.Application is

   --  No protocol set : default : GIOP/IIOP

   Threads_Array_Ü : constant ARAO.Threads.Threads_Properties_Array :=
     ((Standard.Natural
        (1),                --  thread th1 Priority
      Standard.Natural
        (0),
      PolyORB.Types.To_PolyORB_String
        ("th1"),
      Standard.Natural
        (0)),
      (Standard.Natural
        (32),               --  thread th2 Priority
      Standard.Natural
        (0),
      PolyORB.Types.To_PolyORB_String
        ("th2"),
      Standard.Natural
        (2)));

   package Priority_Manager is
     new ARAO.Setup.OA.Multithreaded.Prio
        (Threads_Array_Ü);

   procedure Initialize;

end ARAO.Setup.Application;

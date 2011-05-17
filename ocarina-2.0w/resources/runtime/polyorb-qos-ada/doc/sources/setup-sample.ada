with PolyORB.Initialization;
with Sn_Servants;
with ARAO.Utils;
with ARAO.Periodic_Threads;
with ARAO.RT_Obj_Adapters;
with PolyORB.Setup;
with PolyORB.ORB;

--  Runtime configuration
with ARAO.Setup.Application;
pragma Warnings (Off, ARAO.Setup.Application);
pragma Elaborate_All (ARAO.Setup.Application);

--  Full tasking mode
with ARAO.Setup.Tasking.Full_Tasking;
pragma Warnings (Off, ARAO.Setup.Tasking.Full_Tasking);
pragma Elaborate_All (ARAO.Setup.Tasking.Full_Tasking);

with ARAO.Periodic_Threads;
with ARAO.RT_Obj_Adapters;

procedure proc is
   use proc_Servants;
begin
   PolyORB.Initialization.Initialize_World;

   --  Link local RT POA to current node, specifing priority

   ARAO.RT_Obj_Adapters.Link_To_Obj_Adapter
     (new proc_Servants.th2_Object,
      Th2_Ref,
      1);

   --  Collecting the references of the processes to which it's
   --  connected

   ARAO.Utils.Get_GIOP_Ref (tr1_th1_Ref, "127.0.0.1", 4000, 1, "th1", "iiop", 1);

   --  Create a periodic thread

   ARAO.Periodic_Threads.Create_Periodic_Thread
     (TP => proc_Servants.th1_Controller'Access);

   PolyORB.ORB.Run (PolyORB.Setup.The_ORB, May_Poll => True);
end proc;

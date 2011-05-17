
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
--  Multithreaded no priority mode package
with ARAO.Setup.Ocarina_OA;
pragma Warnings (Off, ARAO.Setup.Ocarina_OA);
pragma Elaborate_All (ARAO.Setup.Ocarina_OA);

package body ARAO.Setup.Application is

   --  No protocol set : default : GIOP/IIOP

   --  No request priority management

end ARAO.Setup.Application;

with Partition;

with PolyORB.Components;
with PolyORB.Servants;
with PolyORB.References;

package proc_Servants is
   ...
   procedure th2_Ctrler;

   type th2_Object is new Servant with null record;

   th2_Ref : PolyORB.References.Ref;

   function Execute_Servant
     (Obj : access th2_Object;
      Msg : PolyORB.Components.Message'Class)
     return PolyORB.Components.Message'Class;

   type th2_msg_in_buf_type is array (1 .. 1) of Partition.message;

   protected th2_Ports is
      procedure Put_msg_in (msg_in : Partition.message);
      procedure Get_msg_in (msg_in : out Partition.message);
      procedure Push_Back_msg_in (msg_in : out Partition.message);
   private
      msg_in_Buf : Th2_Msg_In_Buf_Type.Table;
   end th2_Ports;
   ...
end proc_Servants;

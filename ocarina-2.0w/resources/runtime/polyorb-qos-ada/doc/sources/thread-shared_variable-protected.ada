
procedure Th1_Controller is
   Msg_In : Partition.Message;
   Msg_In_Present : Standard.Boolean;
   Msg_Out : Partition.Message;

   -- local temporary variable definition
   Mem : Partition.Internal_Data;
begin
   --  Read shared data and store it in local variable
   Partition.Get_Field (Sh_Mem, Mem);

   --  Read in IN ports
   Tr_Servants.Th1_IN_Ports.Get_Msg_In
     (Msg_In,
      Msg_In_Present);
   if (True
       and then Msg_In_Present)
   then
      --  Processing local variable
      Repository.Transmit_Message
        (Msg_In => Msg_In,
         Msg_Out => Msg_Out,
         Mem => Mem);

      --  Write in OUT ports
      ARAO.Requests.Emit_Msg
        (Tr_Helpers.To_Any
         (Msg_Out),
         Tr_Th2_Ref,
         "msg_in");
   else
      if Msg_In_Present
      then
         Tr_Servants.Th1_IN_Ports.Push_Back_Msg_In (Msg_In);
      end if;
   end if;

   --  Write back local variable into shared data
   Partition.Set_Field (Sh_Mem, Mem);
end Th1_Controller;


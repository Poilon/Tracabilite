-----------------------
-- Concurrent_Update --
-----------------------

procedure Concurrent_Update (arg : in out Partition.Counter_Type)
is
   Sum  : Partition.Integer_Type;
begin
   --  data initialization
   Partition.Set_Field (Data, 0);

   for I in 0 .. 100 loop
      Partition.Increment (Data);
      Partition.Get_Field (Data, Sum);
      if Integer (Sum) = 100 then
         exit;
      end if;
   end loop;
end Concurrent_Update;

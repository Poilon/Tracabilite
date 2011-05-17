------------
-- update --
------------

procedure Update
  (This : in out Partition.Shared_Data_I;
   I : Partition.Message)
is
begin
   PolyORB.Tasking.Mutexes.Enter
     (This.Mutex);
   Repository.Update
     (Field => This.Field,
      I => I);
   PolyORB.Tasking.Mutexes.Leave
     (This.Mutex);
end Update;

procedure Update
  (This  : in out Message;
   Value : in Partition.Internal_Message) is
begin
   PolyORB.Tasking.Mutexes.Enter (This.Mutex);
   Repository.Update (This, Value);
   PolyORB.Tasking.Mutexes.Leave (This.Mutex);
end Update;

package Partition is

   type Message is private;

   procedure Build
     (This : out Message);

   procedure Get_Data
     (This  : in Message;
      Value : out Internal_Message);

   procedure Set_Data
     (This  : in out Message;
      Value : in Internal_Message);

private

   type Message is
      record
         Data  : Partition.Internal_Message;
         Mutex : PolyORB.Tasking.Mutexes.Mutex_Access;
      end record;

end Partition;

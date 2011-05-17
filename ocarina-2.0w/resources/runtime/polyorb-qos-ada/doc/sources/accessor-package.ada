package Partition is

   type Integer_Type is new Integer;
   type Counter_Type is private;

   procedure Build
     (This : out Partition.Integer_Type);

   procedure Get_Field
     (This  : in Message;
      Value : out Partition.Integer_Type);

   procedure Set_Field
     (This  : in out Message;
      Value : in Partition.Integer_Type);

   procedure Increment
     (This : in out Counter_Type);

private
   type Counter_Type is
      record
         Field : Partition.Integer_Type;
         Mutex : PolyORB.Tasking.Mutexes.Mutex_Access;
      end record;

end Partition;

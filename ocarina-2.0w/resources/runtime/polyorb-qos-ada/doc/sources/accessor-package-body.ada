with Repository;

package body Counter_Type_PKG is

   -----------
   -- Build --
   -----------

   procedure Build
     (This : out Message)
   is
   begin
      --  Initialize the middleware's mutex
      PolyORB.Tasking.Mutexes.Create (T.Mutex);
   end Build;

   ---------------
   -- Get_Field --
   ---------------

   procedure Get_Field
     (This  : in Counter_Type;
      Value : out Partition.Integer_Type)
   is
   begin
      PolyORB.Tasking.Mutexes.Enter (T.Mutex);
      Value := This.Field;
      PolyORB.Tasking.Mutexes.Leave (T.Mutex);
   end Get_Field;

   ---------------
   -- Set_Field --
   ---------------

   procedure Set_Field
     (This  : in out Counter_Type;
      Value : in Partition.Integer_Type)
   is
   begin
      PolyORB.Tasking.Mutexes.Enter (T.Mutex);
      This.Field := Value;
      PolyORB.Tasking.Mutexes.Leave (T.Mutex);
   end Set_Field;

   ---------------
   -- Increment --
   ---------------

   procedure Increment
     (This : in out Counter_Type)
   is
   begin
      PolyORB.Tasking.Mutexes.Enter (This.Mutex);
      Repository.Increment (This.Field);
      PolyORB.Tasking.Mutexes.Leave (This.Mutex);
   end Increment;

end Counter_Type_PKG;

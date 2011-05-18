  procedure Update (Field : in out Partition.Internal_Data;
                    I : in Partition.message);

   ------------
   -- Update --
   ------------

   procedure Update (Field : in out Partition.Internal_Data;
                     I : in Partition.message)
   is
      use Partition;
   begin
      Field := Partition.Internal_Data (Integer (Field) + Integer (I));
   end Update;

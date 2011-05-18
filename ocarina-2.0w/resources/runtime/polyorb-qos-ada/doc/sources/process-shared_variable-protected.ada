package body Tr_Servants is

   --  Shared variable declaration

   Sh_Mem : Partition.Shared_Data_I;

   --  Initialization procedure declaration and description

   procedure Initialize;

   ----------------
   -- Initialize --
   ----------------

   procedure Initialize is
   begin
      Partition.Builder
        (Sh_Mem);
   end Initialize;

   --  Threads-related code
   --  (...)

   --  Bind initialization function with middleware initialization
begin
   declare
      use PolyORB.Utils.Strings;
      use PolyORB.Utils.Strings.Lists;
   begin
      PolyORB.Initialization.Register_Module
        (PolyORB.Initialization.Module_Info'
         (Name => + "tr_Servants",
          Conflicts => PolyORB.Utils.Strings.Lists.Empty,
          Depends => + "any",
          Provides => PolyORB.Utils.Strings.Lists.Empty,
          Implicit => False,
          Init => Initialize'Access,
          Shutdown => null));
   end;
end Tr_Servants;

procedure SpA_Impl (a : in int; d : out int) is
   Status : spA_impl_Status;
begin
   Status.a := a;
   Repository.SpA_Impl
     (Status,
      SpA_Seq1'Access,
      SpA_Seq2'Access,
      SpA_Seq3'Access);
   d := Status.d;
end SpA_Impl;

type SpA_Impl_Call_Sequence is access
  procedure (in out Status : spA_impl_Status);

procedure SpA_Impl
  (Status : in out spA_impl_Status,
   seq1   : spA_impl_Call_Sequence,
   seq2   : spA_impl_Call_Sequence,
   seq3   : spA_impl_Call_Sequence)
is
begin
   if Status.a > 4 then
      seq1.all (Status);
   else
      seq2.all (Status);
   end if;
   seq3.all (Status);
end SpA_Impl;

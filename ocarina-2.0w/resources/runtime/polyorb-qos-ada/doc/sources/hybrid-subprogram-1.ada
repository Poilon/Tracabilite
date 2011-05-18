type SpA_Impl_Status is record
  a, b, c, d : int;
end record;

procedure SpA_Seq1 (in out Status : spA_impl_Status) is
begin
   spB (Status.a, Status.b);
end SpA_Seq1;

procedure SpA_Seq2 (in out Status : spA_impl_Status) is
begin
   spC (Status.c);
   spB (Status.c, Status.b);
end SpA_Seq2;

procedure SpA_Seq3 (in out Status : spA_impl_Status) is
begin
   spD (Status.b, d);
end SpA_Seq3;

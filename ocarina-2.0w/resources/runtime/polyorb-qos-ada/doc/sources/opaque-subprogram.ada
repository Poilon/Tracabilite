with Repository;
...
procedure sp_impl (e : in message; s : out message)
  renames Repository.Sp_Impl;

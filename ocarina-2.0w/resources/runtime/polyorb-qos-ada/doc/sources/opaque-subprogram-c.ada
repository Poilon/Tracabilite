procedure sp_impl (e : in message; s : out message);
pragma Import (C, sp_impl, "implem");

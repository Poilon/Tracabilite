procedure spA_impl (s : out message) is
   cnx1 : message;
begin
   spB (cnx1);
   spC (cnx1, s);
end spA_impl;

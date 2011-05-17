if a < 4 then
  b <- spB (a)
else
  c <- spC ()
  b <- spB (c)
end if

d <- spD (b)
return d

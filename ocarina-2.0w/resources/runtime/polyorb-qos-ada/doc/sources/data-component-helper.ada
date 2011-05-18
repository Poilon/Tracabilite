with Partition;
with PolyORB.Any;

package proc_helpers is
   --  TypeCode variable used to characterize an Any variable

   TC_message : PolyORB.Any.TypeCode.Object :=
      PolyORB.Any.TypeCode.TC_Alias;

   function From_Any (Item : in PolyORB.Any.Any) return Partition.message;

   function To_Any (Item : in Partition.message) return PolyORB.Any.Any;

end proc_helpers;

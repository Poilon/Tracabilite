package body PolyORB.Parameters.Partition is

   type Parameter_Entry is
      record
         Key : PolyORB.Utils.Strings.String_Ptr;
         Val : PolyORB.Utils.Strings.String_Ptr;
      end record;

   Conf_Table : constant array (1 .. 2)
     of Parameter_Entry :=
     ((new Standard.String'
        ("polyorb.protocols.iiop.default_addr"),
      new Standard.String'
        ("127.0.0.1")),
      (new Standard.String'
        ("polyorb.protocols.iiop.default_port"),
      new Standard.String'
        ("3200")));

   type Partition_Source is
     new PolyORB.Parameters.Parameters_Source with null record;

   The_Partition_Source : aliased Partition_Source;

   function Get_Conf
     (Source : access Partition_Source;
      Section : Standard.String;
      Key : Standard.String)
     return Standard.String;
   --  Called by PolyORB Initialization
   --  return the configuration data as in the Conf_Table array

   procedure Initialize;
   --  Initialize PolyORB by registerering Get_Conf function

end PolyORB.Parameters.Partition;

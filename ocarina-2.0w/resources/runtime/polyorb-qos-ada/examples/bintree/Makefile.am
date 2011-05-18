ADA_SPECS_WITH_BODY = \
        $(srcdir)/bool_pkg.ads \
        $(srcdir)/common.ads \
        $(srcdir)/float_pkg.ads \
        $(srcdir)/int_pkg.ads \
        $(srcdir)/msg_bool_pkg.ads \
        $(srcdir)/msg_float_pkg.ads \
        $(srcdir)/msg_int_pkg.ads \
        $(srcdir)/msg_str_pkg.ads \
        $(srcdir)/record_pkg.ads \
        $(srcdir)/repository.ads \
        $(srcdir)/str_pkg.ads

ADA_SPECS = $(ADA_SPECS_WITH_BODY)

ADA_BODIES = $(ADA_SPECS_WITH_BODY:.ads=.adb)

EXTRA_DIST = $(ADA_SPECS) $(ADA_BODIES) \
	$(srcdir)/hardware.aadl \
	$(srcdir)/software.aadl \
	$(srcdir)/bintree.aadl \
	$(srcdir)/all_types.aadl \
	$(srcdir)/type_tree.aadl \
	$(srcdir)/type_tree_udp.aadl \
	$(srcdir)/scenario_1.aadl \
	$(srcdir)/scenario_2.aadl \
	$(srcdir)/scenario_2_udp.aadl

SAMPLE_DIR = $(prefix)/examples/ocarina/polyorb-qos-ada/bintree

install-data-local:
	$(INSTALL) -d $(DESTDIR)$(SAMPLE_DIR)
	for f in $(ADA_SPECS) $(ADA_BODIES); do \
	  $(INSTALL_DATA) $$f $(DESTDIR)$(SAMPLE_DIR); \
	done;
	$(INSTALL_DATA) $(srcdir)/hardware.aadl $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/software.aadl $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/bintree.aadl $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/all_types.aadl $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/type_tree.aadl $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/type_tree_udp.aadl $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/scenario_1.aadl $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/scenario_2.aadl $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/scenario_2_udp.aadl $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/README $(DESTDIR)$(SAMPLE_DIR)

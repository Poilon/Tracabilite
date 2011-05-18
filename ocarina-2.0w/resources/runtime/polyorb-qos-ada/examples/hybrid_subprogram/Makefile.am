EXTRA_DIST = $(srcdir)/hardware.aadl \
	$(srcdir)/software.aadl \
	$(srcdir)/hybrid_subprogram.aadl \
	$(srcdir)/complex_subprogram.aadl \
	$(srcdir)/pure_call_sequence_subprogram.aadl \
	$(srcdir)/repository.adb \
	$(srcdir)/repository.ads \
	$(srcdir)/repository_2.adb \
	$(srcdir)/repository_2.ads \
	$(srcdir)/scenario_1.aadl \
	$(srcdir)/scenario_2.aadl \
	$(srcdir)/scenario_3.aadl

SAMPLE_DIR = $(prefix)/examples/ocarina/polyorb-qos-ada/hybrid_subprogram

install-data-local:
	$(INSTALL) -d $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/hardware.aadl $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/software.aadl $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/hybrid_subprogram.aadl $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/pure_call_sequence_subprogram.aadl $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/complex_subprogram.aadl $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/repository.adb $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/repository.ads $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/repository_2.adb $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/repository_2.ads $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/scenario_1.aadl $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/scenario_2.aadl $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/scenario_3.aadl $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/README $(DESTDIR)$(SAMPLE_DIR)

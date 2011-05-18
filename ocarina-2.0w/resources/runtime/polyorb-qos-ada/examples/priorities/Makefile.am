EXTRA_DIST = $(srcdir)/hardware.aadl \
	$(srcdir)/software.aadl \
	$(srcdir)/software_inversed_priorities.aadl \
	$(srcdir)/priorities.aadl \
	$(srcdir)/priorities_2.aadl \
	$(srcdir)/repository.adb \
	$(srcdir)/repository.ads \
	$(srcdir)/scenario.aadl \
	$(srcdir)/scenario_inv.aadl

SAMPLE_DIR = $(prefix)/examples/ocarina/polyorb-qos-ada/priorities

install-data-local:
	$(INSTALL) -d $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/hardware.aadl $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/software_inversed_priorities.aadl  $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/software.aadl $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/priorities.aadl $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/priorities_2.aadl $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/repository.adb $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/repository.ads $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/scenario.aadl $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/scenario_inv.aadl $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/README $(DESTDIR)$(SAMPLE_DIR)

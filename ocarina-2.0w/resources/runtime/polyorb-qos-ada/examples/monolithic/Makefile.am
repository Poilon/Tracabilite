EXTRA_DIST = $(srcdir)/hardware.aadl \
	$(srcdir)/software.aadl \
	$(srcdir)/monolithic.aadl \
	$(srcdir)/repository.adb \
	$(srcdir)/repository.ads \
	$(srcdir)/scenario.aadl 

SAMPLE_DIR = $(prefix)/examples/ocarina/polyorb-qos-ada/monolithic

install-data-local:
	$(INSTALL) -d $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/hardware.aadl $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/software.aadl $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/monolithic.aadl $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/repository.adb $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/repository.ads $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/scenario.aadl $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/README $(DESTDIR)$(SAMPLE_DIR)


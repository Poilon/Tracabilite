EXTRA_DIST = $(srcdir)/hardware.aadl \
	$(srcdir)/software.aadl \
	$(srcdir)/shared.aadl \
	$(srcdir)/data.aadl \
	$(srcdir)/repository.adb \
	$(srcdir)/repository.ads \
	$(srcdir)/repository_main.adb \
	$(srcdir)/repository_main.ads \
	$(srcdir)/scenario.aadl

SAMPLE_DIR = $(prefix)/examples/ocarina/polyorb-qos-ada/shared

install-data-local:
	$(INSTALL) -d $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/hardware.aadl $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/software.aadl $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/shared.aadl $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/data.aadl $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/repository.adb $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/repository.ads $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/repository_main.adb $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/repository_main.ads $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/scenario.aadl $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/README $(DESTDIR)$(SAMPLE_DIR)


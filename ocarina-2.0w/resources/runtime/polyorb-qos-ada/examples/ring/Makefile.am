EXTRA_DIST = $(srcdir)/hardware.aadl \
	$(srcdir)/software.aadl \
	$(srcdir)/ring.aadl \
	$(srcdir)/ring_udp.aadl \
	$(srcdir)/ring2.aadl \
	$(srcdir)/repository.adb \
	$(srcdir)/repository.ads \
	$(srcdir)/scenario_1.aadl \
	$(srcdir)/scenario_1_udp.aadl \
	$(srcdir)/scenario_2.aadl \
	$(srcdir)/send_message.psc 

SAMPLE_DIR = $(prefix)/examples/ocarina/polyorb-qos-ada/ring

install-data-local:
	$(INSTALL) -d $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/hardware.aadl $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/software.aadl $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/ring.aadl $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/ring2.aadl $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/ring_udp.aadl $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/repository.adb $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/repository.ads $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/scenario_1.aadl $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/scenario_2.aadl $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/scenario_1_udp.aadl $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/send_message.psc $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/README $(DESTDIR)$(SAMPLE_DIR)


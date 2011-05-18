include $(top_srcdir)/Makefile.common

PROJECT_FILE = $(srcdir)/arao_polyorb.gpr

EXTRA_DIST = $(PROJECT_FILE) \
	$(ADA_SPECS) \
	$(ADA_BODIES) \
	$(srcdir)/arao_polyorb.lgpr

all-local:
	if test ! "$(POLYORB_CONFIG)" = "no";  then \
	  mkdir -p objects && mkdir -p libs; \
	  $(INIT_ADA_PROJECT_PATH) $(GNATMAKE) -P $(PROJECT_FILE) \
	   -XABS_SRC_DIR="$(PL_DEP_ABS_SRC_DIR)" \
	   -XABS_BUILD_DIR="$(PL_DEP_ABS_BUILD_DIR)" \
	   $(GNATFLAGS) $(AP_FLAGS) \
	   ${shell $(POLYORB_CONFIG) | sed -e 's,\\,\\\\,g'}; \
	fi

clean-local:
	if [ -d objects ] && [ -d libs ]; then \
	  $(INIT_ADA_PROJECT_PATH) $(GNATCLEAN) -P $(PROJECT_FILE) \
	    -XABS_SRC_DIR="$(PL_DEP_ABS_SRC_DIR)" \
	    -XABS_BUILD_DIR="$(PL_DEP_ABS_BUILD_DIR)" \
	    $(AP_FLAGS) ; \
	  rm -rf objects libs; \
	fi;

po_runtime_dir = $(includedir)/ocarina/runtime/polyorb-qos-ada

install-data-local:
	$(INSTALL) -d $(DESTDIR)$(po_runtime_dir)
	for f in $(ADA_SPECS) $(ADA_BODIES); do \
	  $(INSTALL) -m 444 $$f $(DESTDIR)$(po_runtime_dir); \
	done

uninstall-local:
	rm -rf $(DESTDIR)$(po_runtime_dir)

dist-hook:
	mkdir -p $(distdir)/objects
	mkdir -p $(distdir)/libs


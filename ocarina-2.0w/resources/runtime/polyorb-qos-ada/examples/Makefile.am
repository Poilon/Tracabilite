SUBDIRS = \
	bbs \
	bintree \
	ring \
	man_in_the_middle \
	producer_consumer \
	priorities \
	hybrid_subprogram \
	shared \
	import \
	monolithic

EXTRA_DIST = build_all_examples.sh \
	run_all_examples.sh

SAMPLE_DIR = $(prefix)/examples/ocarina/polyorb-qos-ada

install-exec-local:
	$(INSTALL) -d $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_SCRIPT) $(srcdir)/build_all_examples.sh $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_SCRIPT) $(srcdir)/run_all_examples.sh $(DESTDIR)$(SAMPLE_DIR)

install-data-local:
	$(INSTALL) -d $(DESTDIR)$(SAMPLE_DIR)
	$(INSTALL_DATA) $(srcdir)/README $(DESTDIR)$(SAMPLE_DIR)

uninstall-local:
	rm -rf $(DESTDIR)$(SAMPLE_DIR)

# Targets that are called from the main makefile

XPL_RESULT_MSG     :=
XPL_GENRATE_OPTION := 
CLEAR_AT_TEST_END   = yes

generate-examples: \
   XPL_RESULT_MSG := "EXAMPLES SUCCESSFULLY GENERATED"

generate-examples: \
   XPL_GENRATE_OPTION := -n

build-examples: \
   XPL_RESULT_MSG := "EXAMPLES SUCCESSFULLY BUILT"

build-examples: \
   XPL_GENRATE_OPTION :=

%-examples: check-tmp-dir
	@cd $(tmp_dir) \
	&& PATH="$(DESTDIR)$(bindir):$$PATH" \
	&& path_conv="@CYGPATH_W@" \
	   $(DESTDIR)$(SAMPLE_DIR)/build_all_examples.sh ${XPL_GENRATE_OPTION}\
	&& (test '$(CLEAR_AT_TEST_END)' = yes \
	    && clear \
	    && echo ${XPL_RESULT_MSG} \
	    && echo "TESTED: `which ocarina`" \
	    && sleep 5 || true)
	@if test $* = "build" -a 'x$(RUN_EXAMPLES)' = xyes; then \
	   cd $(tmp_dir) \
	   && PATH="$(DESTDIR)$(bindir):$$PATH" \
	   && $(DESTDIR)$(SAMPLE_DIR)/run_all_examples.sh\
	   && (test '$(CLEAR_AT_TEST_END)' = yes \
	        && clear \
	        && echo "EXAMPLES SUCCESSFULLY RUN" \
	        && echo "TESTED: `which ocarina`" \
                && sleep 5 || true); \
	fi

check-tmp-dir:
	@if test ! -n '$(tmp_dir)'; then \
          echo "ERROR: tmp_dir not specified" ; \
          exit 1 ; \
        fi

AUTOMAKE_OPTIONS = no-dependencies
ACLOCAL_AMFLAGS = -I support
CLEANFILES = config-stamp

SUBDIRS = support doc src
DIST_SUBDIRS = $(SUBDIRS) examples

# Default testing behavior. Can be overridden by the user
GENRATE_EXAMPLES  = no
BUILD_EXAMPLES    = no
RUN_EXAMPLES      = no
CLEAR_AT_TEST_END = yes

examples-internal:
	@if test '$(GENRATE_EXAMPLES)' = yes; then \
	    tmp_dir=samples.$$$$ && mkdir -p $$tmp_dir\
	    && cd $$tmp_dir && tmp_dir=`pwd` && cd @abs_top_builddir@\
	    && $(MAKE) -C examples generate-examples "tmp_dir=$$tmp_dir" \
	       "CLEAR_AT_TEST_END=$(CLEAR_AT_TEST_END)" \
	    && rm -rf $$tmp_dir; \
	fi
	@if test '$(BUILD_EXAMPLES)' = yes; then \
	    tmp_dir=samples.$$$$ && mkdir -p $$tmp_dir\
	    && cd $$tmp_dir && tmp_dir=`pwd` && cd @abs_top_builddir@\
	    && $(MAKE) -C examples build-examples \
	       "tmp_dir=$$tmp_dir" "RUN_EXAMPLES=$(RUN_EXAMPLES)" \
	       "CLEAR_AT_TEST_END=$(CLEAR_AT_TEST_END)" \
	    && rm -rf $$tmp_dir; \
	fi

genexamples::
	@$(MAKE) examples-internal "GENRATE_EXAMPLES=yes" \
	  "BUILD_EXAMPLES=no" "RUN_EXAMPLES=no" "CLEAR_AT_TEST_END=no"

examples::
	@$(MAKE) examples-internal "GENRATE_EXAMPLES=yes" \
	  "BUILD_EXAMPLES=yes" "RUN_EXAMPLES=yes" "CLEAR_AT_TEST_END=no"

check-local: install
	@$(MAKE) examples

install-data-local:
	$(MAKE) -C examples DESTDIR="$(DESTDIR)" install

uninstall-local:
	$(MAKE) -C examples DESTDIR="$(DESTDIR)" uninstall
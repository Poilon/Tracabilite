ADAFILES= $(srcdir)/sources/data-component-helper.ada			    \
		$(srcdir)/sources/data-component-record.ada		    \
		$(srcdir)/sources/data-component-simple.ada		    \
		$(srcdir)/sources/empty-subprogram.ada			    \
		$(srcdir)/sources/hybrid-algorithm.ada			    \
		$(srcdir)/sources/hybrid-subprogram-1.ada		    \
		$(srcdir)/sources/hybrid-subprogram-2.ada		    \
		$(srcdir)/sources/hybrid-subprogram-3.ada		    \
		$(srcdir)/sources/opaque-subprogram.ada			    \
		$(srcdir)/sources/opaque-subprogram-c.ada		    \
		$(srcdir)/sources/protected_type-generic-package.ada	    \
		$(srcdir)/sources/protected_type-generic-package-method.ada \
		$(srcdir)/sources/accessor-usage.ada			    \
		$(srcdir)/sources/accessor-package.ada			    \
		$(srcdir)/sources/process-shared_variable-protected.ada	    \
		$(srcdir)/sources/thread-shared_variable-protected.ada	    \
		$(srcdir)/sources/accessor-package-body.ada		    \
		$(srcdir)/sources/protected-subprogram-user.ada		    \
		$(srcdir)/sources/protected-subprogram-generated.ada	    \
		$(srcdir)/sources/pure-call-sequence-subprogram.ada	    \
		$(srcdir)/sources/setup-sample.ada			    \
		$(srcdir)/sources/thread-in-ports-servants.ada		    \
		$(srcdir)/sources/thread-main.ada			    \
		$(srcdir)/sources/thread-servants.ada			    \
		$(srcdir)/sources/setup-sample-priorities.ada		    \
		$(srcdir)/positioning/polyorb-parameters-partition.ada	    \
		$(srcdir)/sources/arao-setup.ada			    \
		$(srcdir)/sources/arao-setup-priorities.ada

AADLFILES= $(srcdir)/sources/data-component-record.aadl			\
	$(srcdir)/sources/data-component-simple.aadl			\
	$(srcdir)/sources/empty-subprogram.aadl				\
	$(srcdir)/sources/hybrid-subprogram.aadl			\
	$(srcdir)/sources/opaque-subprogram.aadl			\
	$(srcdir)/sources/opaque-subprogram-c.aadl			\
	$(srcdir)/sources/pure-call-sequence-subprogram.aadl		\
	$(srcdir)/sources/accessor-usage.aadl				\
	$(srcdir)/sources/setup-sample.aadl				\
	$(srcdir)/sources/thread-component.aadl				\
	$(srcdir)/sources/thread-in-ports.aadl				\
	$(srcdir)/sources/process-shared_variable-protected.aadl	\
	$(srcdir)/sources/setup-sample-priorities.aadl			\
	$(srcdir)/sources/data-component-protected.aadl			\
	$(srcdir)/sources/protected-subprogram.aadl			\
	$(srcdir)/positioning/positioning-sample.aadl

APIFILES= $(top_srcdir)/src/arao-cyclic_array.ads			\
	$(top_srcdir)/src/arao-object_adapter_g.ads			\
	$(top_srcdir)/src/arao-periodic_threads-full_tasking.ads	\
	$(top_srcdir)/src/arao-periodic_threads-no_tasking.ads		\
	$(top_srcdir)/src/arao-rt_obj_adapters.ads			\
	$(top_srcdir)/src/arao-setup.ads				\
	$(top_srcdir)/src/arao-setup-base.ads				\
	$(top_srcdir)/src/arao-setup-oa.ads				\
	$(top_srcdir)/src/arao-setup-ocarina_oa.ads			\
	$(top_srcdir)/src/arao-setup-tasking.ads			\
	$(top_srcdir)/src/arao-setup-tasking-full_tasking.ads		\
	$(top_srcdir)/src/arao-setup-tasking-no_tasking.ads		\
	$(top_srcdir)/src/arao-threads.ads				\
	$(top_srcdir)/src/arao-obj_adapters.ads				\
	$(top_srcdir)/src/arao-periodic_threads.ads			\
	$(top_srcdir)/src/arao-requests.ads				\
	$(top_srcdir)/src/arao-utils.ads				\
	$(top_srcdir)/src/arao-setup-oa-multithreaded.ads		\
	$(top_srcdir)/src/arao-setup-oa-multithreaded-prio.ads


GEN_TEXIFILES= ${notdir $(ADAFILES:=.texi) $(AADLFILES:=.texi) $(APIFILES:=.texi)}

IMAGE_NAMES= $(srcdir)/images/component $(srcdir)/images/connection	\
	$(srcdir)/images/feature $(srcdir)/images/mubroker_complet	\
	$(srcdir)/images/spg_connection $(srcdir)/images/subprogram

ALL_IMAGES= $(IMAGE_NAMES:=.eps) $(IMAGE_NAMES:=.png) $(IMAGE_NAMES:=.pdf)

KW_FILES = $(srcdir)/aadl.kw $(srcdir)/ada.kw

SED_FILES = ${notdir $(KW_FILES:.kw=.sed)}

GUIDE=polyorb-qos-ada_ug

GUIDE_TEXIFILES =\
	$(srcdir)/$(GUIDE).texi\
	$(GEN_TEXIFILES) \
	gfdl.texi

EXTRA_DIST=\
	$(GUIDE_TEXIFILES)\
	$(ALL_IMAGES)\
	$(ADAFILES)\
	$(AADLFILES)\
	$(KW_FILES)\
	$(srcdir)/ocarina.css

info_TEXINFOS = polyorb-qos-ada_ug.texi
polyorb_qos_ada_ug_TEXINFOS=$(GUIDE_TEXIFILES)

all-local: $(GUIDE).html $(GUIDE).pdf

$(GUIDE).html: $(IMAGES) $(GUIDE_TEXIFILES)
	$(MAKEINFO) --css-include=$(srcdir)/ocarina.css --html $(srcdir)/$(GUIDE).texi -o $(GUIDE).html
	rm -rf $(GUIDE).html/images
	mkdir -p $(GUIDE).html/images
	cp -p $(srcdir)/images/*.png $(GUIDE).html/images/
	INDEX_FILE="$(GUIDE).html/index.html";\
	TMP_FILE="$$INDEX_FILE.tmp"; \
	cat "$$INDEX_FILE" | sed 's/$$LastChangedDate: \([^$$]*\) \$$/Last Modified: \1/g' > "$$TMP_FILE"; \
	mv -f "$$TMP_FILE" "$$INDEX_FILE"

$(GUIDE).pdf: $(IMAGES) $(GUIDE_TEXIFILES)
	$(TEXI2PDF) $(srcdir)/$(GUIDE).texi

clean-local:
	rm -f *.aux *.log *.dvi *.info *.tmp
	rm -f *.cp *.pg *.toc *.vr *.fn *.ky *.tp *~

distclean-local:
	rm -f $(GEN_TEXIFILES)
	rm -rf *-stamp
	rm -f *.sed
	rm -rf $(GUIDE).html $(GUIDE).pdf

# In VPATH builds, make difference between the case the doc is built
# by the user and the case it is provided to him by the package.

dist-hook: all
	if [ -r $(GUIDE).pdf ]; then \
	  cp -p -r $(GUIDE).html $(GUIDE).pdf $(distdir); \
	  cp -p $(SED_FILES) $(distdir); \
	else \
	  cp -r $(srcdir)/$(GUIDE).html $(srcdir)/$(GUIDE).pdf $(distdir); \
	  cp -p ${addprefix $(srcdir)/, $(SED_FILES)} $(distdir); \
	fi
	touch $(distdir)/sed-stamp
	touch $(distdir)/ada-stamp
	touch $(distdir)/adb-stamp
	touch $(distdir)/ads-stamp
	touch $(distdir)/aadl-stamp

install-data-local: all
	$(INSTALL) -d $(DESTDIR)$(datadir)/doc/ocarina
	if [ -r $(GUIDE).pdf ]; then \
	  $(INSTALL_DATA) $(GUIDE).pdf $(DESTDIR)$(datadir)/doc/ocarina; \
	  $(INSTALL) -d $(DESTDIR)$(datadir)/doc/ocarina/$(GUIDE).html; \
	  for f in $(GUIDE).html/*.html; do \
            $(INSTALL_DATA) $$f $(DESTDIR)$(datadir)/doc/ocarina/$(GUIDE).html; \
          done; \
	  $(INSTALL) -d $(DESTDIR)$(datadir)/doc/ocarina/$(GUIDE).html/images; \
	  for f in $(GUIDE).html/images/*.png; do \
            $(INSTALL_DATA) $$f $(DESTDIR)$(datadir)/doc/ocarina/$(GUIDE).html/images; \
          done; \
	else \
	  $(INSTALL_DATA) $(srcdir)/$(GUIDE).pdf $(DESTDIR)$(datadir)/doc/ocarina; \
	  $(INSTALL) -d $(DESTDIR)$(datadir)/doc/ocarina/$(GUIDE).html; \
	  for f in $(srcdir)/$(GUIDE).html/*.html; do \
            $(INSTALL_DATA) $$f $(DESTDIR)$(datadir)/doc/ocarina/$(GUIDE).html; \
          done; \
	  $(INSTALL) -d $(DESTDIR)$(datadir)/doc/ocarina/$(GUIDE).html/images; \
	  for f in $(srcdir)/$(GUIDE).html/images/*.png; do \
            $(INSTALL_DATA) $$f $(DESTDIR)$(datadir)/doc/ocarina/$(GUIDE).html/images; \
          done; \
	fi

uninstall-local:
	rm -rf $(DESTDIR)$(datadir)/doc/ocarina

$(GUIDE_TEXIFILES): ada-stamp adb-stamp ads-stamp aadl-stamp

ada-stamp: $(top_srcdir)/support/gentexifile $(ADAFILES) sed-stamp
	for f in ${filter %.ada, $(ADAFILES)}; do \
	  $(SHELL) $(top_srcdir)/support/gentexifile $$f; \
	done
	touch ada-stamp

adb-stamp: $(top_srcdir)/support/gentexifile $(ADAFILES) sed-stamp
	for f in ${filter %.adb, $(ADAFILES)}; do \
	  $(SHELL) $(top_srcdir)/support/gentexifile $$f; \
	done
	touch adb-stamp

ads-stamp: $(top_srcdir)/support/gen_api_doc $(APIFILES)
	ABS_TOP_SRCDIR="@abs_top_srcdir@" \
	ABS_TOP_BUILDDIR="@abs_top_builddir@" \
	  $(SHELL) $(top_srcdir)/support/gen_api_doc
	touch ads-stamp

aadl-stamp: $(top_srcdir)/support/gentexifile $(AADLFILES) sed-stamp
	for f in $(AADLFILES); do \
	  $(SHELL) $(top_srcdir)/support/gentexifile $$f; \
	done
	touch aadl-stamp

sed-stamp: $(top_srcdir)/support/gensedfile $(KW_FILES)
	for f in $(KW_FILES); do \
	  $(SHELL) $(top_srcdir)/support/gensedfile $$f; \
	done
	touch sed-stamp

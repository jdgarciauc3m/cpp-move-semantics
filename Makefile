FINAL_DIR= final

LATEXMK=latexmk -pdf -file-line-error -halt-on-error -outdir=$(FINAL_DIR) 

CONFIG_SLIDES= \
	common/metadata.tex \
	config/common.tex  \
	config/common-title.tex  \
	config/config-lst.tex  \
	config/config-tc-one.tex  \
	config/footline.tex  \
	config/packages.tex\

LOGOS=logos/*

include m1/Makefile.def
include m2/Makefile.def
include m3/Makefile.def
include m4/Makefile.def
include m5/Makefile.def
include m6/Makefile.def
include m7/Makefile.def
include m8/Makefile.def
include m9/Makefile.def
include guide/Makefile.def

.PHONY: all clean updatevers slides ejer guide

all:	slides guide

clean:
	rm -Rf $(FINAL_DIR)

$(FINAL_DIR):
	mkdir -p $(FINAL_DIR)

$(FINAL_DIR)/version.tex:	| $(FINAL_DIR)
	git log -1 --format=%ad --date=format:'\newcommand{\versiondate}{%B de %Y}' > $(FINAL_DIR)/version.tex
	git log -1 --format='\newcommand{\versionid}{%h}' >> $(FINAL_DIR)/version.tex

slides: $(ALL_SLIDES_FINAL_PDF)

guide:	$(GUIDE_FINAL_PDF)

include $(M1_DIR)/Makefile.mk
include $(M2_DIR)/Makefile.mk
include $(M3_DIR)/Makefile.mk
include $(M4_DIR)/Makefile.mk
include $(M5_DIR)/Makefile.mk
include $(M6_DIR)/Makefile.mk
include $(M7_DIR)/Makefile.mk
include $(M8_DIR)/Makefile.mk
include $(M9_DIR)/Makefile.mk
include $(GUIDE_DIR)/Makefile.mk

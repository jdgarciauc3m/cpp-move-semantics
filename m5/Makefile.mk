#include $(M5_L1_DIR)/Makefile.mk

$(FINAL_M5_PDF): $(M5_PARTS) $(CONFIG_SLIDES)
	$(LATEXMK) -jobname=$(subst /,-,$(<D)) $(M5_DIR)/slides


WD=./temp
TEXC=pdflatex
BIBC=biber
TEXOPT=-halt-on-error -output-directory=$(WD)
BIBOPT=-input-directory=$(WD) -output-directory=$(WD)
TRGT=cv-en.pdf long-cv-fr.pdf
ICONS=$(wildcard ./icons/*.png)
FIGSRC=$(wildcard ./figures/*.tex)
FIGS=$(FIGSRC:.tex=.pdf)

all: $(TRGT)

$(WD):
	mkdir -p $(WD)

.PRECIOUS: $(FIGS)

./figures/%.pdf:./figures/%.tex | $(WD)
	$(TEXC) $(TEXOPT) $<
	mv $(WD)/$(notdir $@) ./figures

%.pdf : %.tex $(ICONS) $(FIGS) | $(WD)
	$(TEXC) $(TEXOPT) $<
	$(TEXC) $(TEXOPT) $<
	mv $(WD)/$@ .

.PHONY: clean mrproper

clean:
	rm -rf $(WD)

mrproper: clean
	rm -rf $(TRGT)

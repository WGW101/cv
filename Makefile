WD=./temp
INSTD="$(HOME)/Seafile/GBono Thesis"
TEXC=pdflatex
BIBC=biber
TEXOPT=-halt-on-error -output-directory=$(WD)
BIBOPT=-input-directory=$(WD) -output-directory=$(WD)
TRGT=cv-en.pdf long-cv-fr.pdf
DEP=$(wildcard ./icons/*.png)

all: $(TRGT)

install: $(TRGT)
	cp $< $(INSTD)

$(WD):
	mkdir -p $(WD)

%.pdf : %.tex $(DEP) | $(WD)
	$(TEXC) $(TEXOPT) $<
	$(TEXC) $(TEXOPT) $<
	mv $(WD)/$@ .

.PHONY: clean mrproper

clean:
	rm -rf $(WD)

mrproper: clean
	rm -rf $(TRGT)

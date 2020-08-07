WD=./temp
INSTD="$(HOME)/Seafile/GBono Thesis"
TEXC=pdflatex
OPT=-halt-on-error -output-directory=$(WD)
TRGT=cv-en.pdf
DEP=$(wildcard ./icons/*.png)

all: $(TRGT)

install: $(TRGT)
	cp $< $(INSTD)

%.pdf : %.tex $(DEP)
	mkdir -p $(WD)
	$(TEXC) $(OPT) $<
	mv $(WD)/$@ .

.PHONY: clean mrproper

clean:
	rm -rf $(WD)

mrproper: clean
	rm -rf $(TRGT)

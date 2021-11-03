COMPILE = latexmk
FLAGS = -pdf -shell-escape

RM = rm -rf

SRC = main.tex content.tex mydocstyle.sty $(wildcard assets/*)
OUT = terraform-provider-taikun-workshop

all: $(OUT).pdf

$(OUT).pdf: $(SRC)
	$(COMPILE) $(FLAGS) -jobname=$(OUT) $<

clean:
	$(RM) *.aux *.log *.nav *.toc *.snm *.out *.pyg _minted* *.fls *.fdb_latexmk *.bcf

distclean: $(clean)
	$(RM) $(OUT).pdf

.PHONY: clean

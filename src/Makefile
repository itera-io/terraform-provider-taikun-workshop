COMPILE = latexmk
FLAGS = -pdf -shell-escape

RM = rm -rf

SRC = intro.tex tasks.tex mydocstyle.sty $(wildcard assets/*)

SRC_UNIX = main_unix.tex setup_unix.tex $(SRC)
OUT_UNIX = terraform-taikun-workshop-unix

SRC_WIN = main_win.tex setup_win.tex $(SRC)
OUT_WIN = terraform-taikun-workshop-win

all: unix win

docker:
	DOCKER_BUILDKIT=1 docker build --rm --target bin --output . .

unix: $(OUT_UNIX).pdf

$(OUT_UNIX).pdf: $(SRC_UNIX)
	$(COMPILE) $(FLAGS) -jobname=$(OUT_UNIX) $<

win: $(OUT_WIN).pdf

$(OUT_WIN).pdf: $(SRC_WIN)
	$(COMPILE) $(FLAGS) -jobname=$(OUT_WIN) $<

clean:
	$(RM) *.dvi *.aux *.log *.nav *.toc *.snm *.out *.pyg _minted* *.fls *.fdb_latexmk *.bcf

distclean: $(clean)
	$(RM) $(OUT_UNIX).pdf $(OUT_WIN).pdf

.PHONY: clean distclean all unix win docker

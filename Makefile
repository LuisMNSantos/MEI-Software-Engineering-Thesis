.PHONY: main.pdf all clean

all: main.pdf

main.pdf: main.tex
	latexmk -r latexmk.rc -outdir=build -auxdir=build  -pdf -pdflatex="pdflatex -interaction=nonstopmode" -use-make main.tex
	@-mv ./build/main.pdf ./ 2>/dev/null  

clean:
	latexmk -r latexmk.rc -outdir=build -auxdir=build -C

clean-all:
	@-rm -Rf `biber --cache` # might return error if files do not exist; this will not work in windows...
	@-rm -rf ./build 2>/dev/null # might return error if files do not exist; this will not work in windows...

all:
	pdflatex index
	bibtex index
	pdflatex index
	pdflatex index
	mv index.pdf science-bayesian-theory.pdf

clean:
	rm -f *.aux *.bbl *.blg *.log *.out *.toc *.pdf
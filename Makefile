%.pdf: directory = $(shell dirname $*.tex) 

%.pdf: %.tex
	@echo "Reloading ...${directory}"
	@cd ${directory} &&                  \
		pdflatex -interaction=nonstopmode \
			-halt-on-error $(shell basename $*.tex)
	@open $*.pdf
	@osascript refresh-preview.scpt

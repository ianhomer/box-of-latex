%.pdf: directory = $(shell dirname $*.tex) 

%.pdf: %.tex
	@echo "Reloading ...${directory}"
	@pdflatex -output-directory=${directory} $*.tex \
		>/dev/null
	@open $*.pdf
	@osascript refresh-preview.scpt

%.pdf: directory = $(shell dirname $*.tex) 

%.pdf: %.tex
	@echo "Reloading ...${directory}"
	# Change into directory so that document class references work
	# Ignore lines with () in for the output (this is crude) way
	# of trying to see the error without noise
	@cd ${directory} &&                  \
		pdflatex -interaction=nonstopmode  \
			-halt-on-error $(shell basename $*.tex) | grep -v "[()]"
	@open $*.pdf
	@osascript refresh-preview.scpt

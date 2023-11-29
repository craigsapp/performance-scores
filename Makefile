##
## Programmer:    Craig Stuart Sapp <craig@ccrma.stanford.edu>
## Creation Date: Wed Nov 29 11:23:18 JST 2023
## Last Modified: Wed Nov 29 11:23:21 JST 2023
## Syntax:        GNU Makefile
##
## Description:   Makefile targets for example score preparation.
##

# Place humdrum score in the following directory
# And name the file like the directory, ending in ".krn":
EXAMPLE := chopin-op42

# Location of the processing scripts:
BINDIR = bin

# Reduction factor for limiting width of PNG images to 32768 pixels.
REDUCE = 4

.PHONY: $(EXAMPLE)

all:	svg midi png timeline

r: reduction
reduce: reduction
factor: reduction
f: reduction
reduction:
	$(BINDIR)/reduction-factor -v $(EXAMPLE)/$(EXAMPLE).svg


svg:
	$(BINDIR)/humdrum2svg $(EXAMPLE)/$(EXAMPLE).krn


midi:
	$(BINDIR)/humdrum2midi $(EXAMPLE)/$(EXAMPLE).krn


png:
	$(BINDIR)/svg2png -r $(REDUCE) $(EXAMPLE)/$(EXAMPLE).svg


t: timeline
time: timeline
timeline:
	$(BINDIR)/svg2timeline -r $(REDUCE) $(EXAMPLE)/$(EXAMPLE).svg > $(EXAMPLE)/$(EXAMPLE)-events.timeline
	$(BINDIR)/svg2timeline -b -r $(REDUCE) $(EXAMPLE)/$(EXAMPLE).svg > $(EXAMPLE)/$(EXAMPLE)-barlines.timeline


clean:
	-rm $(EXAMPLE)/$(EXAMPLE).svg
	-rm $(EXAMPLE)/$(EXAMPLE)*.png
	-rm $(EXAMPLE)/$(EXAMPLE).mid
	-rm $(EXAMPLE)/$(EXAMPLE)*.timeline



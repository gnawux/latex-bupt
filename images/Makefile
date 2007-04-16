
all:status mscs

status:spread-st.eps status.eps

spread-st.eps:spread-st.mp
	mpost spread-st.mp
	mptopdf spread-st
	cp -f spread-st.1 spread-st.eps
	
status.eps:status.mp
	mpost status.mp
	mptopdf status
	cp -f status.1 status.eps

mscs:msc-req.eps msc-rpt.eps msc-sdm.eps

msc-req.eps:msc-req.tex
	latex msc-req.tex
	dvips msc-req.dvi
	ps2eps -f msc-req.ps

msc-rpt.eps:msc-rpt.tex
	latex msc-rpt.tex
	dvips msc-rpt.dvi
	ps2eps -f msc-rpt.ps

msc-sdm.eps:msc-sdm.tex
	latex msc-sdm.tex
	dvips msc-sdm.dvi
	ps2eps -f msc-sdm.ps

clean:
	rm -f *.keep *.mpo *.aux *.dvi *.mpx *.log *.ps

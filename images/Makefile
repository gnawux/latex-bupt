
all:mpfig mscs

mpfig:spread-st.eps status.eps hash-overlap.eps hash-overview.eps luproto.eps tree.eps tree-leave.eps tree-join.eps

spread-st.eps:spread-st.mp
	mpost spread-st.mp
	mptopdf spread-st
	cp -f spread-st.1 spread-st.eps
	mv spread-st-1.pdf spread-st.pdf
	
status.eps:status.mp
	mpost status.mp
	mptopdf status
	cp -f status.1 status.eps
	mv status-1.pdf status.pdf

hash-overlap.eps:hash-overlap.mp
	mpost hash-overlap.mp
	mptopdf hash-overlap
	cp -f hash-overlap.1 hash-overlap.eps
	mv hash-overlap-1.pdf hash-overlap.pdf

hash-overview.eps:hash-overview.mp
	mpost hash-overview.mp
	mptopdf hash-overview
	cp -f hash-overview.1 hash-overview.eps
	mv hash-overview-1.pdf hash-overview.pdf

luproto.eps:luproto.mp
	mpost luproto.mp
	mptopdf luproto
	cp -f luproto.1 luproto.eps
	mv luproto-1.pdf luproto.pdf

tree.eps:tree.mp
	mpost tree.mp
	mptopdf tree
	cp -f tree.1 tree.eps
	mv tree-1.pdf tree.pdf

tree-leave.eps:tree-leave.mp
	mpost tree-leave.mp
	mptopdf tree-leave
	cp -f tree-leave.1 tree-leave.eps
	mv tree-leave-1.pdf tree-leave.pdf

tree-join.eps:tree-join.mp
	mpost tree-join.mp
	mptopdf tree-join
	cp -f tree-join.1 tree-join.eps
	mv tree-join-1.pdf tree-join.pdf

mscs:msc-req.eps msc-rpt.eps msc-sdm.eps

msc-req.eps:msc-req.tex
	latex msc-req.tex
	dvips msc-req.dvi
	ps2eps -f msc-req.ps
	epstopdf msc-req.eps

msc-rpt.eps:msc-rpt.tex
	latex msc-rpt.tex
	dvips msc-rpt.dvi
	ps2eps -f msc-rpt.ps
	epstopdf msc-rpt.eps

msc-sdm.eps:msc-sdm.tex
	latex msc-sdm.tex
	dvips msc-sdm.dvi
	ps2eps -f msc-sdm.ps
	epstopdf msc-sdm.eps

clean:
	rm -f *.keep *.mpo *.aux *.dvi *.mpx *.log *.ps *.1

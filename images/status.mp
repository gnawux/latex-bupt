input boxes

verbatimtex
%& latex
\documentclass{article}
\begin{document}
etex

vardef cuta(suffix a,b) expr p =
	drawarrow p cutbefore bpath.a cutafter bpath.b;
	point .5*length p of p enddef;

vardef cutadashed(suffix a,b) expr p =
	drawarrow p cutbefore bpath.a cutafter bpath.b dashed evenly;
	point .5*length p of p enddef;

vardef self@# expr p =
	cuta(@#,@#) @#.c{curl0}..@#.c+p..{curl0}@#.c enddef;

vardef drawshadowed(text t) =
	fixsize(t);
	forsuffixes s=t:
		fill bpath.s shifted (2pt,-2pt);
		unfill bpath.s;
		drawboxed(s);
	endfor
enddef;

vardef drawgrayed(text t) =
	fixsize(t);
	forsuffixes s=t:
		fill bpath.s withcolor .2[white,black];
		%unfill bpath.s;
		drawboxed(s);
	endfor
enddef;

beginfig(1);
	verbatimtex \def\stk#1#2{$\displaystyle{\matrix{#1\cr#2\cr}}$}etex
	circleit.as(btex \stk {Networked}{Serving} etex);
	circleit.cs(btex \stk {Charging}{Serving} etex);
	circleit.ar(btex \stk {Networked}{Ready} etex);
	circleit.ds(btex \stk {Isolated}{Serving} etex);
	circleit.dr(btex \stk {Isolated}{Ready} etex);
	circleit.idle(btex \strut Nothing etex);
	numeric hsep;
	ar.c-dr.c = as.c-ds.c = (hsep,0);
	ds.c-dr.c = as.c-ar.c = (0,.5hsep);
	cs.c-ds.c = (.5hsep,.3hsep);
	dr.c-idle.c = (0,.3hsep);
	xpart(as.e - ds.w) = 15cm;
	drawshadowed(as,ar,ds,dr);
	drawgrayed(cs,idle);
	label.ulft(btex \strut 4. context update etex, self.ds(-50pt,80pt));
	 label.urt(btex \strut 10. context update etex, self.as(50pt,80pt));
	 label.lrt(btex \strut 7. context update etex, self.ar(50pt,-80pt));
	
	 label.top(btex \strut 11. neighbor discovered or attaching to network etex, cuta(ds,as) ds.c{dir15}..as.c);
	 label.bot(btex \strut 12. disconnecting, continue locally etex, cuta(as,ds) as.c..{dir165}ds.c);
	 label.ulft(btex \begin{tabular}{r}13. disconnecting, \\ application terminated \end{tabular} etex, cuta(as,dr) as.c..dr.c);
	 label.top(btex \strut 5. neighbor discovered or attaching to network etex, cuta(dr,ar) dr.c{dir15}..ar.c);
	 label.bot(btex \strut 6. disconnecting etex, cuta(ar,dr) ar.c..{dir165}dr.c);

	 label.lft(btex \strut 2. user/context trigger etex, cuta(dr,ds) dr.c{dir120}..ds.c);
	  label.rt(btex \strut 3. terminate etex, cuta(ds,dr) ds.c..{dir240}dr.c);

	 label.lft(btex \begin{tabular}{r} 8. user, network, or\\context trigger\end{tabular} etex, cuta(ar,as) ar.c{dir120}..as.c);
	  label.rt(btex \strut 9. terminate etex, cuta(as,ar) as.c..{dir240}ar.c);

	 label.lft(btex \strut 1. user's mind etex, cuta(idle,dr) idle.c..dr.c);
	  label.rt(btex \strut etex, cuta(dr,idle) dr.c..idle.c);

	 label.lrt(btex \strut 14. charging with network, others locally etex, cutadashed(ds,cs) ds.c{dir50}..cs.c);
endfig;

verbatimtex
\end{document}
etex

end

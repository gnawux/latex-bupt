input boxes

verbatimtex 
%&latex
\documentclass{article}
\usepackage{CJK}
\begin{document}
\begin{CJK}{GBK}{song}
etex

u:=10mm;

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

def draw_point(expr P, colInt, colPer) =
	  fill fullcircle scaled 0.2u shifted P withcolor colInt;
	  draw fullcircle scaled 0.2u shifted P withcolor colPer;
enddef;

path c,hc;
c = fullcircle scaled 15u;
hc = fullcircle scaled 15u rotated 270;

beginfig(1);

	pair sau,sal,sbu,sbl,eye,sa,sb,olcenter,actr,bctr;
	sa  = point 0.025*length c of c;
	sau = point 0.1*length c of c;
	sal = point 0.95*length c of c;
	sb  = point 0.925*length c of c;
	sbu = point 0.0*length c of c;
	sbl = point 0.85*length c of c;
	eye = center c;

	path psa,psb,psab,cl,cll,ca,cb;
	psa  = buildcycle(eye--sau,eye--sal,hc);
	psb  = buildcycle(eye--sbl,eye--sbu,hc);
	psab = buildcycle(eye--sal,eye--sbu,hc);

	cl  = fullcircle scaled 14u rotated 270;
	cll = fullcircle scaled 3u rotated 270;
	ca  = cl  cutbefore psa cutafter psa;
	cb  = cll cutbefore psb cutafter psb;

    fill psa withcolor .9white;
    fill psb withcolor .9white;
    fill psab withcolor .6white;

	draw c;

	draw_point(sa,white,black);
	label.rt(btex \parbox{3em}{节点~A} etex, sa);

	draw_point(sb,white,black);
	label.lrt(btex \parbox{3em}{节点~B} etex, sb);

	olcenter=center psab shifted (1.5u,0.5u);
	picture ablabel,alabel,blabel;
	ablabel=thelabel(btex \parbox{5em}{A~和~B~的交叠范围} etex, olcenter);
	unfill bbox ablabel;
	draw ablabel;

	drawarrow  ca;
	alabel=thelabel.lft(btex \parbox{3em}{A~的覆盖范围} etex, point 0.6*length ca of ca);
	unfill bbox alabel;
	draw alabel;
	drawarrow cb;
	blabel=thelabel.lrt(btex \parbox{3em}{b~的覆盖范围} etex, point 0.6*length cb of cb);
	unfill bbox blabel;
	draw blabel;

endfig;

verbatimtex
\end{CJK}
\end{document}
etex

end

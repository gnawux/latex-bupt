input boxes

verbatimtex 
%&latex
\documentclass{article}
\usepackage{CJK}
\begin{document}
\begin{CJK}{GBK}{song}
etex

u:=8mm;

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
	  fill fullcircle scaled 0.8u shifted P withcolor colInt;
	  draw fullcircle scaled 0.8u shifted P withcolor colPer;
enddef;

vardef init_circle(expr p,pos) =
	draw p;
	draw_point(point pos*length p of p,white,red);
	point pos*length p of p enddef;

path c[];
c0 = fullcircle scaled 15u rotated 270 shifted (17u,0);
c1 = fullcircle scaled 15u rotated 270;

pair entd[],ents[];
	entd0  = point 0.01*length c0 of c0;
	entd1  = point 0.02*length c0 of c0;
	entd2  = point 0.06*length c0 of c0;
	entd3  = point 0.07*length c0 of c0;
	entd4  = point 0.09*length c0 of c0;
	entd5  = point 0.11*length c0 of c0;
	entd6  = point 0.13*length c0 of c0;
	entd7  = point 0.17*length c0 of c0;
	entd8  = point 0.22*length c0 of c0;
	entd9  = point 0.23*length c0 of c0;
	entd10 = point 0.30*length c0 of c0;
	entd11 = point 0.34*length c0 of c0;
	entd12 = point 0.37*length c0 of c0;
	entd13 = point 0.38*length c0 of c0;
	entd14 = point 0.39*length c0 of c0;
	entd15 = point 0.40*length c0 of c0;

	ents0  = point 0.01*length c1 of c1;
	ents1  = point 0.02*length c1 of c1;
	ents2  = point 0.06*length c1 of c1;
	ents3  = point 0.07*length c1 of c1;
	ents4  = point 0.09*length c1 of c1;
	ents5  = point 0.11*length c1 of c1;
	ents6  = point 0.13*length c1 of c1;
	ents7  = point 0.17*length c1 of c1;
	ents8  = point 0.22*length c1 of c1;
	ents9  = point 0.23*length c1 of c1;
	ents10 = point 0.30*length c1 of c1;
	ents11 = point 0.34*length c1 of c1;
	ents12 = point 0.37*length c1 of c1;
	ents13 = point 0.38*length c1 of c1;
	ents14 = point 0.39*length c1 of c1;
	ents15 = point 0.40*length c1 of c1;

beginfig(1);
	path  a[];
	a0=buildcycle((center c0)--entd5,(center c0)--entd10,c0);
	a1=buildcycle((center c1)--ents2,(center c1)--ents12,c1);
	fill a0 withcolor .8 white;
	fill a1 withcolor .8 white;
	picture lab[];
	lab0=thelabel.urt(btex \parbox{6em}{距离~A~较近的~R~个条目} etex, center a0);
	lab1=thelabel.urt(btex \parbox{6em}{距离~A~较近的~R~个条目} etex, center a1);
	unfill bbox lab0;
	unfill bbox lab1;
	draw lab0;
	draw lab1;

	label.lrt(btex 高级节点~A etex, init_circle(c0,0.2));
	label.lrt(btex 高级节点~A etex, init_circle(c1,0.2));
	pickup pencircle scaled 10pt;
	for t=0 upto 15:
		draw entd[t];
	endfor
	for t=0 upto 7:
		draw ents[2*t];
	endfor
	label.urt(btex 目录条目 etex, ents10);
endfig;

verbatimtex
\end{CJK}
\end{document}
etex

end

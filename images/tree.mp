input boxes

verbatimtex 
%&latex
\documentclass{article}
\usepackage{CJK}
\begin{document}
\begin{CJK}{GBK}{song}
etex

vardef cutl(suffix a,b) expr p =
	draw p cutbefore bpath.a cutafter bpath.b;
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
	circleit.mpn(btex \parbox{2em}{存在} etex);
	circleit.ga(btex \parbox{2em}{存在} etex);
	circleit.gb(btex \parbox{2em}{存在} etex);
	circleit.gc(btex \parbox{2em}{存在} etex);
	circleit.gaa(btex \parbox{2em}{存在} etex);
	circleit.gab(btex \parbox{2em}{存在} etex);
	circleit.gba(btex \parbox{2em}{存在} etex);
	circleit.gca(btex \parbox{2em}{存在} etex);
	circleit.gcb(btex \parbox{2em}{存在} etex);
	circleit.n1(btex \parbox{2em}{存在} etex);
	circleit.n2(btex \parbox{2em}{存在} etex);
	circleit.n3(btex \parbox{2em}{存在} etex);
	circleit.n4(btex \parbox{2em}{存在} etex);
	circleit.n5(btex \parbox{2em}{存在} etex);
	circleit.n6(btex \parbox{2em}{存在} etex);
	circleit.n7(btex \parbox{2em}{存在} etex);
	circleit.n8(btex \parbox{2em}{存在} etex);
	circleit.n9(btex \parbox{2em}{存在} etex);
	circleit.n10(btex \parbox{2em}{存在} etex);
	circleit.n11(btex \parbox{2em}{存在} etex);
	circleit.n12(btex \parbox{2em}{存在} etex);
	numeric hsep;
	for t=1 upto 11:
	 n[t+1].c - n[t].c = (hsep,0);
	endfor
	gaa.c-n2.c = (0,hsep);
	gab.c-n4.c = (0.5hsep,hsep);
	gba.c-n7.c = (0,hsep);
	gca.c-n9.c = (0.5hsep,hsep);
	gcb.c-n11.c = (0.5hsep,hsep);
	ga.c-n3.c=(0,2hsep);
	gb.c-n7.c=(0,2hsep);
	gc.c-n10.c=(0.5hsep,2hsep);
	mpn.c-n6.c=(0.5hsep,3.5hsep);
	xpart(n12.e - n1.w) = 20cm;

	drawgrayed(n1,n2,n3,n4,n5,n6,n7,n8,n9,n10,n11,n12);
	label.lft(btex \parbox{3em}{节点：} etex, n1.w);
	drawboxed(gaa);
	draw cutl(n1,gaa) n1.c--gaa.c;
	draw cutl(n2,gaa) n2.c--gaa.c;
	draw cutl(n3,gaa) n3.c--gaa.c;
	drawboxed(gab);
	draw cutl(n4,gab) n4.c--gab.c;
	draw cutl(n5,gab) n5.c--gab.c;
	drawboxed(gba);
	draw cutl(n6,gba) n6.c--gba.c;
	draw cutl(n7,gba) n7.c--gba.c;
	draw cutl(n8,gba) n8.c--gba.c;
	drawboxed(gca);
	draw cutl(n9,gca) n9.c--gca.c;
	draw cutl(n10,gca) n10.c--gca.c;
	drawboxed(gcb);
	draw cutl(n11,gcb) n11.c--gcb.c;
	draw cutl(n12,gcb) n12.c--gcb.c;
	label.lft(btex \parbox{4em}{二级组:} etex,gaa.w);
	drawboxed(ga);
	draw cutl(gaa,ga) gaa.c--ga.c;
	draw cutl(gab,ga) gab.c--ga.c;
	drawboxed(gb);
	draw cutl(gba,gb) gba.c--gb.c;
	drawboxed(gc);
	draw cutl(gca,gc) gca.c--gc.c;
	draw cutl(gcb,gc) gcb.c--gc.c;
	label.lft(btex \parbox{4em}{一级组:} etex,ga.w);
	drawboxed(mpn);
	draw cutl(ga,mpn) ga.c--mpn.c;
	draw cutl(gb,mpn) gb.c--mpn.c;
	draw cutl(gc,mpn) gc.c--mpn.c;
	label.lft(btex \parbox{8em}{移动个人网络:} etex,mpn.w);

	%label.top(btex \parbox{2em}{\centering 开始} etex, cuta(start,empty) start.c..empty.c);
	%label.llft(btex \parbox{5em}{\centering 接收到目录更新消息} etex, cuta(empty,receive) empty.c{dir300}..receive.c);
	%label.lft(btex \parbox{5em}{\centering 接收到目录更新消息} etex, cuta(data,receive) data.c{dir225}..receive.c);
	%label.rt(btex \parbox{4em}{\centering 重新设定定时器} etex, cuta(receive,data) receive.c{dir45}..data.c);
	%label.lft(btex \parbox{4em}{\centering 重新设定定时器} etex, cuta(sent,data) sent.c{dir225}..data.c);
	%label.rt(btex \parbox{5em}{\centering 定时器溢出} etex, cuta(data,sent) data.c{dir45}..sent.c);
	
endfig;

verbatimtex
\end{CJK}
\end{document}
etex

end

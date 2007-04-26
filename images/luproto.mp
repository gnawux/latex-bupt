input boxes

verbatimtex 
%&latex
\documentclass{article}
\usepackage{CJK}
\begin{document}
\begin{CJK}{GBK}{song}
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
	circleit.ua(btex 应用 etex);
	circleit.sa(btex 服务 etex);
	circleit.da(btex 目录 etex);
	numeric hsep;
	sa.c - ua.c = (hsep,0);
	sa.c - da.c = (0.5hsep,0.8hsep);
	xpart(sa.e-ua.w) = 6cm;
	drawshadowed(sa,ua,da);
	label.llft(btex \parbox{2em}{查询响应} etex, cuta(da,ua) da.c{dir180}..ua.c);
	label.llft(btex \parbox{2em}{目录查询} etex, cuta(ua,da) ua.c{dir0}..{dir270}da.c);
	label.lrt(btex \parbox{2em}{注册确认} etex, cutadashed(da,sa) da.c{dir0}..sa.c);
	label.lrt(btex \parbox{2em}{服务注册} etex, cutadashed(sa,da) sa.c{dir180}..{dir270}da.c);

%	label.top(btex \parbox{2em}{\centering 开始} etex, cuta(start,empty) start.c..empty.c);
%	label.llft(btex \parbox{5em}{\centering 接收到目录更新消息} etex, cuta(empty,receive) empty.c{dir300}..receive.c);
%	label.lft(btex \parbox{5em}{\centering 接收到目录更新消息} etex, cuta(data,receive) data.c{dir225}..receive.c);
%	label.rt(btex \parbox{4em}{\centering 重新设定定时器} etex, cuta(receive,data) receive.c{dir45}..data.c);
%	label.lft(btex \parbox{4em}{\centering 重新设定定时器} etex, cuta(sent,data) sent.c{dir225}..data.c);
%	label.rt(btex \parbox{5em}{\centering 定时器溢出} etex, cuta(data,sent) data.c{dir45}..sent.c);
	
endfig;

verbatimtex
\end{CJK}
\end{document}
etex

end

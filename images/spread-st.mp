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
	circleit.start(btex \parbox{2em}{开始} etex);
	circleit.empty(btex \parbox{6em}{\centering \textbf{无数据}\\等待目录更新消息} etex);
	circleit.data(btex \parbox{8em}{\centering \textbf{有数据}\\等待定时器溢出} etex);
	circleit.receive(btex \parbox{6em}{\centering \textbf{接收更新}\\更新目录数据} etex);
	circleit.sent(btex \parbox{6em}{\centering \textbf{发送更新}\\发送目录更新} etex);
	numeric hsep;
	empty.c-start.c=(0.6hsep,0);
	data.c-empty.c = (hsep,0);
	sent.c-data.c  = (0,0.6hsep);
	data.c-receive.c = (0,0.6hsep);
	xpart(data.e - empty.w) = 10cm;
	drawboxed(empty,data,receive,sent);
	drawgrayed(start);
%	drawshadowed(as,ar,ds,dr);
%	drawgrayed(cs,idle);
	label.top(btex \parbox{2em}{\centering 开始} etex, cuta(start,empty) start.c..empty.c);
	label.llft(btex \parbox{5em}{\centering 接收到目录更新消息} etex, cuta(empty,receive) empty.c{dir300}..receive.c);
	label.lft(btex \parbox{5em}{\centering 接收到目录更新消息} etex, cuta(data,receive) data.c{dir225}..receive.c);
	label.rt(btex \parbox{4em}{\centering 重新设定定时器} etex, cuta(receive,data) receive.c{dir45}..data.c);
	label.lft(btex \parbox{4em}{\centering 重新设定定时器} etex, cuta(sent,data) sent.c{dir225}..data.c);
	label.rt(btex \parbox{5em}{\centering 定时器溢出} etex, cuta(data,sent) data.c{dir45}..sent.c);
	
endfig;

verbatimtex
\end{CJK}
\end{document}
etex

end

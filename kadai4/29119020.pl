%rep03: 第03回 演習課題レポート
%2019年05月13日 by 29119020 名前:下村理雄
%
%練習3,8 関係subを定義するプログラム(テキスト79ページ)
% [述語の説明]
%subs(Set,Subset):部分集合関係を調べ、与えられた集合の可能な部分集合をすべて生成する。
subs([],[]).
subs([First|Rest],[First|Sub]) :-
	subs(Rest,Sub).
subs([First|Rest],Sub) :-
	subs(Rest,Sub).
/*
 (実行例)
?- subs([a,b,c],[b,c]).
   Call: (8) subs([a, b, c], [b, c]) ? creep
   Call: (9) subs([b, c], [b, c]) ? creep
   Call: (10) subs([c], [c]) ? creep
   Call: (11) subs([], []) ? creep
   Exit: (11) subs([], []) ? creep
   Exit: (10) subs([c], [c]) ? creep
   Exit: (9) subs([b, c], [b, c]) ? creep
   Exit: (8) subs([a, b, c], [b, c]) ? creep
true .

?- subs([a,b],S).
   Call: (8) subs([a, b], _4782) ? creep
   Call: (9) subs([b], _4998) ? creep
   Call: (10) subs([], _5004) ? creep
   Exit: (10) subs([], []) ? creep
   Exit: (9) subs([b], [b]) ? creep
   Exit: (8) subs([a, b], [a, b]) ? creep
S = [a, b] ;
   Redo: (9) subs([b], _4998) ? creep
   Call: (10) subs([], _4998) ? creep
   Exit: (10) subs([], []) ? creep
   Exit: (9) subs([b], []) ? creep
   Exit: (8) subs([a, b], [a]) ? creep
S = [a] ;
   Redo: (8) subs([a, b], _4782) ? creep
   Call: (9) subs([b], _4782) ? creep
   Call: (10) subs([], _4998) ? creep
   Exit: (10) subs([], []) ? creep
   Exit: (9) subs([b], [b]) ? creep
   Exit: (8) subs([a, b], [b]) ? creep
S = [b] ;
   Redo: (9) subs([b], _4782) ? creep
   Call: (10) subs([], _4782) ? creep
   Exit: (10) subs([], []) ? creep
   Exit: (9) subs([b], []) ? creep
   Exit: (8) subs([a, b], []) ? creep
S = [].

[説明, 考察, 評価]
部分集合を調べるのにその条件を考える。
空集合と空集合は部分集合であることである。次に、頭部が等しいことを調べる。頭部が等しい場合は、Setの尾部とSubsetの尾部について再帰的に行う。また、頭部が等しくない場合は、Setの尾部とSubsetについて再帰的に行う。以上を行うことで、部分集合であるか調べることができる。

次に部分集合である組み合わせについて述べる。
この組み合わせは、Firstに何を保存するかで決まる。例えば、[a,b,c]を考える場合、Firstに[a]だけ保存される場合、[a]が部分集合であることがわかる。また、Firstに[a,c]が保存されれば、[a,c]が部分集合である組み合わせとなる。
*/

%練習3,11 Listを平滑化するプログラム(テキスト80ページ)
% [述語の説明]
%flat(List,FlatList):Listはリストのリストで，FlatListはListの部分リスト(またはそのまた部分リスト)の要素が平板なリストとなるように，Listを平滑化したもの。
%conc(L1,L2,L3):リストL1とリストL2を連接し、リストL3を作る
conc([],L2,L2).
conc([X|L1],L2,[X|L3]) :- conc(L1,L2,L3).
flat([Head|Tail],FlatList) :-
	flat(Head,FlatHead),
	flat(Tail,FlatTail),
	conc(FlatHead,FlatTail,FlatList).
flat([],[]).
flat(X,[X]).
/*
 (実行例)
?- flat([a,b,[c,d]],L).
   Call: (8) flat([a, b, [c, d]], _16072) ? creep
   Call: (9) flat(a, _16322) ? creep
   Exit: (9) flat(a, [a]) ? creep
   Call: (9) flat([b, [c, d]], _16328) ? creep
   Call: (10) flat(b, _16328) ? creep
   Exit: (10) flat(b, [b]) ? creep
   Call: (10) flat([[c, d]], _16334) ? creep
   Call: (11) flat([c, d], _16334) ? creep
   Call: (12) flat(c, _16334) ? creep
   Exit: (12) flat(c, [c]) ? creep
   Call: (12) flat([d], _16340) ? creep
   Call: (13) flat(d, _16340) ? creep
   Exit: (13) flat(d, [d]) ? creep
   Call: (13) flat([], _16346) ? creep
   Exit: (13) flat([], []) ? creep
   Call: (13) conc([d], [], _16348) ? creep
   Call: (14) conc([], [], _16332) ? creep
   Exit: (14) conc([], [], []) ? creep
   Exit: (13) conc([d], [], [d]) ? creep
   Exit: (12) flat([d], [d]) ? creep
   Call: (12) conc([c], [d], _16354) ? creep
   Call: (13) conc([], [d], _16338) ? creep
   Exit: (13) conc([], [d], [d]) ? creep
   Exit: (12) conc([c], [d], [c, d]) ? creep
   Exit: (11) flat([c, d], [c, d]) ? creep
   Call: (11) flat([], _16358) ? creep
   Exit: (11) flat([], []) ? creep
   Call: (11) conc([c, d], [], _16360) ? creep
   Call: (12) conc([d], [], _16344) ? creep
   Call: (13) conc([], [], _16350) ? creep
   Exit: (13) conc([], [], []) ? creep
   Exit: (12) conc([d], [], [d]) ? creep
   Exit: (11) conc([c, d], [], [c, d]) ? creep
   Exit: (10) flat([[c, d]], [c, d]) ? creep
   Call: (10) conc([b], [c, d], _16372) ? creep
   Call: (11) conc([], [c, d], _16356) ? creep
   Exit: (11) conc([], [c, d], [c, d]) ? creep
   Exit: (10) conc([b], [c, d], [b, c, d]) ? creep
   Exit: (9) flat([b, [c, d]], [b, c, d]) ? creep
   Call: (9) conc([a], [b, c, d], _16072) ? creep
   Call: (10) conc([], [b, c, d], _16362) ? creep
   Exit: (10) conc([], [b, c, d], [b, c, d]) ? creep
   Exit: (9) conc([a], [b, c, d], [a, b, c, d]) ? creep
   Exit: (8) flat([a, b, [c, d]], [a, b, c, d]) ? creep
L = [a, b, c, d] .

[説明, 考察, 評価]
今回のプログラムの説明をする。
まず、Listの頭部から順番にFlatHeadに保存する。また、Listの尾部についてもFlatTailに保存する。最後に、FlatHeadとFlatTailを結合したFlatListに保存する。また、空リストとリストでないものを平滑化する。
*/
%練習3,12 オペレータの定義プログラム(テキスト85ページ)
:- op(300,xfx,plays).
:- op(200,xfy,and).
/*
 (実行例)
 ?- Term2 = plays(he,and(tennis,baseball)).
Term2 = he plays tennis and baseball.

?- Term1 = plays(she,and(firefox,chrome)).
Term1 = she plays firefox and chrome.

[説明, 考察, 評価]
上記の実行例の通り、Term1である"he plays tennis and baseball."は、plays(he,and(tennis,baseball)).と解釈される。また、"she plays firefox and chrome"は、plays(she,and(firefox,chrome)).と解釈される。
*/

%練習3,21 (テキストページ)
% [述語の説明]
%bet(N1,N2,X):制約N1≦X≦N2を満たすすべての整数Xを生成する
bet(N1,N2,N1) :-
	N1=<N2.
bet(N1,N2,X) :-
	N1<N2,
	NewN1 is N1+1,
	bet(NewN1,N2,X).
/*
 (実行例)
?- bet(1,2,X).
   Call: (8) bet(1, 2, _27698) ? creep
   Call: (9) 1=<2 ? creep
   Exit: (9) 1=<2 ? creep
   Exit: (8) bet(1, 2, 1) ? creep
X = 1 ;
   Redo: (8) bet(1, 2, _27698) ? creep
   Call: (9) 1<2 ? creep
   Exit: (9) 1<2 ? creep
   Call: (9) _27924 is 1+1 ? creep
   Exit: (9) 2 is 1+1 ? creep
   Call: (9) bet(2, 2, _27698) ? creep
   Call: (10) 2=<2 ? creep
   Exit: (10) 2=<2 ? creep
   Exit: (9) bet(2, 2, 2) ? creep
   Exit: (8) bet(1, 2, 2) ? creep
X = 2 ;
   Redo: (9) bet(2, 2, _27698) ? creep
   Call: (10) 2<2 ? creep
   Fail: (10) 2<2 ? creep
   Fail: (9) bet(2, 2, _27698) ? creep
   Fail: (8) bet(1, 2, _27698) ? creep
false.

?- bet(1,3,3).
   Call: (8) bet(1, 3, 3) ? creep
   Call: (9) 1<3 ? creep
   Exit: (9) 1<3 ? creep
   Call: (9) _276 is 1+1 ? creep
   Exit: (9) 2 is 1+1 ? creep
   Call: (9) bet(2, 3, 3) ? creep
   Call: (10) 2<3 ? creep
   Exit: (10) 2<3 ? creep
   Call: (10) _282 is 2+1 ? creep
   Exit: (10) 3 is 2+1 ? creep
   Call: (10) bet(3, 3, 3) ? creep
   Call: (11) 3=<3 ? creep
   Exit: (11) 3=<3 ? creep
   Exit: (10) bet(3, 3, 3) ? creep
   Exit: (9) bet(2, 3, 3) ? creep
   Exit: (8) bet(1, 3, 3) ? creep
true .

[説明, 考察, 評価]
今回のプログラムの説明をする。
まず、N1≦N2であることを満たすため、一つ目の関係を定義。
次に、bet(N1,N2,X)について、N1<N2である必要があり、もし真であるなら変数NewN1はN1+1であると定義する。その後、NewN1≦X≦N2について、再帰的に行う。
*/

%練習3,9別解 練習3.9の別解のプログラム
% [述語の説明]
%dividelist2(F,G,H):リストFをほぼ同じ長さでリストGとリストHに分割する
%len(L,LN):Lの長さはLNである。
len([],0).
len([_|Tail],N) :-
	len(Tail,N1),
	N is 1 + N1.
dividelist2(List,L1,L2) :-
	conc(L1,L2,List),
	len(L1,N1),
	len(L2,N2),
	N1>=1,
	N2>=1,
	N1>=N2.
/*
 (実行例)
?- dividelist2([a,b,c],X,Y).
   Call: (32) dividelist2([a, b, c], _29020, _29022) ? creep
   Call: (33) conc(_29020, _29022, [a, b, c]) ? creep
   Exit: (33) conc([], [a, b, c], [a, b, c]) ? creep
   Call: (33) len([], _29306) ? creep
   Exit: (33) len([], 0) ? creep
   Call: (33) len([a, b, c], _29306) ? creep
   Call: (34) len([b, c], _29306) ? creep
   Call: (35) len([c], _29306) ? creep
   Call: (36) len([], _29306) ? creep
   Exit: (36) len([], 0) ? creep
   Call: (36) _29310 is 1+0 ? creep
   Exit: (36) 1 is 1+0 ? creep
   Exit: (35) len([c], 1) ? creep
   Call: (35) _29316 is 1+1 ? creep
   Exit: (35) 2 is 1+1 ? creep
   Exit: (34) len([b, c], 2) ? creep
   Call: (34) _29322 is 1+2 ? creep
   Exit: (34) 3 is 1+2 ? creep
   Exit: (33) len([a, b, c], 3) ? creep
   Call: (33) 0>=1 ? creep
   Fail: (33) 0>=1 ? creep
   Redo: (33) conc(_29020, _29022, [a, b, c]) ? creep
   Call: (34) conc(_29292, _29022, [b, c]) ? creep
   Exit: (34) conc([], [b, c], [b, c]) ? creep
   Exit: (33) conc([a], [b, c], [a, b, c]) ? creep
   Call: (33) len([a], _29312) ? creep
   Call: (34) len([], _29312) ? creep
   Exit: (34) len([], 0) ? creep
   Call: (34) _29316 is 1+0 ? creep
   Exit: (34) 1 is 1+0 ? creep
   Exit: (33) len([a], 1) ? creep
   Call: (33) len([b, c], _29318) ? creep
   Call: (34) len([c], _29318) ? creep
   Call: (35) len([], _29318) ? creep
   Exit: (35) len([], 0) ? creep
   Call: (35) _29322 is 1+0 ? creep
   Exit: (35) 1 is 1+0 ? creep
   Exit: (34) len([c], 1) ? creep
   Call: (34) _29328 is 1+1 ? creep
   Exit: (34) 2 is 1+1 ? creep
   Exit: (33) len([b, c], 2) ? creep
   Call: (33) 1>=1 ? creep
   Exit: (33) 1>=1 ? creep
   Call: (33) 2>=1 ? creep
   Exit: (33) 2>=1 ? creep
   Call: (33) 1>=2 ? creep
   Fail: (33) 1>=2 ? creep
   Redo: (34) conc(_29292, _29022, [b, c]) ? creep
   Call: (35) conc(_29298, _29022, [c]) ? creep
   Exit: (35) conc([], [c], [c]) ? creep
   Exit: (34) conc([b], [c], [b, c]) ? creep
   Exit: (33) conc([a, b], [c], [a, b, c]) ? creep
   Call: (33) len([a, b], _29318) ? creep
   Call: (34) len([b], _29318) ? creep
   Call: (35) len([], _29318) ? creep
   Exit: (35) len([], 0) ? creep
   Call: (35) _29322 is 1+0 ? creep
   Exit: (35) 1 is 1+0 ? creep
   Exit: (34) len([b], 1) ? creep
   Call: (34) _29328 is 1+1 ? creep
   Exit: (34) 2 is 1+1 ? creep
   Exit: (33) len([a, b], 2) ? creep
   Call: (33) len([c], _29330) ? creep
   Call: (34) len([], _29330) ? creep
   Exit: (34) len([], 0) ? creep
   Call: (34) _29334 is 1+0 ? creep
   Exit: (34) 1 is 1+0 ? creep
   Exit: (33) len([c], 1) ? creep
   Call: (33) 2>=1 ? creep
   Exit: (33) 2>=1 ? creep
   Call: (33) 1>=1 ? creep
   Exit: (33) 1>=1 ? creep
   Call: (33) 2>=1 ? creep
   Exit: (33) 2>=1 ? creep
   Exit: (32) dividelist2([a, b, c], [a, b], [c]) ? creep
X = [a, b],
Y = [c] .

[説明, 考察, 評価]
今回のプログラムの説明をする。
Listを分割するために、concを用いてL1とL2を結合した結果がListになるようなListを探索する。その後、L1、L2は両者空リストではなく、かつ、リストL1の長さはリストL2より等しいか大きくなるようにした。
*/
